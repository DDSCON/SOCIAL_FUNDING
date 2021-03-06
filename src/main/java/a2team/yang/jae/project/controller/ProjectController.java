package a2team.yang.jae.project.controller;

import java.io.File;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import a2team.yang.jae.project.dao.ProjectDao;
import a2team.yang.jae.project.service.ProjectService;

/**
 * Handles requests for the application home page.
 */
/*@RequestMapping(value = "/project")*/
@Controller
public class ProjectController {

	private static final Logger logger = LoggerFactory
			.getLogger(ProjectController.class);

	@Autowired
	private ProjectService projectService;

	@Value("${file.upload.path}")
	private String fileUploadPath;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/projectInfo", method = RequestMethod.GET)
	public String list(HttpServletRequest req, Model model, @RequestParam Map map) {
		List<ProjectDao> mains = projectService.getAllMain(map);
		List<ProjectDao> poption = projectService.getAllOption(map);
		List<ProjectDao> teams = projectService.getAllTeam(map);
		List<ProjectDao> projects = projectService.getAllProject(map);
		List<ProjectDao> comments = projectService.getAllComment(map);
		List<ProjectDao> payments = projectService.getAllPayment(map);
		List<ProjectDao> paystatus = projectService.getAllPaystatus(map);
		List<ProjectDao> counts = projectService.getAllCounts(map);
		
		model.addAttribute("mains", mains);
		model.addAttribute("poption", poption);
		model.addAttribute("teams", teams);
		model.addAttribute("projects", projects);
		model.addAttribute("comments", comments);
		model.addAttribute("payments", payments);
		model.addAttribute("paystatus", paystatus);
		
		model.addAttribute("counts", counts);
		
		model.addAttribute("seq", map.get("seq").toString());
		
		return "project/projectInfo";
	}
	@RequestMapping(value = "/projectMain", method = RequestMethod.GET)
	public String projectMain(Locale locale, Model model, @RequestParam Map map) {
		logger.info("Welcome MemberTest! The client locale is {}.", locale);
		List category = projectService.getAllCategory(map);
		List projectCard = projectService.selectProjectCard(map);
		List newProjectCard = projectService.selectNewProjectCard(map);
		List mostProjectCard = projectService.selectMostProjectCard(map);
		
		model.addAttribute("category", category);
		model.addAttribute("projectCard", projectCard);
		model.addAttribute("newProjectCard", newProjectCard);
		model.addAttribute("mostProjectCard", mostProjectCard);
		return "project/projectMain";
	}
	@RequestMapping(value = "/projectComment", method = RequestMethod.GET)
	public String projectComment(Locale locale, Model model, @RequestParam Map map) {
		logger.info("projectComment", locale);
		List<ProjectDao> comments = projectService.getAllComment(map);
		//hgygty

		
		model.addAttribute("comments", comments);
		return "project/projectComment";
	}
	@RequestMapping(value = "/newProject", method = { RequestMethod.POST, RequestMethod.GET })
	public String newProject(Locale locale, Model model, @RequestParam Map map, HttpSession session) {
		logger.info("Welcome MemberTest! The client locale is {}.", locale);
		
		if( session.getAttribute("email") == null){
			
			return "redirect:/";
			
		} else {
			map.put("email",session.getAttribute("email"));
			List<ProjectDao> allMember = projectService.getAllMember(map);
			List<ProjectDao> categorys = projectService.getAllCategory(map);
			/*List<ProjectDao> getemail = projectService.getemail(map);*/
			
			//hgygty
			model.addAttribute("allMember", allMember);
			model.addAttribute("categorys", categorys);
			/*model.addAttribute("getemail", getemail);*/
			return "project/newProject";
			
		}
		
	}
	
	@RequestMapping(value = "/insertProject", method = RequestMethod.POST)
	public String insertProject(Locale locale, Model model, @RequestParam Map map) throws Exception {
		logger.info("Welcome MemberTest! The client locale is {}.", locale);
		
		int num = projectService.insertAllProject(map);
		if(num == 1){
			List projectseq = projectService.newGetProject(map);
			
			System.out.println();
			model.addAttribute("projectseq",projectseq);
			/*System.out.println(projectseq.get());*/
			model.addAttribute("seq", ((Map)projectseq.get(0)).get("seq").toString());
	
		}
		return "project/projectInsertview";
	}
	
	@RequestMapping(value = "/projectInfoFreeView", method = RequestMethod.POST)
	public String NewnewProject(Locale locale, Model model, @RequestParam Map map, HttpSession session) throws Exception {
		logger.info("Welcome MemberTest! The client locale is {}.", locale);
		
	
		
		
		return "project/projectInfoFreeView";
	}
	
