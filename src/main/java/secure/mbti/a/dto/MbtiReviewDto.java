package secure.mbti.a.dto;

import java.io.Serializable;

/*CREATE TABLE MBTIREVIEW(
	    REVIEWSEQ NUMBER(10) PRIMARY KEY,
	    TARGETMBTI VARCHAR2(20) NOT NULL,
	    ID VARCHAR2(50) NOT NULL,
	    ASTERION NUMBER(1) NOT NULL,
	    REVIEW VARCHAR2(100) NOT NULL,
	    WDATE DATE NOT NULL,
	    DEL NUMBER(1) NOT NULL);*/


public class MbtiReviewDto implements Serializable{
	private int reviewseq;
	private String targetmbti;
	/* ID를 조회해서 가져온 MBTI(MBTIREVIEW에는 없는 column) */
	private String recordmbti; 
	private String id;
	private int asterion;
	private String review;
	private String wdate;
	private int del;
	
	public MbtiReviewDto() {
		
	}
	
	public MbtiReviewDto(String targetmbti) {
		super();
		this.targetmbti = targetmbti;
	}
	
	public MbtiReviewDto(String targetmbti, String id, String review) {
		super();
		this.targetmbti = targetmbti;
		this.id = id;
		this.review = review;
		
	}
	

	public MbtiReviewDto(int reviewseq, String targetmbti, String recordmbti, String id, int asterion, String review,
			String wdate, int del) {
		super();
		this.reviewseq = reviewseq;
		this.targetmbti = targetmbti;
		this.recordmbti = recordmbti;
		this.id = id;
		this.asterion = asterion;
		this.review = review;
		this.wdate = wdate;
		this.del = del;
	}

	public int getReviewseq() {
		return reviewseq;
	}

	public String getTargetmbti() {
		return targetmbti;
	}

	public String getRecordmbti() {
		return recordmbti;
	}

	public String getId() {
		return id;
	}

	public int getAsterion() {
		return asterion;
	}

	public String getReview() {
		return review;
	}

	public String getWdate() {
		return wdate;
	}

	public int getDel() {
		return del;
	}



	public void setReviewseq(int reviewseq) {
		this.reviewseq = reviewseq;
	}

	public void setTargetmbti(String targetmbti) {
		this.targetmbti = targetmbti;
	}

	public void setRecordmbti(String recordmbti) {
		this.recordmbti = recordmbti;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setAsterion(int asterion) {
		this.asterion = asterion;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public void setDel(int del) {
		this.del = del;
	}

	@Override
	public String toString() {
		return "MbtiReviewDto [reviewseq=" + reviewseq + ", targetmbti=" + targetmbti + ", recordmbti=" + recordmbti
				+ ", id=" + id + ", asterion=" + asterion + ", review=" + review + ", wdate=" + wdate + ", del=" + del
				+ "]";
	}

	

	
}
