package secure.mbti.a.dao;

import java.util.List;

import secure.mbti.a.dto.CommentDto;

public interface CommentDao {
	List<CommentDto> comment_list(int boardseq);
	int comment_getcount(int boardseq);
	void comment_countUp(int boardseq);
	void comment_write(CommentDto dto);
	void comment_update(CommentDto dto);
	void comment_delete(int commentseq);

}
