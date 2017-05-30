package com.myapp.member.domain;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class MemberVO implements UserDetails{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -4855890427225819382L;
	
	private String username;
	private String password;
	private String name;
	// 1 : 성공  / 0 : 실패
	private String is_account_non_expired;
	private String is_account_non_locked;
	private String is_credentials_non_expired;
	private String is_enabled;
	
	private Collection<? extends GrantedAuthority> authorities;

	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getIs_account_non_expired() {
		return is_account_non_expired;
	}
	public void setIs_account_non_expired(String is_account_non_expired) {
		this.is_account_non_expired = is_account_non_expired;
	}
	public String getIs_account_non_locked() {
		return is_account_non_locked;
	}
	public void setIs_account_non_locked(String is_account_non_locked) {
		this.is_account_non_locked = is_account_non_locked;
	}
	public String getId_credentials_non_expired() {
		return is_credentials_non_expired;
	}
	public void setId_credentials_non_expired(String id_credentials_non_expired) {
		this.is_credentials_non_expired = id_credentials_non_expired;
	}
	public String getId_enabled() {
		return is_enabled;
	}
	public void setId_enabled(String id_enabled) {
		this.is_enabled = id_enabled;
	}
	
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		return this.authorities;
	}
	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return ("1".equals(this.is_account_non_expired))?true:false;
//		return (is_account_non_expired=="1")?true:false;
//		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return ("1".equals(this.is_account_non_locked))?true:false;
//		return (is_account_non_locked=="1")?true:false;
//		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return ("1".equals(this.is_credentials_non_expired))?true:false;
//		return (id_credentials_non_expired=="1")?true:false;
//		return true;
	}
	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return ("1".equals(this.is_enabled))?true:false;
//		return (id_enabled=="1")?true:false;
//		return true;
	}
	
	public void setAuthorities(Collection<? extends GrantedAuthority> authorities) {
		this.authorities = authorities;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return 
		 "username: "+this.username
		+"\n password: "+this.password
		+"\n name: "+this.name
		+"\n var is_account_non_expired : "+this.is_account_non_expired
		+"\n var is_account_non_locked: "+this.is_account_non_locked
		+"\n var is_credentials_non_expired: "+this.is_credentials_non_expired
		+"\n var is_enabled: "+this.is_enabled;
	}
}
