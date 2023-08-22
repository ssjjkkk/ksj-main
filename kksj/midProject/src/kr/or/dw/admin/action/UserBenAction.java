package kr.or.dw.admin.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.dw.admin.service.AdminServiceImpl;
import kr.or.dw.admin.service.IAdminService;
import kr.or.dw.web.IAction;

public class UserBenAction implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		IAdminService service = AdminServiceImpl.getInstance();
		
		int user_no = Integer.parseInt(req.getParameter("user_no"));
		String gb_ben = req.getParameter("gb_ben");
		System.out.println(gb_ben);
		
		int result = 0;
		if(gb_ben.equals("Y")) {
			service.userUnBen(user_no);
		}else {
			service.userBen(user_no);
			result = 1;
		}
		
		req.setAttribute("result", result);
		return "/admin/userBenResult.jsp";
	}

}
