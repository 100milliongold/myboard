package com.myapp.member;

import static org.hamcrest.CoreMatchers.hasItem;
import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

import java.util.Collection;
import java.util.Iterator;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.myapp.MyappApplication;
import com.myapp.member.controller.UserService;
import com.myapp.member.domain.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = MyappApplication.class)
@WebAppConfiguration

public class MemberServiceTest {
	@Autowired private UserService userService;
	
	private MemberVO user1;
	
	@Before
    public void setup() {
         user1 = new MemberVO();
         user1.setUsername("user1");
         user1.setPassword("pass1");
         user1.setIs_account_non_expired("1");
         user1.setIs_account_non_locked("1");
         user1.setName("USER1");
         user1.setId_credentials_non_expired("1");
         user1.setId_enabled("1");
         user1.setAuthorities(AuthorityUtils.createAuthorityList("USER"));
    }
	
	@Test
    public void createUserTest() {
         userService.deleteUser(user1.getUsername());
         userService.createUser(user1);
         MemberVO user = userService.readUser(user1.getUsername());
         assertThat(user.getUsername(), is(user1.getUsername()));
         
         PasswordEncoder passwordEncoder = userService.passwordEncoder();
         assertThat(passwordEncoder.matches("pass1", user.getPassword()), is(true));

         Collection<? extends GrantedAuthority> authorities1 = user1.getAuthorities();
         Iterator<? extends GrantedAuthority> it = authorities1.iterator();
         Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>) user.getAuthorities();
         while (it.hasNext()) {
              GrantedAuthority authority = it.next();
              assertThat(authorities, hasItem(new SimpleGrantedAuthority(authority.getAuthority())));
         }
    }
}
