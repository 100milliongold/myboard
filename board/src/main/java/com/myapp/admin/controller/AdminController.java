package com.myapp.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myapp.board.domain.BoardConfigVO;
import com.myapp.board.service.BoardService;

//관리자 맵핑
@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
    private BoardService boardService;
	
	
	//관리자 기본
    @RequestMapping(method=RequestMethod.GET)
    public ModelAndView index() throws Exception{
    	
    	
    	//모델겍체 생성
        ModelAndView modelandview = new ModelAndView("/admin/index");
    	
        //뷰파일 불려오기
        return modelandview;
    }
    
    
    //게시판 관리 - 게시판 목록
    @RequestMapping(value="/board", method=RequestMethod.GET)
    public ModelAndView board_list() throws Exception{
    	
    	//게시판 테이블 불려오기
    	List<BoardConfigVO>list = boardService.boardConfigList();
    	
    	//모델겍체 생성
        ModelAndView modelandview = new ModelAndView("/admin/board/list");
        modelandview.addObject("list",list);
    	
        //뷰파일 불려오기
        return modelandview;
    }
    
    
}