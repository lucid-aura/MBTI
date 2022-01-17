package secure.mbti.a.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import secure.mbti.a.dto.CommentDto;

public interface CommentService {
	List<CommentDto> comment_list(int boardseq);
	int comment_getcount(int boardseq);
	void comment_countUp(int boardseq);
	void comment_write(CommentDto dto);
	void comment_update(CommentDto dto);
	void comment_delete(int commentseq);
	void comment_reply(CommentDto dto);
	
	CommentDto get_comment(int commentseq);
	
}
