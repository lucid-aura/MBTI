package secure.mbti.a.dto;

import java.io.Serializable;

public class BoardDto implements Serializable{
	/*
	 * CREATE TABLE BOARDALL( BOARDSEQ NUMBER(8) PRIMARY KEY, ID VARCHAR2(50) NOT
	 * NULL, TITLE VARCHAR2(200) NOT NULL, CONTENT VARCHAR2(4000) NOT NULL,
	 * READCOUNT NUMBER(8) NOT NULL, COMMENTCOUNT NUMBER(8) NOT NULL,
	 * 
	 * WDATE DATE NOT NULL, DEL NUMBER(1) NOT NULL );
	 * 
	 * 
	 * CREATE SEQUENCE BOARDSEQ START WITH 1 INCREMENT BY 1;
	 */
	
	private int boardseq;
	private String id; 	// 작성자 
	
	private String title; // 제목
	private String content; // 내용
	private String wdate; // 작성일
	
	private int del;		// 삭제
	private int readcount;  // 조회수
	private int commentcount; // 댓글수
	
	public BoardDto() {
		
	}
	
	// 외부에 의해 변하는 변수들.  아이디 제목 내용
	public BoardDto(String id, String title, String content) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
	}
	
	public BoardDto(int boardseq, String id, String title, String content, String wdate, int del, int readcount,
			int commentcount) {
		super();
		this.boardseq = boardseq;
		this.id = id;
		this.title = title;
		this.content = content;
		this.wdate = wdate;
		this.del = del;
		this.readcount = readcount;
		this.commentcount = commentcount;
	}

	public int getBoardseq() {
		return boardseq;
	}

	public void setBoardseq(int boardseq) {
		this.boardseq = boardseq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public int getCommentcount() {
		return commentcount;
	}

	public void setCommentcount(int commentcount) {
		this.commentcount = commentcount;
	}

	@Override
	public String toString() {
		return "BoardDto [boardseq=" + boardseq + ", id=" + id + ", title=" + title + ", content=" + content
				+ ", wdate=" + wdate + ", del=" + del + ", readcount=" + readcount + ", commentcount=" + commentcount
				+ "]";
	}


	
	
}
