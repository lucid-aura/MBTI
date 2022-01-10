package secure.mbti.a.dto;

import java.io.Serializable;

/*
0

INSERT INTO MEMBER(ID, PWD, NAME, EMAIL, AUTH)
VALUES('aaa', '111', '홍길동', 'aaa', 3);

INSERT INTO MEMBER(ID, PWD, NAME, EMAIL, AUTH)
VALUES('bbb', '222', '성춘향', 'bbb', 3);

INSERT INTO MEMBER(ID, PWD, NAME, EMAIL, AUTH)
VALUES('ccc', '333', '일지매', 'ccc', 3);

select * from MEMBER;

INSERT INTO MEMBER(ID, PWD, NAME, EMAIL, AUTH)
VALUES('ddd', '444', '홍두께', 'ddd', 3);
*/

public class WorldCupDto implements Serializable{	// = 직렬화
	private int seq;
	private String topic;
	private String name;
	private int choiceCount;
	
	public WorldCupDto() {
	}
	
	public WorldCupDto(int seq, String topic, String name, int choiceCount) {
		super();
		this.seq = seq;
		this.topic = topic;
		this.name = name;
		this.choiceCount = choiceCount;
	}
	public WorldCupDto(String topic, String name) {
		super();
		this.topic = topic;
		this.name = name;
		this.choiceCount = 0;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getTopic() {
		return topic;
	}
	public void setTopic(String topic) {
		this.topic = topic;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getChoiceCount() {
		return choiceCount;
	}
	public void setChoiceCount(int choiceCount) {
		this.choiceCount = choiceCount;
	}

	@Override
	public String toString() {
		return "WorldCupDto [seq=" + seq + ", topic=" + topic + ", name=" + name + ", choiceCount=" + choiceCount + "]";
	}
	
}
