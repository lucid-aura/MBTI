package secure.mbti.a.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import secure.mbti.a.dto.BoardDto;
import secure.mbti.a.dto.BoardParam;
import secure.mbti.a.dto.Criteria;

@Repository
public class BoardDaoImpl implements BoardDao{
	@Autowired
	SqlSession session;		// mybatis 사용하기 위해
	
	String ns = "Board.";   // namespace ns

	@Override
	public List<BoardDto> board_list(BoardParam param) {
	
		return session.selectList(ns+"boardlist", param);  // mybatis를 이용할때 dao + 무조건 xml 과 연동된다 이건 id와 같다. xml
	}

	@Override
	public int board_write(BoardDto dto) {   // dto > bbs였었음(강의자료)
		
		return session.insert(ns+"boardwrite", dto);
	}

	@Override
	public BoardDto get_board(int boardseq) {
		
		return session.selectOne(ns + "getboard", boardseq);
	}

	@Override
	public int board_countUp(int boardseq) {
		return session.update(ns+"boardcountup", boardseq);
	}

	@Override
	public void board_update(BoardDto dto) {
		session.update(ns+ "boardupdate", dto);
		
	}

	@Override
	public void board_delete(int boardseq) {
		session.delete(ns+"boarddelete", boardseq);
		
	}

	@Override
	public List<BoardDto> board_list_page(BoardParam param) {
		
		return session.selectList(ns+"listPage", param);  // mybatis를 이용할때 dao + 무조건 xml 과 연동된다 이건 id와 같다. xml
	}
	
	
}
