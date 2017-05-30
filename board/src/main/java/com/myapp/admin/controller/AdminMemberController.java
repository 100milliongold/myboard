package com.myapp.admin.controller;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myapp.board.domain.BoardConfigVO;
import com.myapp.member.domain.MemberVO;
import com.myapp.member.service.MemberService;

@Controller
@RequestMapping("/admin")
public class AdminMemberController {
	
	@Autowired MemberService memberService;
	
	//회원정보 기본
    @RequestMapping(value="/member",method=RequestMethod.GET)
    public ModelAndView memberList() throws Exception{
    	
    	
    	//회원정보 로드
    	List<MemberVO> list = memberService.memberList();
		
    	
    	//모델겍체 생성
        ModelAndView modelandview = new ModelAndView("/admin/member/memberList");
        modelandview.addObject("list",list);
    	
    	return modelandview;
    }
    
    //회원정보 입력
    @RequestMapping(value="/member_new",method=RequestMethod.GET)
    public ModelAndView writeForm() throws Exception{
    	
    	
    	//모델겍체 생성
        ModelAndView modelandview = new ModelAndView("/admin/member/memberNew");
    	
    	return modelandview;
    }
    
    //회원정보 입력
    @RequestMapping(value="/member",method=RequestMethod.POST)
    public String write(@ModelAttribute("MemberVO") MemberVO member) throws Exception{
    	
    	member.setIs_account_non_expired("1");
    	member.setIs_account_non_locked("1");
    	member.setId_credentials_non_expired("1");
    	member.setId_enabled("1");
    	member.setAuthorities(AuthorityUtils.createAuthorityList("USER"));
    	
    	memberService.createUser(member);

        //리스트로 이동
        return "redirect:/admin/member";
    }
    
    //회원정보 보기
    @RequestMapping(value="/member/{username}",method=RequestMethod.GET)
    public ModelAndView memberView(@PathVariable("username") String username) throws Exception{
    	
    	MemberVO member = memberService.readUser(username);
    	if(member == null){
    		return new ModelAndView("/403");
    	}
    	
    	//모델겍체 생성
        ModelAndView modelandview = new ModelAndView("/admin/member/memberInfo");
        modelandview.addObject("member",member);
    	
    	return modelandview;
    }
    
    //회원정보 수정
    @RequestMapping(value="/member/{username}",method=RequestMethod.PATCH)
    public String memberModify(@PathVariable("username") String username,@ModelAttribute("MemberVO") MemberVO member) throws Exception{
    	
    	memberService.memberUpdate(username,member);
    	
    	//뷰페이지로 이동
        return "redirect:/admin/member/"+username;
    }
    
    //회원삭제
    @RequestMapping(value="/member/{username}",method=RequestMethod.DELETE)
    public ResponseEntity<MemberVO> memberDelete(@PathVariable("username") String username) throws Exception{
    	
    	//회원 삭제
    	try {
    		memberService.deleteUser(username);
		} catch (Exception e) {
			// TODO: handle exception
			return new ResponseEntity<MemberVO>(HttpStatus.CONFLICT);
		}
    	
    	return new ResponseEntity<MemberVO>(HttpStatus.NO_CONTENT);
    }

}
