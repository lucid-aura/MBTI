package secure.mbti.a.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import secure.mbti.a.dao.BoardDao;
import secure.mbti.a.dto.BoardDto;
import secure.mbti.a.dto.BoardParam;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDao dao;

	@Override
	public List<BoardDto> board_list(BoardParam param) {
		return dao.board_list(param);
	}

	@Override
	public int board_write(BoardDto boardall) {
		return dao.board_write(boardall);
	}

	@Override
	public BoardDto get_board(int boardseq) {
		return dao.get_board(boardseq);
	}

	@Override
	public int board_countUp(int boardseq) {
		return dao.board_countUp(boardseq);

	}

	@Override
	public int board_update(BoardDto boardall) {
		return dao.board_update(boardall);
	}

	@Override
	public int board_delete(int boardseq) {
		return dao.board_delete(boardseq);

	}
}
