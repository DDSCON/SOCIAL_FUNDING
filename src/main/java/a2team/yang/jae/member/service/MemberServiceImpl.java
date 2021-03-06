package a2team.yang.jae.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import a2team.yang.jae.member.dao.MemberDao;

@Component
@Transactional(readOnly = true)
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao memberDao;

	int result = 0;

	public List getAllMember(Map map) {
		return memberDao.getAllMember(map);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int insertMember(Map map) {
		return memberDao.insertMember(map);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int updateMember(Map map) {
		return memberDao.updateMember(map);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int deleteMember(Map map) {
		return memberDao.deleteMember(map);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int login(Map map) {
		return memberDao.login(map);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int signup(Map map) {
		return memberDao.signup(map);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int payinfo_detail(Map map) {
		return memberDao.payinfo_detail(map);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int signup_detail(Map map) {
		return memberDao.signup_detail(map);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int inset_signupall(Map map) throws Exception {

		result = memberDao.signup(map);
		if (1 == result) {

			result = memberDao.signup_detail(map);
			if (1 == result) {
				result = memberDao.payinfo_detail(map);
				if (1 == result) {

					return result;

				} else {
					throw new Exception();
				}

			} else {
				throw new Exception();
			}

		} else {
			throw new Exception();
		}

	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int checkId(Map map) {
		return memberDao.checkId(map);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int testTransaction(Map map) throws Exception {

		result = memberDao.insertMember(map);

		if (1 == result) {

			result = memberDao.deleteMember(map);

			if (1 == result) {

			} else {
				throw new Exception();
			}

		} else {
			throw new Exception();
		}
		return result;
	}

	public List selname(Map map) {
		return memberDao.selname(map);
	}

}
