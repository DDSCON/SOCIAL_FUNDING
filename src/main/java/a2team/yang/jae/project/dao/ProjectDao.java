package a2team.yang.jae.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import a2team.yang.jae.project.mybatis.ProjectMapper;

@Component
public class ProjectDao {
	@Autowired
	private SqlSession sqlSession;
	
	
	public List getAllMain(Map map) {
		ProjectMapper mapper = sqlSession.getMapper(ProjectMapper.class);
		return mapper.getAllMain(map);
	}
	public List getAllOption(Map map) {
		ProjectMapper mapper = sqlSession.getMapper(ProjectMapper.class);
		return mapper.getAllOption(map);
	}
	public List getAllTeam(Map map) {
		ProjectMapper mapper = sqlSession.getMapper(ProjectMapper.class);
		return mapper.getAllTeam(map);
	}
	public List getAllProject(Map map) {
		ProjectMapper mapper = sqlSession.getMapper(ProjectMapper.class);
		return mapper.getAllProject(map);
	}

	public List getAllComment(Map map) {
		ProjectMapper mapper = sqlSession.getMapper(ProjectMapper.class);
		return mapper.getAllComment(map);
	
	}
	
	public List getAllPayment(Map map) {
		ProjectMapper mapper = sqlSession.getMapper(ProjectMapper.class);
		return mapper.getAllPayment(map);
	}
	
	public List getAllPaystatus(Map map) {
		ProjectMapper mapper = sqlSession.getMapper(ProjectMapper.class);
		return mapper.getAllPaystatus(map);
	}
	public List getAllCounts(Map map) {
		ProjectMapper mapper = sqlSession.getMapper(ProjectMapper.class);
		return mapper.getAllCounts(map);
	}
	
	
	public int insertComment(Map map) {
		ProjectMapper mapper = sqlSession.getMapper(ProjectMapper.class);
		return mapper.insertComment(map);
	}
	
	public int deleteComment(Map map) {
		ProjectMapper mapper = sqlSession.getMapper(ProjectMapper.class);
		return mapper.deleteComment(map);
	}
	public int updateComment(Map map) {
		ProjectMapper mapper = sqlSession.getMapper(ProjectMapper.class);
		return mapper.updateComment(map);
	}
	
	
	
	

	
	public List getemail(Map map) {
		ProjectMapper mapper = sqlSession.getMapper(ProjectMapper.class);
		return mapper.getemail(map);
	}
	
	public int insert_Certification_Mail(Map map) {
		ProjectMapper mapper = sqlSession.getMapper(ProjectMapper.class);
		return mapper.insert_Certification_Mail(map);
	}
	
	public int certification_mail(Map map) {
		ProjectMapper mapper = sqlSession.getMapper(ProjectMapper.class);
		return mapper.certification_mail(map);
	}
	
	
	public List selectProjectCard(Map map) {
		ProjectMapper mapper = sqlSession.getMapper(ProjectMapper.class);
		return mapper.selectProjectCard(map);
	}
	public List selectNewProjectCard(Map map) {
		ProjectMapper mapper = sqlSession.getMapper(ProjectMapper.class);
		return mapper.selectNewProjectCard(map);
	}
	public List getAllNewProjectCard(Map map) {
		ProjectMapper mapper = sqlSession.getMapper(ProjectMapper.class);
		return mapper.getAllNewProjectCard(map);
	}
	public List selectMostProjectCard(Map map) {
		ProjectMapper mapper = sqlSession.getMapper(ProjectMapper.class);
		return mapper.selectMostProjectCard(map);
	}
	public List getAllCategory(Map map) {
		ProjectMapper mapper = sqlSession.getMapper(ProjectMapper.class);
		return mapper.getAllCategory(map);
	}
	public List getCategoryProject(Map map) {
		ProjectMapper mapper = sqlSession.getMapper(ProjectMapper.class);
		return mapper.getCategoryProject(map);
	}
	

	
	public int insertUpdate(Map map) {
		ProjectMapper mapper = sqlSession.getMapper(ProjectMapper.class);
		return mapper.insertUpdate(map);
	}
	
	
	
	public int insertProject(Map map) {
		ProjectMapper mapper = sqlSession.getMapper(ProjectMapper.class);
		return mapper.insertProject(map);
	}
	
	public int insertOption(Map map) {
		ProjectMapper mapper = sqlSession.getMapper(ProjectMapper.class);
		return mapper.insertOption(map);
	}
	
	public int insertTeam(Map map) {
		ProjectMapper mapper = sqlSession.getMapper(ProjectMapper.class);
		return mapper.insertTeam(map);
	}

	public List newGetProject(Map map) {
		ProjectMapper mapper = sqlSession.getMapper(ProjectMapper.class);
		return mapper.newGetProject(map);
	}
	public List getAllMember(Map map) {
		ProjectMapper mapper = sqlSession.getMapper(ProjectMapper.class);
		return mapper.getAllMember(map);
	}



	/*public int updateProject(Map map) {
		ProjectMapper mapper = sqlSession.getMapper(ProjectMapper.class);
		return mapper.updateProject(map);
	}
	
	public int deleteProject(Map map) {
		ProjectMapper mapper = sqlSession.getMapper(ProjectMapper.class);
		return mapper.deleteProject(map);
	}*/

}
