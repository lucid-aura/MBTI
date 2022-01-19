package secure.mbti.a.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import secure.mbti.a.dao.MbtiDetailDao;
import secure.mbti.a.dto.MbtiDetailDto;

@Service
public class MbtiDetailServiceImpl implements MbtiDetailService{
	@Autowired
	MbtiDetailDao dao;
	@Override
	public List<String> mbtilist() {
		return dao.mbtilist();
	}
	@Override
	public MbtiDetailDto mbtidetail(String selectMenu) {
		return dao.mbtidetail(selectMenu);
	}
	@Override
	public String mbtiratio(String selectMbti) {
		return dao.mbtiratio(selectMbti);
	}
	@Override
	public void viewcount(String selectMbti) {
		dao.viewcount(selectMbti);
	}

}
