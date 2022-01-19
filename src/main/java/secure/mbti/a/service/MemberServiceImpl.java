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
	@Override
	public MemberDto login(MemberDto mem) {
		return dao.login(mem);
	}
	@Override
	public int getId(String id) {
		return dao.getId(id);
	}

	@Override
	public int getEmail(String email) {
		// TODO Auto-generated method stub
		return dao.getEmail(email);
	}

	@Override
	public int getAlias(String alias) {
		// TODO Auto-generated method stub
		return dao.getAlias(alias);
	}
	@Override
	public int getIdpwdcheck(MemberDto mem) {
		
		return dao.getIdpwdcheck(mem);
	}
	@Override
	public String getSalt(String id) {

		return dao.getSalt(id);
	}

}
