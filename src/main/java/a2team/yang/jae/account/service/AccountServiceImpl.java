package a2team.yang.jae.account.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import a2team.yang.jae.account.dao.AccountDao;

@Component
@Transactional(readOnly = true)
public class AccountServiceImpl implements AccountService {

	@Autowired
	AccountDao accountDao;
	
	int result = 0;

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public List getOurProjectView(Map map) {
		return accountDao.getOurProjectView(map);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public List getOurProjectView1(Map map) {
		return accountDao.getOurProjectView1(map);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public List getOurProjectView2(Map map) {
		return accountDao.getOurProjectView2(map);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int updataMember_detail(Map map) {
		return accountDao.updataMember_detail(map);
	}
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int updataMember_pw(Map map) {
		return accountDao.updataMember_pw(map);
	}
	@Transactional(readOnly=false, propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	public int updataMember_all(Map map) throws Exception {
		
		result = accountDao.updataMember_detail(map);
		
		if ( 1 == result ) {
			
			result = accountDao.updataMember_pw(map);
			return result;		
		} else {
			throw new Exception();
		}
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int updata_card_payinfo(Map map) {
		return accountDao.updata_card_payinfo(map);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public List getAllMember(Map map) {
		return accountDao.getAllMember(map);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public List getMemberDetail(Map map) {
		return accountDao.getMemberDetail(map);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public List getPayInfo(Map map) {
		return accountDao.getPayInfo(map);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public List getProjectView(Map map) {
		return accountDao.getProjectView(map);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public List getContributer(Map map) {
		return accountDao.getContributer(map);
	}
	
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public List getMessage(Map map) {
		return accountDao.getMessage(map);
	}
	
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int sendMessage(Map map) {
		return accountDao.sendMessage(map);
	}


}
