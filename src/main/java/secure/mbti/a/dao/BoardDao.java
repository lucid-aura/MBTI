package secure.mbti.a.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import secure.mbti.a.dto.BoardDto;
import secure.mbti.a.dto.BoardParam;
import secure.mbti.a.dto.Criteria;

public interface BoardDao {
//	
//	+board_list
//	+board_write
//	+get_board
//	+board_countUp
//	+board_update
//	+board_delete

	
	List<BoardDto> board_list(BoardParam param);
	int board_write(BoardDto dto);
	BoardDto get_board(int boardseq);
	// crud  
	// r = 행을 반환
	// cud = int 로 반환되고 void로 반환 안되는경우도있다 마
	int board_countUp(int boardseq); // 조회수 증가
	
	void board_update(BoardDto dto);
	
	void board_delete(int boardseq);
	
	
	
	//페이징
	List<BoardDto> board_list_page(BoardParam param);
	void board_commentcountup(int boardseq);
	
	void board_commentcountdown(int boardseq);
	
	
}
