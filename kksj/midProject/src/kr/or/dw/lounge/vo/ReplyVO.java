package kr.or.dw.lounge.vo;

import java.util.Date;

public class ReplyVO {
	private int re_no;
	private int bd_no;
	private int user_no;
	private String nick;
	private String re_content;
	private Date re_wdt;
	private String gb_del;
	public int getRe_no() {
		return re_no;
	}
	public void setRe_no(int re_no) {
		this.re_no = re_no;
	}
	public int getBd_no() {
		return bd_no;
	}
	public void setBd_no(int bd_no) {
		this.bd_no = bd_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public Date getRe_wdt() {
		return re_wdt;
	}
	public void setRe_wdt(Date re_wdt) {
		this.re_wdt = re_wdt;
	}
	public String getGb_del() {
		return gb_del;
	}
	public void setGb_del(String gb_del) {
		this.gb_del = gb_del;
	}
	
	
}
