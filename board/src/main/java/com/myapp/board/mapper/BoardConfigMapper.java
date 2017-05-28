package com.myapp.board.mapper;

import java.util.HashMap;
import java.util.List;

import com.myapp.board.domain.BoardConfigVO;

//게시판 환경설정
public interface BoardConfigMapper {
	
	//게시판 목록
	public List<BoardConfigVO> boardConfigList()throws Exception;
	
	//게시판 설정보기
	public BoardConfigVO boardConfigView(String vo)throws Exception;

	//게시판 생성
	public void boardCofigInsert(HashMap<String, Object> map)throws Exception;

	//게시판 테이블 생성
	public void boardCreate(HashMap<String, Object> map)throws Exception;

	//게시판 시퀀스 생성
	public void boardCreateSequence(HashMap<String, Object> map)throws Exception;

	//게시판 속성 업데이트
	public void boardConfigUpdate(HashMap<String, Object> map)throws Exception;

	//게시판 삭제
	public void boardConfigDelete(HashMap<String, Object> map)throws Exception;

	//게시판 테이블 드롭
	public void boardDrop(HashMap<String, Object> map)throws Exception;

	//게시판 시퀀스 삭제
	public void boardDeleteSequence(HashMap<String, Object> map)throws Exception;
}
