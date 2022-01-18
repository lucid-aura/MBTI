package secure.mbti.a.service;

import java.util.List;

import secure.mbti.a.dto.MbtiDetailDto;
import secure.mbti.a.dto.MemberDto;

public interface MbtiDetailService {
	List<String> mbtilist();
	MbtiDetailDto mbtidetail(String selectMenu);
	String mbtiratio(String selectMbti);
	void viewcount(String selectMbti);

}
