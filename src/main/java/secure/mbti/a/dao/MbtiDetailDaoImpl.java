package secure.mbti.a.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import secure.mbti.a.dto.MbtiDetailDto;

@Repository
public class MbtiDetailDaoImpl implements MbtiDetailDao{

	@Autowired
	SqlSession session;
	String namespace="MbtiDetail.";
	@Override
	public List<String> mbtilist() {
		return session.selectList(namespace + "mbtilist");
	}
	@Override
	public MbtiDetailDto mbtidetail(String selectMenu) {
		return session.selectOne(namespace + "mbtidetail", selectMenu);
	}
	@Override
	public String mbtiratio(String selectMbti) {
		return session.selectOne(namespace + "mbtiratio", selectMbti);
	}
	@Override
	public void viewcount(String selectMbti) {
		session.update(namespace+"viewcount", selectMbti);
	}	

}
