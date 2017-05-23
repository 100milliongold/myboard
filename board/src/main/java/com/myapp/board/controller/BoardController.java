package com.myapp.board.controller;
 
import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
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
@MapperScan(value = {"com.myapp.board.mapper"})
public class BoardController {
 
    @Autowired
    private BoardService boardService;
    
    
    //게시글 목록
    @RequestMapping(method=RequestMethod.GET)
    public ModelAndView list(@PathVariable("board_table") String board_table) throws Exception{
    	
    	//게시판 불려오기
        List<BoardVO> list = boardService.boardList(board_table);
        //게시판 속성보기
        BoardConfigVO boardconfig = boardService.boardConfigView(board_table);
        
        //모델겍체 생성
        ModelAndView modelandview = new ModelAndView("/board/boardList");
        modelandview.addObject("list",list);
        modelandview.addObject("boardconfig",boardconfig);
        
        //뷰파일 불려오기
        return modelandview;
    }
    
    //게시글 작성 페이지(GET)    
    @RequestMapping(value="/post",method=RequestMethod.GET)
    public ModelAndView writeForm(@PathVariable("board_table") String board_table) throws Exception{
    	
    	//게시판 속성보기
        BoardConfigVO boardconfig = boardService.boardConfigView(board_table);
    	
    	//모델겍체 생성
    	ModelAndView modelandview = new ModelAndView("/board/boardWrite");
    	modelandview.addObject("boardconfig",boardconfig);
        
    	//뷰파일 불려오기
        return modelandview;
    }
    
    //게시글 작성(POST)
    @RequestMapping(value="/post",method=RequestMethod.POST)
    public String write(@ModelAttribute("BoardVO") BoardVO board,@PathVariable("board_table") String board_table) throws Exception{
    	
        //게시판 저장
        boardService.boardInsert(board_table, board);
        
        return "redirect:/board/"+board_table;
    }
    
    //게시글 상세
    @RequestMapping(value="/{bno}",method=RequestMethod.GET)
    public ModelAndView view(@PathVariable("bno") int bno,@PathVariable("board_table") String board_table) throws Exception{
    	
    	BoardVO board = boardService.boardView(board_table, bno);
    	boardService.hitPlus(board_table, bno);
    	BoardConfigVO boardconfig = boardService.boardConfigView(board_table); //게시판 기본정보 얻기
        
        
        //모델겍체 생성
    	ModelAndView modelandview = new ModelAndView("/board/boardView");
    	modelandview.addObject("boardconfig",boardconfig);
    	modelandview.addObject("board",board);
        
        return modelandview;
    }
    
  //게시글 수정 페이지(GET)
    @RequestMapping(value="/post/{bno}", method=RequestMethod.GET)
    public ModelAndView updateForm(@PathVariable("bno") int bno,@PathVariable("board_table") String board_table) throws Exception{
    	
    	BoardConfigVO boardconfig = boardService.boardConfigView(board_table); //게시판 기본정보 얻기
    	BoardVO board = boardService.boardView(board_table, bno); //글보기
    	
    	
        
        //모델겍체 생성
    	ModelAndView modelandview = new ModelAndView("/board/boardUpdate");
    	modelandview.addObject("boardconfig",boardconfig);
    	modelandview.addObject("board",board);
        
        return modelandview;
    }
        
    //게시글 수정(PATCH)
    @RequestMapping(value="/post/{bno}", method=RequestMethod.PATCH)
    public String update(@ModelAttribute("BoardVO")BoardVO board,@PathVariable("bno") int bno,@PathVariable("board_table") String board_table) throws Exception{
            
    	boardService.boardUpdate(board_table, bno, board); //게시판 내용 업데이트
        
            
        return "redirect:/board/"+board_table+"/"+bno;
    }
    
    //게시글 삭제(DELETE)
    @RequestMapping(value="/post/{bno}", method=RequestMethod.DELETE)
    public String delete(@PathVariable("bno") int bno,@PathVariable("board_table") String board_table) throws Exception{
    	
    	boardService.boardDelete(board_table, bno); //게시판 삭제
            
        return "redirect:/board/"+board_table;
    }
}