package secure.mbti.a.dto;

import java.io.Serializable;

/*CREATE TABLE COMMENTMBTI(
        COMMENTSEQ NUMBER(8) PRIMARY KEY,
        ALIAS VARCHAR2(50) NOT NULL, 
        BOARDSEQ NUMBER(8) NOT NULL,
        REF NUMBER(8) NOT NULL,
        STEP NUMBER(8) NOT NULL,
        DEPTH NUMBER(8) NOT NULL,
        CONTENT VARCHAR2(4000) NOT NULL,
        WDATE DATE NOT NULL,
        DEL NUMBER(1) NOT NULL
);*/

public class CommentDto implements Serializable {
	 private int commentseq;
	 private String alias;
	 private int boardseq;
	 private int ref;
	 private int step;
	 private int depth;
	 private String content;
	 private String wdate;
	 private int del;
	 
	 
	 public CommentDto() {
	}
	 
	public CommentDto(int commentseq, String alias, int boardseq, int ref, int step, int depth, String content,
			String wdate, int del) {
		super();
		this.commentseq = commentseq;
		this.alias = alias;
		this.boardseq = boardseq;
		this.ref = ref;
		this.step = step;
		this.depth = depth;
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
	
	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
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
