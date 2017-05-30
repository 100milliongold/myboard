package com.myapp.board.domain;

public class BoardConfigVO {
	
	private String board_name;
	private String board_table;
	
	

	public String getBoard_name() {
		return board_name;
	}
	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}
	public String getBoard_table() {
		return board_table.toLowerCase();
	}
	public void setBoard_table(String board_table) {
		this.board_table = board_table;
	}
}
