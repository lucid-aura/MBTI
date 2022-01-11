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
	public List<BoardDto> board_list(BoardParam param){
		return dao.board_list(param);
	}
	
	@Override
	public boolean board_write(BoardDto dto) {
		int count = dao.board_write(dto);
		return count > 0?true:false;
	}
}
