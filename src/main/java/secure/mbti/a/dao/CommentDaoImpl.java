package secure.mbti.a.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import secure.mbti.a.dto.CommentDto;

@Repository
public class CommentDaoImpl implements CommentDao {

	@Autowired
	SqlSession session;

	String ns = "Comment.";
	
	@Override
	public List<CommentDto> comment_list(int boardseq) {
		return session.selectList(ns+"commentlist", boardseq);
	}

	@Override
	public int comment_getcount(int boardseq) {
		return session.selectOne(ns + "commentcount", boardseq);
	}

	@Override
	public void comment_countUp(int boardseq) {
		session.update(ns + "commentcountup", boardseq);
	}
	
	@Override
	public void comment_write(CommentDto dto) {
		session.insert(ns + "commentwrite", dto);
	}

	@Override
	public void comment_update(CommentDto dto) {
		session.update(ns + "comment_update", dto);
	}

	@Override
	public void comment_delete(int commentseq) {
		System.out.println(commentseq + " dao delete");
		session.delete(ns + "commentdelete", commentseq);
	}
	
}

