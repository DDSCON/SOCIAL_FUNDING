package a2team.yang.jae.account.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import a2team.yang.jae.account.service.AccountService;
import a2team.yang.jae.action.service.PaymentService;
import a2team.yang.jae.project.service.ProjectService;

/**
 * Handles requests for the application home page.
 */
/* @RequestMapping(value = "/view") */
@Controller
public class AccountController {

    private static final Logger logger = LoggerFactory.getLogger(AccountController.class);

    @Autowired
    private AccountService accountService;

    @Autowired
    private PaymentService paymentService;

    @Autowired
    private ProjectService projectService;

    /**
	 * Simply selects the home view to render by returning its name.
	 */

    @RequestMapping(value = "/account/ourProjectView", method = {
        RequestMethod.GET,
        RequestMethod.POST
    })
    public String ourProjectView(Locale locale, Model model, @RequestParam Map map, HttpSession session) {
        logger.info("Welcome payment test! The client locale is {}.", locale);

        if (session.getAttribute("email") == null) {
            return "redirect:/";
        }

        map.put("email", session.getAttribute("email"));
        map.put("m_seq", session.getAttribute("seq"));
        map.put("p_seq", session.getAttribute("p_seq"));
        map.put("seq", session.getAttribute("p_seq"));

        List allProjectCard = projectService.getAllNewProjectCard(map);
        List ourProjectView  = accountService.getOurProjectView(map);
        List ourProjectView1 = accountService.getOurProjectView1(map);
        List ourProjectView2 = accountService.getOurProjectView2(map);

        model.addAttribute("allProjectCard", allProjectCard);
        model.addAttribute("ourProjectView", ourProjectView);
        model.addAttribute("ourProjectView1", ourProjectView1);
        model.addAttribute("ourProjectView2", ourProjectView2);
        
        List poption = projectService.getAllOption(map);
        model.addAttribute("poption", poption);

        List mains = projectService.getAllMain(map);
        model.addAttribute("mains", mains);

        List projectview = accountService.getProjectView(map);
        model.addAttribute("projectview", projectview);

        List contributer = accountService.getContributer(map);
        model.addAttribute("contributer", contributer);
        
        List message = accountService.getMessage(map);
        model.addAttribute("message", message);
        
        

        return "/account/ourProjectView";
    }

    @RequestMapping(value = "/account/profile1", method = {
        RequestMethod.GET,
        RequestMethod.POST
    })
    public String profile1(Locale locale, Model model, @RequestParam Map map, HttpSession session) {
        logger.info("Welcome payment test! The client locale is {}.", locale);
        if (session.getAttribute("email") == null) {

            return "redirect:/";

        } else {

            map.put("email", session.getAttribute("email"));
            List getAllmember = accountService.getAllMember(map);
            model.addAttribute("getAllmember", ((Map) getAllmember.get(0)).get("seq").toString());

            List getMemberDetail = accountService.getMemberDetail(map);
            model.addAttribute("getMemberDetail", getMemberDetail);

            return "/member/profile1";

        }

    }

    @RequestMapping(value = "/account/updatamember_detail", method = {
        RequestMethod.GET,
        RequestMethod.POST
    })
    public String updatamember_detail(Locale locale, Model model, @RequestParam Map map, HttpSession session) {
        logger.info("Welcome payment test! The client locale is {}.", locale);
        int updata = accountService.updataMember_detail(map);
        if (session.getAttribute("email") == null) {
            return "redirect:/";
        }

        map.put("m_seq", session.getAttribute("seq"));

        List ourProjectView  = accountService.getOurProjectView(map);
        List ourProjectView1 = accountService.getOurProjectView1(map);
        List ourProjectView2 = accountService.getOurProjectView2(map);

        model.addAttribute("ourProjectView", ourProjectView);
        model.addAttribute("ourProjectView1", ourProjectView1);
        model.addAttribute("ourProjectView2", ourProjectView2);

        return "redirect:/";
    }

    @RequestMapping(value = "/account/profile2", method = {
        RequestMethod.GET,
        RequestMethod.POST
    })
    public String profile2(Locale locale, Model model, @RequestParam Map map, HttpSession session) {
        logger.info("Welcome payment test! The client locale is {}.", locale);
        if (session.getAttribute("email") == null) {

            return "redirect:/";

        } else {

            map.put("email", session.getAttribute("email"));
            List getAllmember = accountService.getAllMember(map);
            model.addAttribute("getAllmember", ((Map) getAllmember.get(0)).get("seq").toString());

            List payinfo = accountService.getPayInfo(map);
            model.addAttribute("payinfo", payinfo);

            return "/member/profile2";

        }

    }

    @RequestMapping(value = "/account/updata_card_payinfo", method = {
        RequestMethod.GET,
        RequestMethod.POST
    })
    public String updata_card_payinfo(Locale locale, Model model, @RequestParam Map map, HttpSession session) {
        logger.info("Welcome payment test! The client locale is {}.", locale);
        int updata1 = accountService.updata_card_payinfo(map);
        if (session.getAttribute("email") == null) {
            return "redirect:/";
        }

        map.put("m_seq", session.getAttribute("seq"));

        List ourProjectView  = accountService.getOurProjectView(map);
        List ourProjectView1 = accountService.getOurProjectView1(map);
        List ourProjectView2 = accountService.getOurProjectView2(map);

        model.addAttribute("ourProjectView", ourProjectView);
        model.addAttribute("ourProjectView1", ourProjectView1);
        model.addAttribute("ourProjectView2", ourProjectView2);

        return "redirect:/";
    }

    @RequestMapping(value = "/account/myProjectView", method = {
        RequestMethod.GET,
        RequestMethod.POST
    })
    public String myProjectView(Locale locale, Model model, @RequestParam Map map, HttpSession session) {
        logger.info("Welcome MemberTest! The client locale is {}.", locale);

        if (session.getAttribute("email") == null) {

            return "redirect:/";
        }

        map.put("email", session.getAttribute("email"));
        map.put("m_seq", session.getAttribute("seq"));
        map.put("p_seq", session.getAttribute("p_seq"));
        map.put("seq", session.getAttribute("p_seq"));

        List poption = projectService.getAllOption(map);
        model.addAttribute("poption", poption);

        List mains = projectService.getAllMain(map);
        model.addAttribute("mains", mains);

        List projectview = accountService.getProjectView(map);
        model.addAttribute("projectview", projectview);

        List contributer = accountService.getContributer(map);
        model.addAttribute("contributer", contributer);
        
        List message = accountService.getMessage(map);
        model.addAttribute("message", message);
        
        

        return "/account/myProjectView";

    }
    
    @RequestMapping(value = "/account/sendMessage", produces = "text/plain; charset=UTF-8" ,method = {
            RequestMethod.GET,
            RequestMethod.POST
        })
    
    @ResponseBody
    public String sendMessage(Locale locale, Model model, @RequestParam Map map, HttpSession session) {
            logger.info("Welcome MemberTest! The client locale is {}.", locale);

            

            Gson gson = new Gson();
    		Map resultMap = new HashMap();

    		

    		try {
    			
    			int sendMessage = accountService.sendMessage(map);
    			System.out.println(sendMessage);
    			 
    			
    			
    			if(sendMessage != 0){
    			map.put("isSuccess", "Y");
    			System.out.println(sendMessage);
    			
    	        List message = accountService.getMessage(map);
    	        model.addAttribute("message", message);
    	        

    			}
    	
    			
    			
    		} catch(Exception e){
    			System.out.println(e);
    			map.put("isSuccess", "N");
    			System.out.println(0);
    		}
    		
    		return gson.toJson(map);
        }


}