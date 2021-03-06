package a2team.yang.jae.account.mybatis;

import java.util.List;
import java.util.Map;

public interface AccountMapper {
	public List getAllMember(Map map);

	public List getPayInfo(Map map);
	
	public int updataMember_detail(Map map);
	
	public int updataMember_pw(Map map);

	public List getProjectView(Map map);

	public List getContributer(Map map);

	public int updata_card_payinfo(Map map);

	public List getMemberDetail(Map map);

	public List getOurProjectView(Map map);

	public List getOurProjectView1(Map map);

	public List getOurProjectView2(Map map);
	
	public List getMessage(Map map);
	
	public int sendMessage(Map map);

}
