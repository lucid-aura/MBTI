package secure.mbti.a.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import secure.mbti.a.dto.BoardDto;
import secure.mbti.a.dto.BoardParam;

public interface BoardDao {
	
	List<BoardDto> board_list(BoardParam param);
	
	int board_write(BoardDto dto);
	
	BoardDto getBoard(int seq);
	//  crud  r = 행을 반환
	// cud = int 로 반환되고 void로 반환 안되는경우도있다 마
	
	
}
