package com.myapp.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myapp.member.domain.MemberVO;
import com.myapp.member.service.MemberService;

@Controller
@RequestMapping("/member")
@MapperScan(value = {"com.myapp.member.mapper"})
public class MemberController {
	
	@Autowired private MemberService memberService;
	
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
    	
    	System.out.println("ID: "+inputmember.getUsername());
    	System.out.println("NAME: "+inputmember.getName());
    	System.out.println("PASS: "+inputmember.getPassword());
    	
    	MemberVO member = new MemberVO();
    	member.setUsername(inputmember.getUsername());
    	member.setName(inputmember.getName());
    	member.setPassword(inputmember.getPassword());
    	
    	member.setIs_account_non_expired("1");
    	member.setIs_account_non_locked("1");
    	member.setId_credentials_non_expired("1");
    	member.setId_enabled("1");
    	member.setAuthorities(AuthorityUtils.createAuthorityList("USER"));
    	
    	
    	
    	memberService.createUser(member);
    	
    	return "redirect:/";
    }
    
    //로그인
    @RequestMapping(value="/login",method=RequestMethod.GET)
    public ModelAndView memberLoginForm(HttpServletRequest request) throws Exception{
    	
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    	System.out.println(auth.toString());
    	
//    	if(auth.getAuthorities() != null){
//    		return (ModelAndView)new ModelAndView("redirect:/");
//    	}
    	
    	String referrer = request.getHeader("referer");
//    	System.out.println("Referer :"+referrer);
        request.getSession().setAttribute("prevPage", referrer);
    	
    	
    	//모델겍체 생성
    	ModelAndView modelandview = new ModelAndView("/member/MemberLogin");
    	
    	
    	//뷰파일 불려오기
        return modelandview;
    }
    

    
    //마이페이지
    @RequestMapping(value="/info/{username}",method=RequestMethod.GET)
    public ModelAndView myPage(@PathVariable("username")String username) throws Exception{
    	
    	
    	MemberVO member = memberService.readUser(username);
    	
    	//모델겍체 생성
    	ModelAndView modelandview = new ModelAndView("/member/MemberInfo");
    	modelandview.addObject("member",member);
    	
    	//뷰파일 불려오기
        return modelandview;
    }
}
