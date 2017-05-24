package com.myapp.member.service;
 
import java.util.Collection;
 
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.myapp.member.domain.MemberVO;
 
public interface MemberService extends UserDetailsService {
     Collection<GrantedAuthority> getAuthorities(String membername);
     public MemberVO readUser(String membername);
     public void createUser(MemberVO member);
     public void deleteUser(String membername);
     public PasswordEncoder passwordEncoder();
}