package a2team.yang.jae.mail;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import a2team.yang.jae.project.service.ProjectService;

import com.google.gson.Gson;

@Controller
public class MailController {
	
	@Autowired 
	private JavaMailSender mailSender;
	
	@Autowired
	private ProjectService projectService;
	
	private String from 	= "kjh0102321@gmail.com";
	private String subject	= "SPRING_PROJECT";
	
	

	
	
	@RequestMapping(value = "/mail")
	@ResponseBody
	public String sendMail(@RequestParam Map map) {
		Gson gson = new Gson();
		Map resultMap = new HashMap();
		 Random random = new Random();
		 String[] t = new String[10];
	        for (int i=0;i<10;i++){
	            String num = String.valueOf(random.nextInt(10));
	            t[i] = num;
	        }
	       
	        String addnum = t[0]+t[1]+t[2]+t[3]+t[4]+t[5]+t[6]+t[7]+t[8];

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setTo(map.get("contact_detail_email").toString());
			messageHelper.setText("인증번호 입니다"+" "+addnum);
			messageHelper.setFrom(from);
			messageHelper.setSubject(subject);
			
			mailSender.send(message);
			
			map.put("isSuccess", "Y");
			map.put("email_check", addnum);
			map.put("email", map.get("contact_detail_email").toString());
			projectService.insert_Certification_Mail(map);
			
		} catch(Exception e){
			System.out.println(e);
			map.put("isSuccess", "N");
		}
		
		return gson.toJson(map);
	}
	
	
	
	@RequestMapping(value = "/certification_mail")
	@ResponseBody
	public String certification(@RequestParam Map map) {
		Gson gson = new Gson();
		Map resultMap = new HashMap();
		

		try {
			map.put("email_check", map.get("email_check").toString());
			map.put("email", map.get("email").toString());
			int num = projectService.certification_mail(map);
			if(num != 0){
			map.put("isSuccess", "Y");
			
			}
	
			
			
		} catch(Exception e){
			System.out.println(e);
			map.put("isSuccess", "N");
		}
		
		return gson.toJson(map);
	}
	
	
}