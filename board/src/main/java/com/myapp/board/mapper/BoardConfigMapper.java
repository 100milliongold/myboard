package com.myapp.board.mapper;

import java.util.List;

import com.myapp.board.domain.BoardConfigVO;

//게시판 환경설정
public interface BoardConfigMapper {
	
//	//게시판 생성 나중에
//	public void boardCreate(BoardConfigVO vo)throws Exception;
//	
//	//게시판 설정 나중에
//	public void boardUpdate(BoardConfigVO vo)throws Exception;
	
	//게시판 목록
	public List<BoardConfigVO> boardConfigList()throws Exception;
	
	//게시판 설정보기
	public BoardConfigVO boardConfigView(String vo)throws Exception;
	
}
