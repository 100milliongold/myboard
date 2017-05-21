package com.myapp.board.mapper;
 
 
import java.util.HashMap;
import java.util.List;

import com.myapp.board.domain.BoardConfigVO;
import com.myapp.board.domain.BoardVO;
 
public interface BoardMapper {
 
    //글작성
    public void boardInsert(HashMap<String, Object> map)throws Exception;
    
    //글목록
    public List<BoardVO> boardList(HashMap<String, Object> map)throws Exception;
    
    //글보기
    public BoardVO boardView(HashMap<String, Object> map)throws Exception;
    
    //조회수 증가
    public void hitPlus(HashMap<String, Object> map)throws Exception;
    
    //글수정
    public void boardUpdate(HashMap<String, Object> map)throws Exception;
    
    //글삭제
    public void boardDelete(HashMap<String, Object> map)throws Exception;
}