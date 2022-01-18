package secure.mbti.a.service;

import java.util.List;

import secure.mbti.a.dto.MbtiReviewDto;

public interface MbtiReviewService {
	List<MbtiReviewDto> reviewlist(String selectMbti);
	boolean reviewwrite(MbtiReviewDto dto);
	boolean reviewdelete(MbtiReviewDto dto);
	boolean reviewupdate(MbtiReviewDto dto);
	String reviewasterion(String selectMbti);
}
