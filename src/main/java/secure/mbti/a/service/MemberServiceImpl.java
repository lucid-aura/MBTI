package secure.mbti.a.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import secure.mbti.a.dao.MemberDao;
import secure.mbti.a.dto.MemberDto;
@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDao dao;
	
	@Override
	public int addmember(MemberDto mem) {
		return dao.addmember(mem);
	}
	
	public MemberDto login(MemberDto mem) {
		return dao.login(mem);
	}
	
	public int getId(String id) {
		return dao.getId(id);
	}

}
