package a2team.yang.jae.account.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a2team.yang.jae.account.mybatis.AccountMapper;
import a2team.yang.jae.action.mybatis.PaymentMapper;

@Repository
public class AccountDao {

	@Autowired
	private SqlSession sqlSession;

	public int updataMember_detail(Map map) {
		AccountMapper mapper = sqlSession.getMapper(AccountMapper.class);
		return mapper.updataMember_detail(map);
	}
	public int updataMember_pw(Map map) {
		AccountMapper mapper = sqlSession.getMapper(AccountMapper.class);
		return mapper.updataMember_pw(map);
	}

	public int updata_card_payinfo(Map map) {
		AccountMapper mapper = sqlSession.getMapper(AccountMapper.class);
		return mapper.updata_card_payinfo(map);
	}

	public List getAllMember(Map map) {
		AccountMapper mapper = sqlSession.getMapper(AccountMapper.class);
		return mapper.getAllMember(map);
	}

	public List getMemberDetail(Map map) {
		AccountMapper mapper = sqlSession.getMapper(AccountMapper.class);
		return mapper.getMemberDetail(map);
	}

	public List getPayInfo(Map map) {
		AccountMapper mapper = sqlSession.getMapper(AccountMapper.class);
		return mapper.getPayInfo(map);
	}

	public List getProjectView(Map map) {
		AccountMapper mapper = sqlSession.getMapper(AccountMapper.class);
		return mapper.getProjectView(map);
	}

	public List getContributer(Map map) {
		AccountMapper mapper = sqlSession.getMapper(AccountMapper.class);
		return mapper.getContributer(map);
	}

	public List getOurProjectView(Map map) {
		AccountMapper mapper = sqlSession.getMapper(AccountMapper.class);
		return mapper.getOurProjectView(map);
	}

	public List getOurProjectView1(Map map) {
		AccountMapper mapper = sqlSession.getMapper(AccountMapper.class);
		return mapper.getOurProjectView1(map);
	}

	public List getOurProjectView2(Map map) {
		AccountMapper mapper = sqlSession.getMapper(AccountMapper.class);
		return mapper.getOurProjectView2(map);
	}
	
	public List getMessage(Map map) {
		AccountMapper mapper = sqlSession.getMapper(AccountMapper.class);
		return mapper.getMessage(map);
	}
	
	public int sendMessage(Map map) {
		AccountMapper mapper = sqlSession.getMapper(AccountMapper.class);
		return mapper.sendMessage(map);
	}
}
