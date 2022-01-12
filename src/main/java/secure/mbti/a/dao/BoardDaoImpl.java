package secure.mbti.a.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import secure.mbti.a.dto.BoardDto;
import secure.mbti.a.dto.BoardParam;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	SqlSession session;

	String ns = "Board.";

	@Override
	public List<BoardDto> board_list(BoardParam param) {
		return session.selectList(ns+"board_list", param);
	}

	@Override
	public int board_write(BoardDto boardall) {		
		return session.insert(ns+"board_list", boardall);
	}

	@Override
	public BoardDto get_board(int boardseq) {
		return session.selectOne(ns+ "get_board", boardseq);

	}

	@Override
	public int board_countUp(int boardseq) {
		return session.update(ns+ "board_countUp", boardseq);

	}

	@Override
	public int board_update(BoardDto boardall) {
		return session.update(ns + "board_update", boardall);
	}

	@Override
	public int board_delete(int boardseq) {
		return session.delete(ns + "board_delete", boardseq);

	}
	




}
