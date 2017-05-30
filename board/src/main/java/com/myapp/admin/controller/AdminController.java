package com.myapp.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

//관리자 맵핑
@Controller
@RequestMapping("/admin")
public class AdminController {
	
	//관리자 기본
    @RequestMapping(method=RequestMethod.GET)
    public ModelAndView index() throws Exception{
    	
    	
    	//모델겍체 생성
        ModelAndView modelandview = new ModelAndView("/admin/index");
    	
        //뷰파일 불려오기
        return modelandview;
    }
    

}