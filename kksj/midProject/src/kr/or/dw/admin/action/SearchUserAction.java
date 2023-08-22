package kr.or.dw.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.dw.admin.service.AdminServiceImpl;
import kr.or.dw.admin.service.IAdminService;
import kr.or.dw.customer.vo.FaqVO;
import kr.or.dw.member.vo.MemberVO;
import kr.or.dw.web.IAction;

public class SearchUserAction implements IAction{

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
		String search = "";
		if (req.getParameter("searchUser") != null) {
			search = req.getParameter("searchUser");
		}
	      
		List<MemberVO> SmemList = service.selectSMember(search);
		int memCount = service.memCount();
		int adminCount = service.adminCount();
		int user_no = (int)session.getAttribute("user_no");
		MemberVO memberVo = service.memberSel(user_no);
		
		List<FaqVO> faqList = service.selectFaqList();
		
		req.setAttribute("faqList", faqList);
		req.setAttribute("memList", SmemList);
		req.setAttribute("memCount", memCount);
		req.setAttribute("adminCount", adminCount);
		req.setAttribute("memberVo", memberVo);
		
		return "/admin/index.jsp";
	}

}
