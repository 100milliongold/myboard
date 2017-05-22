package com.myapp.member.mapper;

import java.util.HashMap;

import com.myapp.member.domain.MemberVO;

public interface MemberMapper {
	
	//회원가입
    public void memberInsert(HashMap<String, Object> map)throws Exception;
}
