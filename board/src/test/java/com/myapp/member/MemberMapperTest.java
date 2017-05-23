package com.myapp.member;

import static org.hamcrest.CoreMatchers.hasItem;
import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

import java.util.Iterator;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.myapp.MyappApplication;
import com.myapp.member.domain.MemberVO;
import com.myapp.member.mapper.MemberMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = MyappApplication.class)
@WebAppConfiguration

@MapperScan(value = {"com.myapp.member.mapper"})
public class MemberMapperTest {
	@Autowired MemberMapper memberMapper;
    
    @Test
    public void readUserTest() {
    	 MemberVO member = memberMapper.readUser("cusonar");
         assertThat("cusonar", is(member.getUsername()));
         assertThat("YCU", is(member.getName()));
         assertThat("1234", is(member.getPassword()));
    }
     
    public void readAuthorityTest() {
    	 List<GrantedAuthority> authorities = memberMapper.readAuthority("cusonar");
    	 Iterator<GrantedAuthority> it = authorities.iterator();
    	 while (it.hasNext()) {
	    	 GrantedAuthority authority = it.next();
	    	 assertThat(authorities, hasItem(new SimpleGrantedAuthority(authority.getAuthority())));
    	 }
    }
}
