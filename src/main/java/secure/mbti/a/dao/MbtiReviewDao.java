package secure.mbti.a.dao;

import java.util.List;

import secure.mbti.a.dto.MbtiReviewDto;

public interface MbtiReviewDao {
	List<MbtiReviewDto> reviewlist(String selectMbti);
	int reviewwrite(MbtiReviewDto dto);
	int reviewdelete(MbtiReviewDto dto);
	int reviewupdate(MbtiReviewDto dto);
	String reviewasterion(String selectMbti);
	
}
