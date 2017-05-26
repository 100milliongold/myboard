package com.myapp.board.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myapp.board.domain.BoardConfigVO;
import com.myapp.board.domain.BoardVO;
import com.myapp.board.mapper.BoardConfigMapper;
import com.myapp.board.mapper.BoardMapper;

//브릿지 패턴
@Service
@MapperScan(value = {"com.myapp.board.mapper"})
public class BoardServiceImpl implements BoardService{
	
	@Autowired
    private BoardMapper boardMapper;
    @Autowired
    private BoardConfigMapper boardConfigMapper;

    //게시판 작성
	@Override
	public void boardInsert(String board_table,BoardVO board) throws Exception {
		// TODO Auto-generated method stub
		
		//게시판 기본정보 얻기
    	BoardConfigVO boardconfig = boardConfigMapper.boardConfigView(board_table.toLowerCase());
    	//찾는 게시판이 없을경우
    	if(boardconfig == null){
    		 return ;
    	}
    	
    	//저장하기전에 여러파라미터를 해시맵을 통하여 전송
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	map.put("boardconfig", boardconfig); //게시판설정 삽입
    	map.put("board", board); //게시판 입력값
       
    	//데이터 저장
    	boardMapper.boardInsert(map);
	}

	//게시판 리스트
	@Override
	public List<BoardVO> boardList(String board_table) throws Exception {
		// TODO Auto-generated method stub
		//게시판 기본정보 얻기
    	BoardConfigVO boardconfig = boardConfigMapper.boardConfigView(board_table.toLowerCase());
    	
    	//찾는 게시판이 없을경우
    	if(boardconfig == null){
    		 return null;
    	}
		
		//게시판리스트를 불려오기전에 해시맵을 통하여 여러개의 정보추출
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	map.put("boardconfig", boardconfig); //게시판설정 삽입
    	
    	
    	List<BoardVO> list = boardMapper.boardList(map); //게시판 쿼리문
    	
    	return list;
	}
	
	//게시판 리스트 -페이지 적용
	@Override
	public List<BoardVO> boardList(String board_table, int page, int rows) throws Exception {
		// TODO Auto-generated method stub
		
		//게시판 기본정보 얻기
    	BoardConfigVO boardconfig = boardConfigMapper.boardConfigView(board_table.toLowerCase());
    	//찾는 게시판이 없을경우
    	if(boardconfig == null){
    		return null;
    	}

    	if (page == 0) { page = 1; } // 페이지가 없으면 첫 페이지 (1 페이지)
    	int from_record = (page - 1) * rows; // 시작 열을 구함
    	int end_record = ( page * rows )-1; // 마직막 열을 구함
    	
    	
    	//게시판리스트를 불려오기전에 해시맵을 통하여 여러개의 정보추출
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	map.put("boardconfig", boardconfig); //게시판설정 삽입
    	map.put("from_record", from_record); //시작번호 삽입
    	map.put("end_record", end_record); //마직막 삽입
    	
    	List<BoardVO> list = boardMapper.boardList2(map); //게시판 쿼리문
		return list;
	}

	//게시판보기
	@Override
	public BoardVO boardView(String board_table, int bno) throws Exception {
		// TODO Auto-generated method stub
		
		//게시판 기본정보 얻기
    	BoardConfigVO boardconfig = boardConfigMapper.boardConfigView(board_table.toLowerCase());
    	
    	//찾는 게시판이 없을경우
    	if(boardconfig == null){
    		 return null;
    	}
    	
    	//조회전에 여러파라미터를 해시맵을 통하여 전송
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	map.put("boardconfig", boardconfig); //게시판설정 삽입
    	map.put("bno", bno); //게시판조회번호 삽입
            
        BoardVO board = boardMapper.boardView(map);
    	
		return board;
	}

