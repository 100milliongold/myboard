package com.myapp.member.controller;

import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myapp.member.domain.MemberVO;
import com.myapp.member.mapper.MemberMapper;

@Controller
@RequestMapping("/member")
@MapperScan(value = {"com.myapp.member.mapper"})
public class MemberController {
	
	@Autowired
	private MemberMapper memberMapper;
	
	//회원가입(GET) 
    @RequestMapping(value="/join",method=RequestMethod.GET)
    public ModelAndView memberJoinForm() throws Exception{
    	
    	
    	//모델겍체 생성
    	ModelAndView modelandview = new ModelAndView("/member/MemberJoin");
    	
    	
    	//뷰파일 불려오기
        return modelandview;
    }
    
    //회원가입(POST)
    @RequestMapping(value="/join",method=RequestMethod.POST)
    public String memberJoin(@ModelAttribute("MemberVO") MemberVO inputmember) throws Exception{
    	
    	MemberVO member = new MemberVO();
    	member.setUsername(inputmember.getUsername());
    	member.setName(inputmember.getName());
    	member.setPassword(inputmember.getPassword());
    	
    	//저장하기전에 여러파라미터를 해시맵을 통하여 전송
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	map.put("member", member); //게시판 입력값
    	
    	memberMapper.memberInsert(map);
    	return "redirect:/";
    }
}
