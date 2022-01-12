package secure.mbti.a.service;

import java.util.List;

import secure.mbti.a.dto.BoardDto;
import secure.mbti.a.dto.BoardParam;

public interface BoardService {

	List<BoardDto> board_list(BoardParam param);
	
	int board_write(BoardDto boardall);
	
	BoardDto get_board(int boardseq);
	
	int board_countUp(int boardseq);
	
	int board_update(BoardDto boardall);
	
	int board_delete(int boardseq);

}
