package kr.or.dw.user.vo;

import java.util.Date;

public class UserVO {
	
	private int user_no;
	private String id;
	private String pass;
	private String nick;
	private String profile;
	private String auth_cd;
	private String gb_del;
	
	
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getAuth_cd() {
		return auth_cd;
	}
	public void setAuth_cd(String auth_cd) {
		this.auth_cd = auth_cd;
	}
	public String getGb_del() {
		return gb_del;
	}
	public void setGb_del(String gb_del) {
		this.gb_del = gb_del;
	}
	
	
	
	
	
	
}
