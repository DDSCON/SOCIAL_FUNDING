package a2team.yang.jae;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import a2team.yang.jae.project.dao.ProjectDao;
import a2team.yang.jae.project.service.ProjectService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private ProjectService projectService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
public String home(Locale locale, Model model, @RequestParam Map map) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		List projectCard = projectService.selectProjectCard(map);
		List category = projectService.getAllCategory(map);
		List categoryProject = projectService.getCategoryProject(map);
		List mostProjectCard = projectService.selectMostProjectCard(map);
		
		model.addAttribute("projectCard", projectCard);
		model.addAttribute("category", category);
		model.addAttribute("categoryProject", categoryProject);
		model.addAttribute("mostProjectCard", mostProjectCard);
		model.addAttribute("serverTime", formattedDate );
		
		return "main/index";
	}
}
