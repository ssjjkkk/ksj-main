package kr.or.dw.member.vo;

import java.util.Date;

public class GBookVO {
   
   private   int b_no;
   private String b_title;
   private String nick;
   private String b_content;
   private Date b_wdt;
   private String gb_del;
   
   public int getB_no() {
      return b_no;
   }
   public void setB_no(int b_no) {
      this.b_no = b_no;
   }
   public String getB_title() {
      return b_title;
   }
   public void setB_title(String b_title) {
      this.b_title = b_title;
   }
   public String getNick() {
      return nick;
   }
   public void setNick(String nick) {
      this.nick = nick;
   }
   public String getB_content() {
      return b_content;
   }
   public void setB_content(String b_content) {
      this.b_content = b_content;
   }
   public Date getB_wdt() {
      return b_wdt;
   }
   public void setB_wdt(Date b_wdt) {
      this.b_wdt = b_wdt;
   }
   public String getGb_del() {
      return gb_del;
   }
   public void setGb_del(String gb_del) {
      this.gb_del = gb_del;
   }
}