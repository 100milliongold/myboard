package com.myapp.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.myapp.member.service.MemberService;

// 홈페이지 권한설정
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter
{
	@Autowired MemberService memberService;
	
	@Override
	public void configure(WebSecurity web) throws Exception
	{
		//리소스 폴더 보안 무시
		web.ignoring().antMatchers("/resources/**","/webjars/**");
	}
	
	@Override
    protected void configure(HttpSecurity http) throws Exception {
         http
              .csrf().disable()
              .authorizeRequests()
                   .antMatchers(HttpMethod.GET,"/member/info/**","/admin/**").authenticated()
                   .antMatchers(HttpMethod.GET,"/admin/**").hasAuthority("ADMIN")
                   .anyRequest().permitAll()
                   .and()
                   .exceptionHandling().accessDeniedPage("/403") //권한이 없을 경우
              ;
         http
              .formLogin()
              .loginProcessingUrl("/member/loginProcessing")
              .loginPage("/member/login")
              .successHandler(successHandler())
              .failureUrl("/member/login?error")
              ;
         http
			.logout()
			// /logout 을 호출할 경우 로그아웃
			.logoutRequestMatcher(new AntPathRequestMatcher("/member/logout"))
			// 로그아웃이 성공했을 경우 이동할 페이지
			.logoutSuccessUrl("/");
    }
	
	@Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
         auth.userDetailsService(memberService)
         .passwordEncoder(memberService.passwordEncoder())
         
         ;
    }
	
	@Bean
	public AuthenticationSuccessHandler successHandler() {
	    return new CustomLoginSuccessHandler("/");
	}
}