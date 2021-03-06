package a2team.yang.jae.action.controller;

import java.io.IOException;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import a2team.yang.jae.action.service.PaymentService;
import a2team.yang.jae.project.service.ProjectService;

/**
 * Handles requests for the application home page.
 */
/*@RequestMapping(value = "/view")*/
@Controller
public class PaymentController {

	private static final Logger logger = LoggerFactory
			.getLogger(PaymentController.class);

	@Autowired
	private PaymentService paymentService;
	
	@Autowired
	private ProjectService projectService;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
/*	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(HttpServletRequest req, Model model, @RequestParam Map map) {
		
		List members = memberService.getAllMember(map);
		//hgygty

		model.addAttribute("members", members);

		return "member/member_list";
	}*/

	@RequestMapping(value = "/action/paymentStep1", method = RequestMethod.GET)
	public String paymentStep1(Locale locale, Model model, @RequestParam Map map) {
		logger.info("Welcome payment test! The client locale is {}.", locale);

		List poption = projectService.getAllOption(map);
		model.addAttribute("poption", poption);
		
		
		
		return "/action/paymentStep1";
	}

	
	@RequestMapping(value = "/action/paymentStep2", method = {RequestMethod.POST, RequestMethod.GET })
	public String paymentStep2(Locale locale, Model model, @RequestParam Map map, HttpSession session) {
		logger.info("Welcome payment test! The client locale is {}.", locale);

		
	    if(session.getAttribute("email")==null)   {
	     
	    	return "redirect:/";
	   } else {
	    
		   
		   map.put("p_seq", session.getAttribute("p_seq"));
		
		List poption = projectService.getAllOption(map);
		model.addAttribute("poption", poption);

		List mains = projectService.getAllMain(map);
		model.addAttribute("mains", mains);
		
		List projectdata = paymentService.getProjectData(map);
		model.addAttribute("projectdata", projectdata);
		
		List payinfo = paymentService.getPayInfo(map);
		model.addAttribute("payinfo", payinfo);


		return "/action/paymentStep2";

	}
		
	}

	@RequestMapping(value = "/action/paymentStep3",  method = {RequestMethod.POST, RequestMethod.GET })
	public String paymentStep3(Locale locale, Model model, @RequestParam Map map, HttpSession session) {
		logger.info("Welcome payment test! The client locale is {}.", locale);
		
		   map.put("m_seq", session.getAttribute("m_seq"));
		   map.put("seq", session.getAttribute("p_seq"));
		   map.put("p_seq", session.getAttribute("p_seq"));
		   map.put("option_no", session.getAttribute("option_no"));
		   map.put("pay_money", session.getAttribute("pay_money"));
		   map.put("o_description", session.getAttribute("o_description"));
		   
		
		List poption = projectService.getAllOption(map);
		model.addAttribute("poption", poption);

		List mains = projectService.getAllMain(map);
		model.addAttribute("mains", mains);
	
		List projectdata = paymentService.getProjectData(map);
		model.addAttribute("projectdata", projectdata);
		
		
		
		paymentService.insertPayment(map);

		
		
		return "/action/paymentComplete";
	}
	
	@RequestMapping(value = "/action/paymentComplete",  method = {RequestMethod.POST, RequestMethod.GET })
	public String paymentStepProcess(Locale locale, Model model, @RequestParam Map map, HttpServletRequest request, HttpSession session) {
		logger.info("Welcome payment test! The client locale is {}.", locale);
		
		
	    if(session.getAttribute("email")==null)   {
	     
	    	return "redirect:/";
	   } else {
	    
		
		   map.put("m_seq", session.getAttribute("m_seq"));
		   map.put("seq", session.getAttribute("p_seq"));
		   map.put("p_seq", session.getAttribute("p_seq"));
		   map.put("option_no", session.getAttribute("option_no"));
		   map.put("pay_money", session.getAttribute("pay_money"));
		   map.put("o_description", session.getAttribute("o_description"));
		   
		
		List poption = projectService.getAllOption(map);
		model.addAttribute("poption", poption);

		List mains = projectService.getAllMain(map);
		model.addAttribute("mains", mains);

		List projectdata = paymentService.getProjectData(map);
		model.addAttribute("projectdata", projectdata);
		
		
	
		return "/action/paymentStep3";
	}

	}

	/*@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(Locale locale, Model model, @RequestParam Map map) {
		
		try {
			logger.info("Welcome MemberInsertTest! The client locale is {}.",
					locale);

			int count = memberService.testTransaction(map);
//			int count = memberService.insertMember(map);
			
			if (0 < count) {
				model.addAttribute("success_flag", "Y");
			} else {
				model.addAttribute("success_flag", "N");
			}
			model.addAttribute("forward_url", "/member/list");
			
		} catch (Exception e) {
			logger.info(e.getMessage());
			model.addAttribute("success_flag", "N");
			model.addAttribute("forward_url", "/member/list");
		} finally {
		}
		return "common/common_alert";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(Locale locale, Model model, @RequestParam Map map) {
		logger.info("Welcome MemberDetailTest! The client locale is {}.", locale);
		
		List members = memberService.getAllMember(map);

		model.addAttribute("member", members.get(0));
		
		return "member/member_detail";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Locale locale, Model model, @RequestParam Map map) {
		try {
			logger.info("Welcome MemberUpdateTest! The client locale is {}.",
					locale);

			int count = memberService.updateMember(map);
			
			if (0 < count) {
				model.addAttribute("success_flag", "Y");
			} else {
				model.addAttribute("success_flag", "N");
			}
			model.addAttribute("forward_url", "/member/list");
			
		} catch (Exception e) {
			logger.info(e.getMessage());
			model.addAttribute("success_flag", "N");
			model.addAttribute("forward_url", "/member/list");
		} finally {
		}
		return "common/common_alert";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(Locale locale, Model model, @RequestParam Map map) {
		try {
			logger.info("Welcome MemberUpdateTest! The client locale is {}.",
					locale);

			int count = memberService.deleteMember(map);
			
			if (0 < count) {
				model.addAttribute("success_flag", "Y");
			} else {
				model.addAttribute("success_flag", "N");
			}
			model.addAttribute("forward_url", "/member/list");
			
		} catch (Exception e) {
			logger.info(e.getMessage());
			model.addAttribute("success_flag", "N");
			model.addAttribute("forward_url", "/member/list");
		} finally {
		}
		return "common/common_alert";
	}*/

}
