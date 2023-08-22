package kr.or.dw.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.dw.admin.service.AdminServiceImpl;
import kr.or.dw.admin.service.IAdminService;
import kr.or.dw.customer.vo.NoticeVO;
import kr.or.dw.member.vo.MemberVO;
import kr.or.dw.web.IAction;

public class ContentInsertAction implements IAction {

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		IAdminService service = AdminServiceImpl.getInstance();
		List<MemberVO> memList = service.selectMember();
		int memCount = service.memCount();
		int adminCount = service.adminCount();
		int user_no = (int)session.getAttribute("user_no");
		MemberVO memberVo = service.memberSel(user_no);
		int boardCount = service.boardCount();
	      req.setAttribute("boardCount", boardCount);
		req.setAttribute("memList", memList);
	    req.setAttribute("memCount", memCount);
	    req.setAttribute("adminCount", adminCount);
	    req.setAttribute("memberVo", memberVo);
	    
	    String subject = req.getParameter("n_title");
	    String content = req.getParameter("n_content");
	    NoticeVO noticeVo = new NoticeVO();
	    noticeVo.setN_title(subject);
	    noticeVo.setN_content(content);
	    noticeVo.setNick(memberVo.getNick());
	    
	    int n_no = 0;
	    if(req.getParameter("n_no") != null) {
	    	n_no = Integer.parseInt(req.getParameter("n_no"));
	    	noticeVo.setN_no(n_no);
	    	int result = service.updateNotice(noticeVo);
	    }else {
	    	n_no = service.insertContent(noticeVo);
	    }
	    
		return req.getContextPath() + "/admin/adminnotice.do";
	}

}
