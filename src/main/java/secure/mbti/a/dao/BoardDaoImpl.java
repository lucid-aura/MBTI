package secure.mbti.a.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import secure.mbti.a.dto.BoardDto;
import secure.mbti.a.dto.BoardParam;

@Repository
public class BoardDaoImpl implements BoardDao{
	@Autowired
	SqlSession session;		// mybatis 사용하기 위해
	
	String ns = "Board.";   // namespace ns
	
	@Override
	public List<BoardDto> board_list(BoardParam param){
		return session.selectList(ns + "board_list", param);
	}

	@Override
	public int board_write(BoardDto dto) {
		
		int count = session.insert(ns + "board_write", dto);
		return count;
	}

	@Override
	public BoardDto getBoard(int seq) {
		return session.selectOne(ns + "getBoard", seq);
	}
}
