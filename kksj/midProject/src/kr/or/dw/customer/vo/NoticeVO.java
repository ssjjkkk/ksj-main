package kr.or.dw.customer.vo;

import java.sql.Date;

public class NoticeVO {
	
	private int n_no;
	private String n_title;
	private String nick;
	private String n_content;
	private Date n_wdt;
	private String gb_del;
	private String img_url;
	
	public final int getN_no() {
		return n_no;
	}
	public final void setN_no(int n_no) {
		this.n_no = n_no;
	}
	public final String getN_title() {
		return n_title;
	}
	public final void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public final String getNick() {
		return nick;
	}
	public final void setNick(String nick) {
		this.nick = nick;
	}
	public final String getN_content() {
		return n_content;
	}
	public final void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public final Date getN_wdt() {
		return n_wdt;
	}
	public final void setN_dwt(Date n_wdt) {
		this.n_wdt = n_wdt;
	}
	public final String getGb_del() {
		return gb_del;
	}
	public final void setGb_del(String gb_del) {
		this.gb_del = gb_del;
	}
	public final String getImg_url() {
		return img_url;
	}
	public final void setImg_url(String img_url) {
		this.img_url = img_url;
	}
	
	
}
