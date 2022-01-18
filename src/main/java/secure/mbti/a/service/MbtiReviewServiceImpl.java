package secure.mbti.a.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import secure.mbti.a.dao.MbtiReviewDao;
import secure.mbti.a.dto.MbtiReviewDto;


@Service
public class MbtiReviewServiceImpl implements MbtiReviewService{

	@Autowired
	MbtiReviewDao dao;
	@Override
	public List<MbtiReviewDto> reviewlist(String selectMbti) {
		return dao.reviewlist(selectMbti);
	}
	@Override
	public boolean reviewwrite(MbtiReviewDto dto) {
		int result = dao.reviewwrite(dto);
		return result>0 ? true : false;
	}
	@Override
	public boolean reviewdelete(MbtiReviewDto dto) {
		int result = dao.reviewdelete(dto);
		return result>0 ? true : false;
	}
	@Override
	public boolean reviewupdate(MbtiReviewDto dto) {
		int result = dao.reviewupdate(dto);
		return result>0 ? true : false;
	}
	@Override
	public String reviewasterion(String selectMbti) {
		return dao.reviewasterion(selectMbti);
	}

}
