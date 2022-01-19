package secure.mbti.a.dto;

import java.io.Serializable;

/*CREATE TABLE MBTIDETAIL(
	    MBTISEQ NUMBER(2) PRIMARY KEY,
	    MBTI VARCHAR2(20) NOT NULL,
	    MBTIDIVIDE VARCHAR2(20) NOT NULL,
	    SUBTITLE VARCHAR2(100) NOT NULL,
	    SUMMARY VARCHAR2(3000) NOT NULL,
	    CONTENT CLOB NOT NULL,
	    BESTRELATION VARCHAR2(50) NOT NULL,
	    WORSTRELATION VARCHAR2(50) NOT NULL,
	    VIEWCOUNT NUMBER(20) NOT NULL);*/
public class MbtiDetailDto implements Serializable{
	private int mbtiseq;
	private String mbti;
	private String mbtidivide;
	private String subtitle;
	private String summary;
	private String content;
	private String bestrelation;
	private String worstrelation;
	private int viewcount;
	
	
	public MbtiDetailDto() {		
	}


	public MbtiDetailDto(int mbtiseq, String mbti, String mbtidivide, String subtitle, String summary, String content,
			String bestrelation, String worstrelation, int viewcount) {
		super();
		this.mbtiseq = mbtiseq;
		this.mbti = mbti;
		this.mbtidivide = mbtidivide;
		this.subtitle = subtitle;
		this.summary = summary;
		this.content = content;
		this.bestrelation = bestrelation;
		this.worstrelation = worstrelation;
		this.viewcount = viewcount;
	}


	public int getViewcount() {
		return viewcount;
	}


	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
	}


	public int getMbtiseq() {
		return mbtiseq;
	}


	public String getMbti() {
		return mbti;
	}


	public String getMbtidivide() {
		return mbtidivide;
	}


	public String getSubtitle() {
		return subtitle;
	}


	public String getSummary() {
		return summary;
	}


	public String getContent() {
		return content;
	}


	public String getBestrelation() {
		return bestrelation;
	}


	public String getWorstrelation() {
		return worstrelation;
	}


	@Override
	public String toString() {
		return "MbtiDetailDto [mbtiseq=" + mbtiseq + ", mbti=" + mbti + ", mbtidivide=" + mbtidivide + ", subtitle="
				+ subtitle + ", summary=" + summary + ", content=" + content + ", bestrelation=" + bestrelation
				+ ", worstrelation=" + worstrelation + ", viewcount=" + viewcount + "]";
	}

	
	
}
