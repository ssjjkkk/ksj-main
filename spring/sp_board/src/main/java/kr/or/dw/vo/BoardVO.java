package kr.or.dw.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	
	private int bno;
	private String title;
	private String writer;
	private String content;
	private Date regdate;
	private int viewcnt;
	private Date updatedate;
	private int replycnt;
	
	public BoardVO() {}

	public BoardVO(int bno, String title, String writer, String content, Date regdate, int viewcnt, Date updatedate, int replycnt) {
		super();
		this.bno = bno;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.regdate = regdate;
		this.viewcnt = viewcnt;
		this.updatedate = updatedate;
		this.replycnt = replycnt;
	};
	
	
}
