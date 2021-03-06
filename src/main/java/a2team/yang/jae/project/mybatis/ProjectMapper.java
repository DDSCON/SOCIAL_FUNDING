package a2team.yang.jae.project.mybatis;

import java.util.List;
import java.util.Map;

import a2team.yang.jae.project.dao.ProjectDao;

public interface ProjectMapper {
	public List<ProjectDao> getAllMain(Map map);
	public List<ProjectDao> getAllOption(Map map);
	public List<ProjectDao> getAllTeam(Map map);
	public List<ProjectDao> getAllProject(Map map);
	public List<ProjectDao> getAllComment(Map map);
	
	public List<ProjectDao> getAllPayment(Map map);
	
	public List<ProjectDao> getAllPaystatus(Map map);
	public List<ProjectDao> getAllCounts(Map map);
	
	
	public List getAllCategory(Map map);
	public List getAllMember(Map map);
	
	public List getemail(Map map);
	public int certification_mail(Map map);
	public List newGetProject(Map map);
	
	
	
	
	public int insertComment(Map map);
	
	public int deleteComment(Map map);
	public int updateComment(Map map);
	public List selectProjectCard(Map map);
	public List selectNewProjectCard(Map map);
	public List getAllNewProjectCard(Map map);
	public List selectMostProjectCard(Map map);
	public List getCategoryProject(Map map);
	
	
	public int insertUpdate(Map map);
	public int updateProject(Map map);
	
	public int insert_Certification_Mail(Map map);
	public int insertProject(Map map);
	public int insertOption(Map map);
	public int insertTeam(Map map);

	
	
	
	
}
