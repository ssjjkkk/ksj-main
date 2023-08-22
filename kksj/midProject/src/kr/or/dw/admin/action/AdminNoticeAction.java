package kr.or.dw.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.dw.admin.service.AdminServiceImpl;
import kr.or.dw.admin.service.IAdminService;
import kr.or.dw.admin.vo.AdminVO;
import kr.or.dw.customer.vo.NoticeVO;
import kr.or.dw.member.vo.MemberVO;
import kr.or.dw.web.IAction;

public class AdminNoticeAction implements IAction{

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		IAdminService service = AdminServiceImpl.getInstance();
		int boardCount = service.boardCount();
	      req.setAttribute("boardCount", boardCount);
		NoticeVO noticeVo = new NoticeVO();
		List<MemberVO> memList = service.selectMember();
		int memCount = service.memCount();
		int adminCount = service.adminCount();
		int user_no = (int)session.getAttribute("user_no");
		MemberVO memberVo = service.memberSel(user_no);
		
		List<NoticeVO> noticeList = service.selectNoticeList(); 
		
		req.setAttribute("noticeList", noticeList);
		req.setAttribute("memList", memList);
		req.setAttribute("memCount", memCount);
		req.setAttribute("adminCount", adminCount);
		req.setAttribute("memberVo", memberVo);
		req.setAttribute("noticeVo", noticeVo);
		
		return "/admin/adminnotice.jsp";
	}

}
