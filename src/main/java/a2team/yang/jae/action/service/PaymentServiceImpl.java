package a2team.yang.jae.action.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import a2team.yang.jae.action.dao.PaymentDao;
import a2team.yang.jae.project.dao.ProjectDao;

@Component
@Transactional(readOnly=true)

public class PaymentServiceImpl implements PaymentService{


	@Autowired
	PaymentDao paymentDao;
	
	int result = 0;
	
	public List getPayInfo(Map map) {
		return paymentDao.getPayInfo(map);
	}
	
	public List getAllMember(Map map) {
		return paymentDao.getAllMember(map);
	}
	
	@Transactional(readOnly=false, propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	public int insertPayment(Map map) {
		return paymentDao.insertPayment(map);
	}
	
	@Transactional(readOnly=false, propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	public int updateMember(Map map) {
		return paymentDao.updateMember(map);
	}
	
	@Transactional(readOnly=false, propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	public int deleteMember(Map map) {
		return paymentDao.deleteMember(map);
	}
	
	@Transactional(readOnly=false, propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	public List getProjectData(Map map) {
		return paymentDao.getProjectData(map);
	}

	
	@Transactional(readOnly=false, propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	public int testTransaction(Map map) throws Exception {
		
		/*result = paymentDao.insertMember(map);*/
		
		if ( 1 == result ) {
			
			result = paymentDao.deleteMember(map);
			
			if ( 1 == result ) {
				// success!
			} else {
				throw new Exception();
			}
			
		} else {
			throw new Exception();
		}
		return result;
	}


}
