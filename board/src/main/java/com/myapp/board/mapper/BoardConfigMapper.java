package com.myapp.board.mapper;

import java.util.HashMap;
import java.util.List;

import com.myapp.board.domain.BoardConfigVO;

//게시판 환경설정
public interface BoardConfigMapper {
	
//	//게시판 설정 나중에
//	public void boardUpdate(BoardConfigVO vo)throws Exception;
	
	//게시판 목록
	public List<BoardConfigVO> boardConfigList()throws Exception;
	
	//게시판 설정보기
	public BoardConfigVO boardConfigView(String vo)throws Exception;

	//게시판 생성
	public void boardCofigInsert(HashMap<String, Object> map)throws Exception;

	public void boardCreate(HashMap<String, Object> map)throws Exception;

	public void boardCreateSequence(HashMap<String, Object> map)throws Exception;
}
