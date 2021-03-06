package a2team.yang.jae.project.controller;

import java.io.File;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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

import com.google.gson.Gson;
import com.google.gson.JsonElement;

import a2team.yang.jae.project.dao.ProjectDao;
import a2team.yang.jae.project.service.ProjectService;

@Controller
public class FileUploadController {

	/**
	 * Handles requests for the application home page.
	 */
	/* @RequestMapping(value = "/project") */

	private static final Logger logger = LoggerFactory
			.getLogger(ProjectController.class);

	@Autowired
	private ProjectService projectService;

	@Value("${file.upload.path}")
	private String fileUploadPath;
	
	@RequestMapping(value = "/imageUpload_project", method = RequestMethod.POST)
	@ResponseBody
	public String upload(Locale locale, Model model,
			@RequestParam(value = "p_image") List<MultipartFile> files,
			@RequestParam Map map) throws Exception {

		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// String uploadPath =
		// "C:\\workspace_sts\\SPRING_PROJECT\\src\\main\\webapp\\resources\\upload\\";
		String fileName = "";

		for (int i = 0; i < files.size(); i++) {
			MultipartFile file = (MultipartFile) files.get(i);

			String fn = file.getOriginalFilename();

			int idx = fn.lastIndexOf(".");

			String fn_sl = fn.substring(idx);

			System.out.println(fn_sl);
			if (".jpg".equals(fn_sl) || ".JPG".equals(fn_sl) 
					|| ".jpeg".equals(fn_sl)
					|| ".JPEG".equals(fn_sl) || ".gif".equals(fn_sl)
					|| ".GIF".equals(fn_sl) || ".png".equals(fn_sl)
					|| ".PNG".equals(fn_sl) || ".bmp".equals(fn_sl)
					|| ".BMP".equals(fn_sl)) {
				File newFile = new File(fileUploadPath + 10000 * Math.random() + fn_sl);
				file.transferTo(newFile);
				System.out.println(newFile.getName());
				fileName += (file.getOriginalFilename());
				map.put("fileName", fileName);
				map.put("newFile", newFile.getName());
			}
		}

		Gson gson = new Gson();
		System.out.println(gson.toJson(map));
		return gson.toJson(map);
	}

	
	@RequestMapping(value = "/videoUpload_project", method = RequestMethod.POST)
	@ResponseBody
	public String videoupload(Locale locale, Model model,
			@RequestParam(value = "p_video") List<MultipartFile> files,
			@RequestParam Map map) throws Exception {

		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// String uploadPath =
		// "C:\\workspace_sts\\SPRING_PROJECT\\src\\main\\webapp\\resources\\upload\\";
		String fileNameVideo = "";

		for (int i = 0; i < files.size(); i++) {
			MultipartFile file = (MultipartFile) files.get(i);

			String fn = file.getOriginalFilename();

			int idx = fn.lastIndexOf(".");

			String fn_sl = fn.substring(idx);

			System.out.println(fn_sl);
			if (".mp4".equals(fn_sl) || ".MP4".equals(fn_sl)
					|| ".mov".equals(fn_sl) || ".MOV".equals(fn_sl)
					|| ".mpeg".equals(fn_sl) || ".MPEG".equals(fn_sl)
					|| ".avi".equals(fn_sl) || ".AVI".equals(fn_sl)
					|| ".WMV".equals(fn_sl) || ".wmv".equals(fn_sl)
					) {
				File newFileVdieo = new File(fileUploadPath + 10000 * Math.random() + fn_sl);
				file.transferTo(newFileVdieo);
				System.out.println(newFileVdieo.getName());
				fileNameVideo += (file.getOriginalFilename());
				map.put("fileNameVideo", fileNameVideo);
				map.put("newFileVdieo", newFileVdieo.getName());
			}
		}

		Gson gson = new Gson();
		System.out.println(gson.toJson(map));
		return gson.toJson(map);
	}
	
	
	@RequestMapping(value = "/teamimageUpload_project", method = RequestMethod.POST)
	@ResponseBody
	public String teamupload(Locale locale, Model model,
			@RequestParam(value = "p_teamimage") List<MultipartFile> files,
			@RequestParam Map map) throws Exception {

		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// String uploadPath =
		// "C:\\workspace_sts\\SPRING_PROJECT\\src\\main\\webapp\\resources\\upload\\";
		String teamfileName = "";

		for (int i = 0; i < files.size(); i++) {
			MultipartFile file = (MultipartFile) files.get(i);

			String fn = file.getOriginalFilename();

			int idx = fn.lastIndexOf(".");

			String fn_sl = fn.substring(idx);

			System.out.println(fn_sl);
			if (".jpg".equals(fn_sl) || ".jpg".equals(fn_sl)
					|| ".JPG".equals(fn_sl) || ".jpeg".equals(fn_sl)
					|| ".JPEG".equals(fn_sl) || ".gif".equals(fn_sl)
					|| ".GIF".equals(fn_sl) || ".png".equals(fn_sl)
					|| ".PNG".equals(fn_sl) || ".bmp".equals(fn_sl)
					|| ".BMP".equals(fn_sl)) {
				File teamnewFile = new File(fileUploadPath + 10000 * Math.random() + fn_sl);
				file.transferTo(teamnewFile);
				System.out.println(teamnewFile.getName());
				teamfileName += (file.getOriginalFilename());
				map.put("teamfileName", teamfileName);
				map.put("teamnewFile", teamnewFile.getName());
			}
		}

		Gson gson = new Gson();
		System.out.println(gson.toJson(map));
		return gson.toJson(map);
	}
	
}
