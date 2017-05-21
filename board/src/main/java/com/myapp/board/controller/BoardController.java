package com.myapp.board.controller;
 
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myapp.board.domain.BoardConfigVO;
import com.myapp.board.domain.BoardVO;
import com.myapp.board.mapper.BoardConfigMapper;
import com.myapp.board.mapper.BoardMapper;
 
@Controller
@RequestMapping("/board/{board_table}")
public class BoardController {
 
    @Autowired
    private BoardMapper boardMapper;
    @Autowired
    private BoardConfigMapper boardConfigMapper;
    
    
    //게시글 목록
    @RequestMapping(method=RequestMethod.GET)
    public ModelAndView list(@PathVariable("board_table") String board_table) throws Exception{
    	
    	//게시판 기본정보 얻기
    	BoardConfigVO boardconfig = boardConfigMapper.boardConfigView(board_table.toLowerCase());
    	
    	//찾는 게시판이 없을경우
    	if(boardconfig == null){
    		 return new ModelAndView("/scripts/alert");
    	}
    	
    	//게시판리스트를 불려오기전에 해시맵을 통하여 여러개의 정보추출
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	map.put("boardconfig", boardconfig); //게시판설정 삽입

    	
    	//게시판 불려오기
        List<BoardVO> list = boardMapper.boardList(map);
        
        //모델겍체 생성
        ModelAndView modelandview = new ModelAndView("boardList");
        modelandview.addObject("list",list);
        modelandview.addObject("boardconfig",boardconfig);
        
        //뷰파일 불려오기
        return modelandview;
    }
    
    //게시글 작성 페이지(GET)    
    @RequestMapping(value="/post",method=RequestMethod.GET)
    public ModelAndView writeForm(@PathVariable("board_table") String board_table) throws Exception{
    	
    	//게시판 기본정보 얻기
    	BoardConfigVO boardconfig = boardConfigMapper.boardConfigView(board_table.toLowerCase());
    	//찾는 게시판이 없을경우
    	if(boardconfig == null){
    		 return new ModelAndView("/scripts/alert");
    	}
    	
    	//모델겍체 생성
    	ModelAndView modelandview = new ModelAndView("boardWrite");
    	modelandview.addObject("boardconfig",boardconfig);
        
    	//뷰파일 불려오기
        return modelandview;
    }
    
    //게시글 작성(POST)
    @RequestMapping(value="/post",method=RequestMethod.POST)
    public String write(@ModelAttribute("BoardVO") BoardVO board,@PathVariable("board_table") String board_table) throws Exception{
    	//게시판 기본정보 얻기
    	BoardConfigVO boardconfig = boardConfigMapper.boardConfigView(board_table.toLowerCase());
    	//찾는 게시판이 없을경우
    	if(boardconfig == null){
    		 return "잘못된 경로입니다.";
    	}
    	
    	//저장하기전에 여러파라미터를 해시맵을 통하여 전송
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	map.put("boardconfig", boardconfig); //게시판설정 삽입
    	map.put("board", board); //게시판 입력값
       
    	//데이터 저장
    	boardMapper.boardInsert(map);
        
        return "redirect:/board/"+board_table;
    }
    
    //게시글 상세
    @RequestMapping(value="/{bno}",method=RequestMethod.GET)
    public ModelAndView view(@PathVariable("bno") int bno,@PathVariable("board_table") String board_table) throws Exception{
    	
    	//게시판 기본정보 얻기
    	BoardConfigVO boardconfig = boardConfigMapper.boardConfigView(board_table.toLowerCase());
    	//찾는 게시판이 없을경우
    	if(boardconfig == null){
    		return new ModelAndView("/scripts/alert");
    	}
    	
    	//조회하기전에 여러파라미터를 해시맵을 통하여 전송
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	map.put("boardconfig", boardconfig); //게시판설정 삽입
    	map.put("bno", bno); //게시판조회번호 삽입
    	
        BoardVO board = boardMapper.boardView(map);
        
        boardMapper.hitPlus(map);
        
        //모델겍체 생성
    	ModelAndView modelandview = new ModelAndView("boardView");
    	modelandview.addObject("boardconfig",boardconfig);
    	modelandview.addObject("board",board);
        
        return modelandview;
    }
    
  //게시글 수정 페이지(GET)
    @RequestMapping(value="/post/{bno}", method=RequestMethod.GET)
    public ModelAndView updateForm(@PathVariable("bno") int bno,@PathVariable("board_table") String board_table) throws Exception{
    	
    	//게시판 기본정보 얻기
    	BoardConfigVO boardconfig = boardConfigMapper.boardConfigView(board_table.toLowerCase());
    	//찾는 게시판이 없을경우
    	if(boardconfig == null){
    		return new ModelAndView("/scripts/alert");
    	}
    	
    	//조회전에 여러파라미터를 해시맵을 통하여 전송
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	map.put("boardconfig", boardconfig); //게시판설정 삽입
    	map.put("bno", bno); //게시판조회번호 삽입
            
        BoardVO board = boardMapper.boardView(map);
        
        //모델겍체 생성
    	ModelAndView modelandview = new ModelAndView("boardUpdate");
    	modelandview.addObject("boardconfig",boardconfig);
    	modelandview.addObject("board",board);
        
        return modelandview;
    }
        
    //게시글 수정(PATCH)
    @RequestMapping(value="/post/{bno}", method=RequestMethod.PATCH)
    public String update(@ModelAttribute("BoardVO")BoardVO board,@PathVariable("bno") int bno,@PathVariable("board_table") String board_table) throws Exception{
            
    	//게시판 기본정보 얻기
    	BoardConfigVO boardconfig = boardConfigMapper.boardConfigView(board_table.toLowerCase());
    	//찾는 게시판이 없을경우
    	if(boardconfig == null){
    		return "잘못된 경로입니다.";
    	}
    	
    	//저장하기전에 여러파라미터를 해시맵을 통하여 전송
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	map.put("boardconfig", boardconfig); //게시판설정 삽입
    	map.put("board", board); //게시판내용 삽입
    	map.put("bno", bno); //수정할 번호 삽입
    	
    	//게시판 내용 업데이트
    	boardMapper.boardUpdate(map);
        
            
        return "redirect:/board/"+board_table+"/"+bno;
    }
    
    //게시글 삭제(DELETE)
    @RequestMapping(value="/post/{bno}", method=RequestMethod.DELETE)
    public String delete(@PathVariable("bno") int bno,@PathVariable("board_table") String board_table) throws Exception{
    	
    	//게시판 기본정보 얻기
    	BoardConfigVO boardconfig = boardConfigMapper.boardConfigView(board_table.toLowerCase());
    	//찾는 게시판이 없을경우
    	if(boardconfig == null){
    		return "잘못된 경로입니다.";
    	}
    	
    	//지우기전에 여러파라미터를 해시맵을 통하여 전송
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	map.put("boardconfig", boardconfig); //게시판설정 삽입
    	map.put("bno", bno); //삭제할 번호 삽입
    	
        boardMapper.boardDelete(map);
            
        return "redirect:/board/"+board_table;
    }
}