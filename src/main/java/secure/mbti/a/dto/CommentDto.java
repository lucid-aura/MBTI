package secure.mbti.a.dto;

import java.io.Serializable;

public class CommentDto implements Serializable {
	 private int commentseq;
	 private String alias;
	 private int boardseq;
	 private String content;
	 private String wdate;
	 private int del;
	 
	 
	 public CommentDto() {
	}
	 
	public CommentDto(int commentseq, String alias, int boardseq, String content, String wdate, int del) {
		super();
		this.commentseq = commentseq;
		this.alias = alias;
		this.boardseq = boardseq;
		this.content = content;
		this.wdate = wdate;
		this.del = del;
	}

	public CommentDto(String content) {
		super();
		this.content = content;
		this.del = 0;
	}

	public int getCommentseq() {
		return commentseq;
	}

	public void setCommentseq(int commentseq) {
		this.commentseq = commentseq;
	}

	public String getAlias() {
		return alias;
	}

	public void setAlias(String alias) {
		this.alias = alias;
	}

	public int getBoardseq() {
		return boardseq;
	}

	public void setBoardseq(int boardseq) {
		this.boardseq = boardseq;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	@Override
	public String toString() {
		return "CommentDto [commentseq=" + commentseq + ", alias=" + alias + ", boardseq=" + boardseq + ", content="
				+ content + ", wdate=" + wdate + ", del=" + del + "]";
	}
	
	
	


}
