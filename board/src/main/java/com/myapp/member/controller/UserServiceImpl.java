package com.myapp.member.controller;

import java.util.Collection;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.myapp.member.domain.MemberVO;
import com.myapp.member.mapper.MemberMapper;
 

 
@Service
@MapperScan(value = {"com.myapp.member.mapper"})
public class UserServiceImpl implements UserService {
     
     @Autowired MemberMapper memberMapper;
     private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
     
     @Override
     public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
    	  MemberVO member = memberMapper.readUser(username);
    	  member.setAuthorities(getAuthorities(username));
          
          return member;
     }
     
     public Collection<GrantedAuthority> getAuthorities(String username) {
    	  Collection<GrantedAuthority> authorities = memberMapper.readAuthority(username);
          return authorities;
     }

	@Override
	public MemberVO readUser(String username) {
		// TODO Auto-generated method stub
		MemberVO member = memberMapper.readUser(username);
		member.setAuthorities(memberMapper.readAuthority(username));
		return member;
	}

	@Override
	public void createUser(MemberVO user) {
		// TODO Auto-generated method stub
		String rawPassword = user.getPassword();
		String encodedPassword = new BCryptPasswordEncoder().encode(rawPassword);
        user.setPassword(encodedPassword);
        memberMapper.createUser(user);
        memberMapper.createAuthority(user);
	}

	@Override
	public void deleteUser(String username) {
		// TODO Auto-generated method stub
		memberMapper.deleteUser(username);
		memberMapper.deleteAuthority(username);
	}

	@Override
	public PasswordEncoder passwordEncoder() {
		// TODO Auto-generated method stub
		return this.passwordEncoder;
	}
}