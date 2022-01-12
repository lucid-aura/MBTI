package secure.mbti.a.dto;

import java.io.Serializable;

/*CREATE TABLE WORLDCUP(
        WORLDCUPSEQ NUMBER(8) PRIMARY KEY,
        BOARDSEQ NUMBER(8) NOT NULL,
        TOPIC VARCHAR2(50) NOT NULL, 
        WORLDCUPNAME VARCHAR2(50) NOT NULL,
        CHOICECOUNT NUMBER(8) NOT NULL
    );
*/
public class WorldCupDto implements Serializable{	// = 직렬화
	private int worldcupseq;
	private int boardseq;
	private String topic;
	private String worldcupname;
	private int choicecount;
	
	public WorldCupDto() {
	}
	
	public WorldCupDto(int worldcupseq, int boardseq, String topic, String worldcupname, int choicecount) {
		super();
		this.worldcupseq = worldcupseq;
		this.boardseq = boardseq;
		this.topic = topic;
		this.worldcupname = worldcupname;
		this.choicecount = choicecount;
	}
	public WorldCupDto(String topic, String worldcupname) {
		super();
		this.topic = topic;
		this.worldcupname = worldcupname;
		this.choicecount = 0;
	}
	public int getWorldcupseq() {
		return worldcupseq;
	}
	public void setWorldcupseq(int worldcupseq) {
		this.worldcupseq = worldcupseq;
	}
	
	public int getBoardseq() {
		return boardseq;
	}

	public void setBoardseq(int boardseq) {
		this.boardseq = boardseq;
	}

	public String getTopic() {
		return topic;
	}
	public void setTopic(String topic) {
		this.topic = topic;
	}
	public String getWorldcupname() {
		return worldcupname;
	}
	public void setWorldcupname(String worldcupname) {
		this.worldcupname = worldcupname;
	}
	public int getChoicecount() {
		return choicecount;
	}
	public void setChoicecount(int choicecount) {
		this.choicecount = choicecount;
	}

	@Override
	public String toString() {
		return "WorldCupDto [worldcupseq=" + worldcupseq + ", boardseq=" + boardseq + ", topic=" + topic
				+ ", worldcupname=" + worldcupname + ", choicecount=" + choicecount + "]";
	}

}
