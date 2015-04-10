package a2team.yang.jae.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import a2team.yang.jae.project.dao.ProjectDao;

@Component
@Transactional(readOnly=true)

public class ProjectServiceImpl implements ProjectService{
	@Autowired
	ProjectDao projectdDao;
	
	int result = 0;
	
	public List getAllMain(Map map) {
		return projectdDao.getAllMain(map);
	}
	public List getAllOption(Map map) {
		return projectdDao.getAllOption(map);
	}
	public List getAllTeam(Map map) {
		return projectdDao.getAllTeam(map);
	}
	public List getAllProject(Map map) {
		return projectdDao.getAllProject(map);
	}
	
	public List getAllComment(Map map) {
		return projectdDao.getAllComment(map);
	}
	
	public List getAllPayment(Map map) {
		return projectdDao.getAllPayment(map);
	}
	
	public List getAllPaystatus(Map map) {
		return projectdDao.getAllPaystatus(map);
	}
	public List getAllCounts(Map map) {
		return projectdDao.getAllCounts(map);
	}
	
	
	@Transactional(readOnly=false, propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	public int insertComment(Map map) {
		return projectdDao.insertComment(map);
	}

	@Transactional(readOnly=false, propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	public int insertAllProject(Map map) throws Exception {
		
		result = projectdDao.insertTeam(map);
		
		if ( 1 == result ) {
			
			result = projectdDao.insertProject(map);
			
			if ( 1 == result ) {
				
				result = projectdDao.insertOption(map);
				return result;				
			} else {
				throw new Exception();
			}			
		} else {
			throw new Exception();
		}
	}
	
	@Transactional(readOnly=false, propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	public int insertProject(Map map) {
		return projectdDao.insertProject(map);
	}

	@Transactional(readOnly=false, propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	public int insertOption(Map map) {
		return projectdDao.insertOption(map);
	}

	@Transactional(readOnly=false, propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	public int insertTeam(Map map) {
		return projectdDao.insertTeam(map);
	}
	
	@Transactional(readOnly=false, propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	public int deleteComment(Map map) {
		return projectdDao.deleteComment(map);
	}
	@Transactional(readOnly=false, propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	public int updateComment(Map map) {
		return projectdDao.updateComment(map);
	}
	
	@Transactional(readOnly=false, propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	public int insertUpdate(Map map) {
		return projectdDao.insertUpdate(map);
	}
	@Transactional(readOnly=false, propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	public List getAllCategory(Map map) {
		return projectdDao.getAllCategory(map);
	}
	@Transactional(readOnly=false, propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	public List selectProjectCard(Map map) {
		return projectdDao.selectProjectCard(map);
	}
	@Transactional(readOnly=false, propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	public List selectNewProjectCard(Map map) {
		return projectdDao.selectNewProjectCard(map);
	}
	@Transactional(readOnly=false, propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	public List getAllNewProjectCard(Map map) {
		return projectdDao.getAllNewProjectCard(map);
	}
	@Transactional(readOnly=false, propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	public List selectMostProjectCard(Map map) {
		return projectdDao.selectMostProjectCard(map);
	}
	@Transactional(readOnly=false, propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	public List getCategoryProject(Map map) {
		return projectdDao.getCategoryProject(map);
	}
	
	@Transactional(readOnly=false, propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	public List getemail(Map map) {
		// TODO Auto-generated method stub
		return projectdDao.getemail(map);
	}
	
	@Transactional(readOnly=false, propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	public int insert_Certification_Mail(Map map) {
		return projectdDao.insert_Certification_Mail(map);
	}

	@Transactional(readOnly=false, propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	public int certification_mail(Map map) {
		result =  projectdDao.certification_mail(map);
		
		return result;
	}
	
	@Transactional(readOnly=false, propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	public List newGetProject(Map map) {
		return projectdDao.newGetProject(map);
	}
	@Transactional(readOnly=false, propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	public List getAllMember(Map map) {
		return projectdDao.getAllMember(map);
		
	}
	
	
	
	/*@Transactional(readOnly=false, propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	public int updateProject(Map map) {
		return projectdDao.updateProject(map);
	}
	
		
	@Transactional(readOnly=false, propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	public int testTransaction(Map map) throws Exception {
		
		result = projectdDao.insertProject(map);
		
		if ( 1 == result ) {
			
			result = projectdDao.deleteProject(map);
			
			if ( 1 == result ) {
				// success!
			} else {
				throw new Exception();
			}
			
		} else {
			throw new Exception();
		}
		return result;
	}*/
}