	@RequestMapping(value = "/insert_Certification_Mail", method = RequestMethod.POST)
	public String certification_mail(Locale locale, Model model, @RequestParam Map map) throws Exception {
		logger.info("Welcome MemberTest! The client locale is {}.", locale);
		
		projectService.insert_Certification_Mail(map);
		
		return "common/common_alert";
	}

	@RequestMapping(value = "/projectCategory", method = RequestMethod.GET)
	public String projectCategory(Locale locale, Model model, @RequestParam Map map) {
		logger.info("Welcome MemberTest! The client locale is {}.", locale);
		List projectCard = projectService.selectProjectCard(map);
		List allProjectCard = projectService.getAllNewProjectCard(map);
		
		model.addAttribute("projectCard", projectCard);
		model.addAttribute("allProjectCard", allProjectCard);
		
		return "project/projectCategory";
	}

	@RequestMapping(value = "/projectUpdate", method = RequestMethod.GET)
	public String projectUpdate(Locale locale, Model model,@RequestParam Map map) {
		logger.info("projectUpdate", locale);
		
		return "project/projectUpdate";
	}
	@RequestMapping(value = "/updateComplete", method = RequestMethod.GET)
	public String updateComplete(Locale locale, Model model, @RequestParam Map map) {
		logger.info("updateComplete", locale);
		List<ProjectDao> projects = projectService.getAllProject(map);

		model.addAttribute("projects", projects);
		return "project/updateComplete";
	}

	@RequestMapping(value = "/insertUpdate", method = RequestMethod.POST)
	public String insertUpdate(Locale locale, Model model, @RequestParam Map map) {
		
		try {
			logger.info("프로젝트 업데이트 {}.",
					locale);

//			int count = projectService.testTransaction(map);
			int count = projectService.insertUpdate(map);
			List<ProjectDao> projects = projectService.getAllProject(map);
			model.addAttribute("projects", projects);
			System.out.println(count);
			model.addAttribute("seq", map.get("seq").toString());
			if (0 < count) {
				System.out.println("1");
				model.addAttribute("success_flag", "Y");
			} else {
				model.addAttribute("success_flag", "N");
			}
			
		} catch (Exception e) {
			logger.info(e.getMessage());
			System.out.println(e.getMessage());
		} finally {
		
		}
		return "project/updateComplete";
	}
	
	@RequestMapping(value = "/insertComment", method = RequestMethod.POST)
	public String insert(Locale locale, Model model, @RequestParam Map map) {
		
		try {
			logger.info("댓글 등록{}.",
					locale);

//			int count = projectService.testTransaction(map);
			int count = projectService.insertComment(map);
			List<ProjectDao> comments = projectService.getAllComment(map);
			model.addAttribute("comments", comments);
			System.out.println(count);
			if (0 < count) {
				System.out.println("1");
				model.addAttribute("success_flag", "Y");
				
			} else {
				model.addAttribute("success_flag", "N");
			}
		} catch (Exception e) {
			logger.info(e.getMessage());
			System.out.println(e.getMessage());
		} finally {
		
		}
		return "project/projectComment";
	}
	
	@RequestMapping(value = "/deleteComment", method = RequestMethod.POST)
	public String delete(HttpServletRequest request, Model model, @RequestParam Map map) {
		try {
			System.out.println(1);
			
			
			int count = projectService.deleteComment(map);
			if (0 < count) {
				model.addAttribute("success_flag", "Y");
			} else {
				model.addAttribute("success_flag", "N");
			}
			
			List<ProjectDao> comments = projectService.getAllComment(map);
			
			model.addAttribute("comments", comments);
			
			
			
		} catch (Exception e) {
			logger.info(e.getMessage());
			model.addAttribute("success_flag", "N");
			
		} finally {
		}
		return "project/projectComment";
	}
	@RequestMapping(value = "/updateComment", method = RequestMethod.POST)
	public String update(Locale locale, Model model, @RequestParam Map map) {
		try {
			logger.info("댓글 업데이트 {}.",
					locale);
			System.out.println(1);
			int count = projectService.updateComment(map);
			
			if (0 < count) {
				model.addAttribute("success_flag", "Y");
			} else {
				model.addAttribute("success_flag", "N");
			}
			List<ProjectDao> comments = projectService.getAllComment(map);
			model.addAttribute("comments", comments);
			
		} catch (Exception e) {
			logger.info(e.getMessage());
			model.addAttribute("success_flag", "N");
			
		} finally {
		}
		return "project/projectComment";
	}

	

}
