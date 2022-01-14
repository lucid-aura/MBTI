package secure.mbti.a.dto;

import java.io.Serializable;

public class BoardParam implements Serializable{
	private String choice;
	private String search;
	private int boardtype;
	
	public BoardParam() {
	}
	@Override
	public String toString() {
		return "BoardParam [choice=" + choice + ", search=" + search + ", boardtype=" + boardtype + "]";
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
	public int getBoardtype() {
		return boardtype;
	}
	public void setBoardtype(int boardtype) {
		this.boardtype = boardtype;
	}
	public BoardParam(String choice, String search, int boardtype) {
		super();
		this.choice = choice;
		this.search = search;
		this.boardtype = boardtype;
	}
	
	
	
}
