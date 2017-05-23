package com.myapp.member.domain;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class MemberVO implements UserDetails{
	
	private String username;
	private String password;
	private String name;
	private String is_account_non_expired;
	private String is_account_non_locked;
	private String id_credentials_non_expired;
	private String id_enabled;
	
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
		return id_credentials_non_expired;
	}
	public void setId_credentials_non_expired(String id_credentials_non_expired) {
		this.id_credentials_non_expired = id_credentials_non_expired;
	}
	public String getId_enabled() {
		return id_enabled;
	}
	public void setId_enabled(String id_enabled) {
		this.id_enabled = id_enabled;
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		return authorities;
	}
	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		//return (is_account_non_expired=="1")?true:false;
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
//		return (is_account_non_locked=="1")?true:false;
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
//		return (id_credentials_non_expired=="1")?true:false;
		return true;
	}
	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
//		return (id_enabled=="1")?true:false;
		return true;
	}
	
	public void setAuthorities(Collection<? extends GrantedAuthority> authorities) {
		this.authorities = authorities;
	}
	
}
