package com.myapp.member.domain;

public class MemberVO {
	
	private String username;
	private String password;
	private String name;
	private String is_account_non_expired;
	private String is_account_non_locked;
	private String id_credentials_non_expired;
	private String id_enabled;
	
	
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
}
