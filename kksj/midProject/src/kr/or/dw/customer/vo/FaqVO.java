package kr.or.dw.customer.vo;

import java.sql.Date;

public class FaqVO {
	
	private int f_no;
	private String f_title;
	private String nick;
	private String f_content;
	private Date f_wdt;
	private String gb_del;
	private String img_url;
	
	public int getF_no() {
		return f_no;
	}
	public void setF_no(int f_no) {
		this.f_no = f_no;
	}
	public String getF_title() {
		return f_title;
	}
	public void setF_title(String f_title) {
		this.f_title = f_title;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getF_content() {
		return f_content;
	}
	public void setF_content(String f_content) {
		this.f_content = f_content;
	}
	public Date getF_wdt() {
		return f_wdt;
	}
	public void setF_wdt(Date f_wdt) {
		this.f_wdt = f_wdt;
	}
	public String getGb_del() {
		return gb_del;
	}
	public void setGb_del(String gb_del) {
		this.gb_del = gb_del;
	}
	public String getImg_url() {
		return img_url;
	}
	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}
	
	
}
