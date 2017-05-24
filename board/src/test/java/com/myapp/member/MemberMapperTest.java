package com.myapp.member;

import static org.hamcrest.CoreMatchers.hasItem;
import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.myapp.MyappApplication;
import com.myapp.member.domain.MemberVO;
import com.myapp.member.mapper.MemberMapper;
import com.myapp.member.service.MemberService;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = MyappApplication.class)
@WebAppConfiguration

@MapperScan(value = {"com.myapp.member.mapper"})
public class MemberMapperTest {
	@Autowired MemberMapper memberMapper;
	@Autowired private MemberService userService;
	
	@Before
    public void setup() {
		 MemberVO user1;
         user1 = new MemberVO();
         user1.setUsername("cusonar");
         user1.setPassword("1234");
         user1.setName("YCU");
         user1.setIs_account_non_expired("1");
         user1.setIs_account_non_locked("1");
         user1.setId_credentials_non_expired("1");
         user1.setId_enabled("1");
         user1.setAuthorities(AuthorityUtils.createAuthorityList("USER"));
         userService.deleteUser(user1.getUsername());
         userService.createUser(user1);
    }
    
    @Test
    public void readUserTest() {
    	 MemberVO member = memberMapper.readUser("cusonar");
         assertThat("cusonar", is(member.getUsername()));
         assertThat("YCU", is(member.getName()));
    }
     
    public void readAuthorityTest() {
    	 //List<GrantedAuthority> authorities = (List<GrantedAuthority>) memberMapper.readAuthority("cusonar");
    	 
    	 MemberVO member = memberMapper.readUser("cusonar");
 		 List<String> rolelist = memberMapper.readAuthority("cusonar");
 		 List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
 		 for (String string : rolelist) {
 		 	authorities.add(new SimpleGrantedAuthority(string));
 		 }
 		 
    	 Iterator<GrantedAuthority> it = authorities.iterator();
    	 while (it.hasNext()) {
	    	 GrantedAuthority authority = it.next();
	    	 assertThat(authorities, hasItem(new SimpleGrantedAuthority(authority.getAuthority())));
    	 }
    }
}
