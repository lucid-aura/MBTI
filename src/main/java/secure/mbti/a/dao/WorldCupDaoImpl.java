package secure.mbti.a.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import secure.mbti.a.dto.WorldCupDto;

@Repository
public class WorldCupDaoImpl implements WorldCupDao {
	
	@Autowired
	SqlSession session;

	String ns = "WorldCup.";
	
	@Override
	public List<WorldCupDto> worldcuplist(String topic) {
		return session.selectList(ns+"worldcuplist", topic);
	}

	@Override
	public WorldCupDto worldcupresult(int worldcupseq) {
		session.update(ns + "worldcupcount", worldcupseq);
		return session.selectOne(ns + "worldcupone", worldcupseq );
	}

}
