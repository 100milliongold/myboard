package com.myapp.board.service;

import java.util.List;

import com.myapp.board.domain.BoardConfigVO;
import com.myapp.board.domain.BoardVO;
import com.myapp.board.domain.ReplyVO;

//서비스
public interface BoardService {
	
	 //글작성
    public void boardInsert(String board_table,BoardVO board)throws Exception;
    
    //글목록
    public List<BoardVO> boardList(String board_table)throws Exception;
    
    //글목록 - 페이지
    public List<BoardVO> boardList(String board_table, int page, int row)throws Exception;
    
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
  	
  	//게시판 글수
    public int boardCount(String board_table) throws Exception;

    //게시판테이블 목록
	public List<BoardConfigVO> boardConfigList() throws Exception;

	//게시판테이블 생성
	public void boardConfigInsert(BoardConfigVO boardconfig) throws Exception;

	//게시판 수정
	public void boardConfigUpdate(String board_table, BoardConfigVO boardconfig) throws Exception;

	//게시판 삭제
	public void boardConfigDelete(String board_table) throws Exception;

	//댓글 리스트
	public List<ReplyVO> replyList(String board_table, int bno) throws Exception;

	//댓글 입력
	public void replyInsert(String board_table, int bno, ReplyVO reply) throws Exception;

	//댓글 수정
	public void replyUpdate(String board_table, int bno, ReplyVO reply) throws Exception;

	//댓글 삭제
	public void replyDelete(String board_table, int cno) throws Exception;
}
