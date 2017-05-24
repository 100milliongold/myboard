package com.myapp.board.service;

import java.util.List;

import com.myapp.board.domain.BoardConfigVO;
import com.myapp.board.domain.BoardVO;

//서비스
public interface BoardService {
	
	 //글작성
    public void boardInsert(String board_table,BoardVO board)throws Exception;
    
    //글목록
    public List<BoardVO> boardList(String board_table)throws Exception;
    
    //글보기
    public BoardVO boardView(String board_table, int bno)throws Exception;
    
    //조회수 증가
    public void hitPlus(String board_table, int bno)throws Exception;
    
    //글수정
    public void boardUpdate(String board_table, int bno, BoardVO board)throws Exception;
    
    //글삭제
    public void boardDelete(String board_table, int bno)throws Exception;
    
    //게시판 설정보기
  	public BoardConfigVO boardConfigView(String board_table)throws Exception;
    
}
