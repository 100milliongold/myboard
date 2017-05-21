package com.myapp.board.mapper;

import java.util.List;

import com.myapp.board.domain.BoardConfigVO;

public interface BoardConfigMapper {
	
//	//게시판 생성
//	public void boardCreate(BoardConfigVO vo)throws Exception;
//	
//	//게시판 설정
//	public void boardUpdate(BoardConfigVO vo)throws Exception;
	
	//게시판 목록
	public List<BoardConfigVO> boardConfigList()throws Exception;
	
	//게시판 설정보기
	public BoardConfigVO boardConfigView(String vo)throws Exception;
}
