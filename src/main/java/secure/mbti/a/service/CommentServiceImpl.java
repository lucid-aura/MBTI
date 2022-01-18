package secure.mbti.a.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import secure.mbti.a.dao.CommentDao;
import secure.mbti.a.dto.CommentDto;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	CommentDao dao;
	
	@Override
	public List<CommentDto> comment_list(int boardseq) {
		return dao.comment_list(boardseq);
	}

	@Override
	public int comment_getcount(int boardseq) {
		return dao.comment_getcount(boardseq);
	}

	@Override
	public void comment_countUp(int boardseq) {
		dao.comment_countUp(boardseq);
	}

	@Override
	public void comment_write(CommentDto dto) {
		dao.comment_write(dto);
	}

	@Override
	public void comment_update(CommentDto dto) {
		dao.comment_update(dto);
	}

	@Override
	public void comment_delete(int commentseq) {
		dao.comment_delete(commentseq);
	}

	@Override
	public void comment_reply(CommentDto dto) {
		dao.comment_reply(dto);
	}

	@Override
	public CommentDto get_comment(int commentseq) {
		return dao.get_comment(commentseq);
	}


	public void comment_reply_update(CommentDto comment) {
		dao.comment_reply_update(comment);
	}

}
