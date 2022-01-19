package secure.mbti.a.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import secure.mbti.a.dto.MbtiReviewDto;

@Repository
public class MbtiReviewDaoImpl implements MbtiReviewDao {

	@Autowired
	SqlSession session;
	String namespace = "MbtiReview.";
	@Override
	public List<MbtiReviewDto> reviewlist(String selectMbti) {
		return session.selectList(namespace + "reviewlist", selectMbti);
	}
	@Override
	public int reviewwrite(MbtiReviewDto dto) {
		return session.insert(namespace + "reviewwrite", dto);
	}
	@Override
	public int reviewdelete(MbtiReviewDto dto) {
		return session.update(namespace + "reviewdelete", dto);
	}
	@Override
	public int reviewupdate(MbtiReviewDto dto) {
		return session.update(namespace + "reviewupdate", dto);
	}
	@Override
	public String reviewasterion(String selectMbti) {
		return session.selectOne(namespace + "reviewasterion", selectMbti);
	}



}
