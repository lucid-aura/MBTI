package secure.mbti.a.service;

import org.springframework.stereotype.Service;

import secure.mbti.a.dto.MemberDto;

public interface MemberService {
	int addmember(MemberDto mem);
	
	MemberDto login(MemberDto mem);
	
	 int getId(String id);
	 
	 int getEmail(String email);
	 
	 int getAlias(String alias);
}
