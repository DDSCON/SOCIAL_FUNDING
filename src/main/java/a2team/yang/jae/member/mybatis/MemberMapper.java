package a2team.yang.jae.member.mybatis;

import java.util.List;
import java.util.Map;

public interface MemberMapper {
	public List getAllMember(Map map);

	public int insertMember(Map map);

	public int updateMember(Map map);

	public int deleteMember(Map map);

	public int login(Map map);

	public int signup(Map map);

	public int signup_detail(Map map);

	public int payinfo_detail(Map map);

	public int checkId(Map map);

	public List selname(Map map);

}
