package secure.mbti.a.dao;

import java.util.List;

import secure.mbti.a.dto.MbtiDetailDto;
import secure.mbti.a.dto.MemberDto;

public interface MbtiDetailDao {
	
	List<String> mbtilist();
	MbtiDetailDto mbtidetail(String selectMenu);
	String mbtiratio(String selectMbti);
	void viewcount(String selectMbti);
	
}
