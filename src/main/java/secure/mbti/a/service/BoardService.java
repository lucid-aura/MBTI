package secure.mbti.a.service;

import java.util.List;

import secure.mbti.a.dto.BoardDto;
import secure.mbti.a.dto.BoardParam;

public interface BoardService {
//	 bbsdao 에서 그대로 가져와서 여기 붙임,  bbslist 전체 글쓰기 모든 부수적인게 다 들어있는 객체
	List<BoardDto> board_list(BoardParam param);
	
	
	boolean board_write(BoardDto dto);
	
	
}
