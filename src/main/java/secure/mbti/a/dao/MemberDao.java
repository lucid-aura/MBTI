package secure.mbti.a.dao;

import secure.mbti.a.dto.MemberDto;

public interface MemberDao {
	int addmember(MemberDto mem);
	
	int getId(String id);
	
	MemberDto login(MemberDto mem);
	

}