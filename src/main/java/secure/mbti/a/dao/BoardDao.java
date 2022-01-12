package secure.mbti.a.dao;

import java.util.List;

import secure.mbti.a.dto.BoardDto;
import secure.mbti.a.dto.BoardParam;

public interface BoardDao {
	List<BoardDto> board_list(BoardParam param);
	
	int board_write(BoardDto dto);
	
	BoardDto getBoard(int seq);
	
	
	
}
