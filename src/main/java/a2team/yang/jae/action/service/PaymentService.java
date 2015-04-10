package a2team.yang.jae.action.service;

import java.util.List;
import java.util.Map;

public interface PaymentService {

	public List getAllMember(Map map);

	public int insertPayment(Map map);

	public int updateMember(Map map);

	public int deleteMember(Map map);

	public List getPayInfo(Map map);
	
	public List getProjectData(Map map);
	
	public int testTransaction(Map map) throws Exception;

	
}