	//조회수 증가
	@Override
	public void hitPlus(String board_table, int bno) throws Exception {
		// TODO Auto-generated method stub
		//게시판 기본정보 얻기
    	BoardConfigVO boardconfig = boardConfigMapper.boardConfigView(board_table.toLowerCase());
    	
    	//찾는 게시판이 없을경우
    	if(boardconfig == null){
    		 return ;
    	}
    	
    	//조회하기전에 여러파라미터를 해시맵을 통하여 전송
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	map.put("boardconfig", boardconfig); //게시판설정 삽입
    	map.put("bno", bno); //게시판조회번호 삽입
    	        
        boardMapper.hitPlus(map);
	}

	//수정
	@Override
	public void boardUpdate(String board_table, int bno, BoardVO board) throws Exception {
		// TODO Auto-generated method stub
		
		//게시판 기본정보 얻기
    	BoardConfigVO boardconfig = boardConfigMapper.boardConfigView(board_table.toLowerCase());
    	//찾는 게시판이 없을경우
    	if(boardconfig == null){
    		return ;
    	}
    	
    	//저장하기전에 여러파라미터를 해시맵을 통하여 전송
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	map.put("boardconfig", boardconfig); //게시판설정 삽입
    	map.put("board", board); //게시판내용 삽입
    	map.put("bno", bno); //수정할 번호 삽입
    	
    	//게시판 내용 업데이트
    	boardMapper.boardUpdate(map);
	}

	//삭제
	@Override
	public void boardDelete(String board_table, int bno) throws Exception {
		// TODO Auto-generated method stub
		
		//게시판 기본정보 얻기
    	BoardConfigVO boardconfig = boardConfigMapper.boardConfigView(board_table.toLowerCase());
    	//찾는 게시판이 없을경우
    	if(boardconfig == null){
    		return ;
    	}
    	
    	//지우기전에 여러파라미터를 해시맵을 통하여 전송
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	map.put("boardconfig", boardconfig); //게시판설정 삽입
    	map.put("bno", bno); //삭제할 번호 삽입
    	
        boardMapper.boardDelete(map);
	}

	//게시판 정보보기
	@Override
	public BoardConfigVO boardConfigView(String board_table) throws Exception {
		// TODO Auto-generated method stub
		//게시판 기본정보 얻기
    	BoardConfigVO boardconfig = boardConfigMapper.boardConfigView(board_table.toLowerCase());
    	//찾는 게시판이 없을경우
    	if(boardconfig == null){
    		return null;
    	}
    	
    	
		return boardconfig;
	}

	//게시판 글수
	@Override
	public int boardCount(String board_table) throws Exception {
		// TODO Auto-generated method stub
		//게시판 기본정보 얻기
    	BoardConfigVO boardconfig = boardConfigMapper.boardConfigView(board_table.toLowerCase());
    	//찾는 게시판이 없을경우
    	if(boardconfig == null){
    		return 0;
    	}
    	
    	//계산전에 여러파라미터를 해시맵을 통하여 전송
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	map.put("boardconfig", boardconfig); //게시판설정 삽입
    	
		return boardMapper.boardCount(map);
	}

	//게시판 테이블 목록
	@Override
	public List<BoardConfigVO> boardConfigList() throws Exception {
		// TODO Auto-generated method stub
		
		List<BoardConfigVO> list = boardConfigMapper.boardConfigList(); //게시판 쿼리문
		return list;
	}

	//게시판 테이블 생성
	@Override
	public void boardConfigInsert(BoardConfigVO boardconfig) throws Exception {
		// TODO Auto-generated method stub
		
		
    	
    	
    	//저장하기전에 여러파라미터를 해시맵을 통하여 전송
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	map.put("boardconfig", boardconfig); //게시판설정 삽입
    	
    	boardConfigMapper.boardCofigInsert(map); //게시판 설정 생성
    	boardConfigMapper.boardCreate(map);
    	boardConfigMapper.boardCreateSequence(map);
	}

}
