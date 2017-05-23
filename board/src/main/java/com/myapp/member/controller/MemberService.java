package com.myapp.member.controller;
 
import java.util.Collection;
 
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.myapp.member.domain.MemberVO;
 
public interface MemberService extends UserDetailsService {
     Collection<GrantedAuthority> getAuthorities(String username);
     public MemberVO readUser(String username);
     public void createUser(MemberVO user);
     public void deleteUser(String username);
     public PasswordEncoder passwordEncoder();
}