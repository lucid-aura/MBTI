package secure.mbti.a.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import secure.mbti.a.dto.MemberDto;
@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	SqlSession session;
	
	String ns = "Membermbti.";
	
	@Override
	public int addmember(MemberDto mem) {
		return session.insert(ns+"addmember", mem);
	}

	@Override
	public int getId(String id) {
		
		return session.selectOne(ns+"getId", id);
	}

	@Override
	public MemberDto login(MemberDto mem) {		
		return session.selectOne(ns+"login", mem);
	}

	@Override
	public int getEmail(String email) {
		// TODO Auto-generated method stub
		return session.selectOne(ns+"getEmail", email);
	}

	@Override
	public int getAlias(String alias) {
		// TODO Auto-generated method stub
		return session.selectOne(ns+"getAlias", alias);
	}

	@Override
	public int getIdpwdcheck(MemberDto mem) {

		return session.selectOne(ns+"getIdpwdcheck", mem);
	}



}
