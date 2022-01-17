package secure.mbti.a.dto;

import java.io.Serializable;

public class BoardParam implements Serializable{
	private String choice;
	private String search;
	private Criteria criteria;
	private int boardtype;
	
	public int getBoardtype() {
		return boardtype;
	}

	public void setBoardtype(int boardtype) {
		this.boardtype = boardtype;
	}

	public BoardParam() {

	}

	public String getChoice() {
		return choice;
	}

	public void setChoice(String choice) {
		this.choice = choice;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public Criteria getCriteria() {
		return criteria;
	}

	public void setCriteria(Criteria criteria) {
		this.criteria = criteria;
	}

	public BoardParam(String choice, String search, Criteria criteria, int boardtype) {
		super();
		this.choice = choice;
		this.search = search;
		this.criteria = criteria;
		this.boardtype = boardtype;
	}
	

	@Override
	public String toString() {
		return "BoardParam [choice=" + choice + ", search=" + search + ", criteria=" + criteria.toString() + "]";
	}

	
}
