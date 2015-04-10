package a2team.yang.jae.action.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import a2team.yang.jae.action.mybatis.PaymentMapper;
import a2team.yang.jae.member.mybatis.MemberMapper;

@Repository
public class PaymentDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List getPayInfo(Map map) {
		PaymentMapper mapper = sqlSession.getMapper(PaymentMapper.class);
		return mapper.getPayInfo(map);
	}
	
	public List getProjectData(Map map) {
		PaymentMapper mapper = sqlSession.getMapper(PaymentMapper.class);
		return mapper.getProjectData(map);
	}
	
	public List getAllMember(Map map) {
		PaymentMapper mapper = sqlSession.getMapper(PaymentMapper.class);
		return mapper.getAllMember(map);
	}
	
	public int insertPayment(Map map) {
		PaymentMapper mapper = sqlSession.getMapper(PaymentMapper.class);
		return mapper.insertPayment(map);
	}
	
	public int updateMember(Map map) {
		PaymentMapper mapper = sqlSession.getMapper(PaymentMapper.class);
		return mapper.updateMember(map);
	}
	
	public int deleteMember(Map map) {
		PaymentMapper mapper = sqlSession.getMapper(PaymentMapper.class);
		return mapper.deleteMember(map);

	}
	
}
