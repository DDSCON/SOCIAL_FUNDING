package a2team.yang.jae.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import a2team.yang.jae.project.dao.ProjectDao;


public interface ProjectService  {
	public List getAllMain(Map map);
	public List getAllOption(Map map);
	public List getAllTeam(Map map);
	public List getAllProject(Map map);
	public List getAllMember(Map map);
	public List getAllComment(Map map);
	
	public List getAllPayment(Map map);
	
	public List getAllPaystatus(Map map);

	public List getAllCounts(Map map);
	
	public int insertComment(Map map);
	
	public List getemail(Map map);
	public int certification_mail(Map map);
	public int insert_Certification_Mail(Map map);


	public int deleteComment(Map map);
	public int updateComment(Map map);
	public int insertUpdate(Map map);
	public List getAllCategory(Map map);
	public List selectProjectCard(Map map);
	public List selectNewProjectCard(Map map);
	public List getAllNewProjectCard(Map map);
	public List selectMostProjectCard(Map map);
	public List getCategoryProject(Map map);
	public List newGetProject(Map map);
	
	public int insertAllProject(Map map) throws Exception;
	public int insertProject(Map map);
	public int insertOption(Map map);
	public int insertTeam(Map map);

	
	

}