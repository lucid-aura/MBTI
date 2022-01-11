package secure.mbti.a.dao;

import java.util.List;

import secure.mbti.a.dto.BoardDto;
import secure.mbti.a.dto.BoardParam;

public interface BoardDao {

	List<BoardDao> boardlist(BoardParam param);
	
	int writeboard(BoardDto dto);
	
	BoardDao getBoard(int boardseq);
	
	int replyBoardUpdate(BoardDto dto);
	int replyBoardInsert(BoardDto dto);
}
