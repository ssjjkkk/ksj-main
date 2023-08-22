package kr.or.dw.admin.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.dw.admin.service.AdminServiceImpl;
import kr.or.dw.admin.service.IAdminService;
import kr.or.dw.web.IAction;

public class FaqDeleteAction implements IAction {

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		IAdminService service = AdminServiceImpl.getInstance();
		service.deleteFaq(Integer.parseInt(req.getParameter("f_no")));
		int boardCount = service.boardCount();
	      req.setAttribute("boardCount", boardCount);
		
		
		return req.getContextPath() + "/admin/adminFaq.do";
	}

}
