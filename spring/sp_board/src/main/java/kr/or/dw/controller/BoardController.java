package kr.or.dw.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.CORBA.BAD_INV_ORDER;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.service.BoardService;
import kr.or.dw.service.MemberService;
import kr.or.dw.vo.BoardVO;

@Controller
@RequestMapping("/board")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/main")
	public String main() {
		String url = "board/main.open";
		
		return url;
	};
	
	@RequestMapping("/list")
	public ModelAndView list(ModelAndView mnv, SearchCriteria cri) throws SQLException{
		String url = "board/list.open";
		
		Map<String, Object> dataMap = boardService.selectSearchBoardList(cri);
		
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		
		return mnv;
	};
	
	@RequestMapping("/registForm")
	public String registForm() {
		String url = "board/regist.open";
		
		return url;
	}
	
	@RequestMapping("/regist")
	public void regist(BoardVO board, HttpServletRequest req, HttpServletResponse res) throws SQLException, IOException {
		board.setTitle((String)req.getAttribute("XSStitle"));
		
		boardService.write(board);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("window.opener.location.reload(true); window.close();");
		out.println("</script>");
	}
	
	
	@RequestMapping("/detail")
	public ModelAndView detail(int bno, ModelAndView mnv) throws SQLException {
		String url = "board/detail.open";
		
		BoardVO board = null;
		
		board = boardService.selectBoard(bno);
		
		mnv.addObject("board", board);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(int bno, ModelAndView mnv) throws SQLException {
		String url = "board/modify.open";
		
		BoardVO board = null;
		
		board = boardService.selectBoard(bno);
		
		mnv.addObject("board", board);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/modify")
	public void modify(BoardVO board, HttpServletRequest req, HttpServletResponse res) throws SQLException, IOException {
		board.setTitle((String)req.getAttribute("XSStitle"));
		boardService.modify(board);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("window.opener.location.reload();");
		out.println("location.href='detail.do?bno=" + board.getBno() + "';");
		out.println("</script>");
	}
	
	@RequestMapping("/remove")
	public void remove(int bno, HttpServletRequest req, HttpServletResponse res) throws SQLException, IOException {		
		boardService.remove(bno);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('삭제되었습니다.');");
		out.println("window.opener.location.reload(true); window.close();");
		out.println("</script>");
	}
	
	
}
