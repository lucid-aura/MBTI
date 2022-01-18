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
	public int board_write(BoardDto dto) {
		return dao.board_write(dto);
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
	public void board_update(BoardDto dto) {
		dao.board_update(dto);
		
	}

	@Override
	public void board_delete(int boardseq) {
		dao.board_delete(boardseq);
		
	}

	@Override
	public List<BoardDto> board_list_page(BoardParam param) {
		return dao.board_list_page(param);
	}
	
	
}
