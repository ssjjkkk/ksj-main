package kr.or.dw.customer.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.dw.customer.service.CustomerServiceImpl;
import kr.or.dw.customer.service.ICustomerService;
import kr.or.dw.customer.vo.NoticeVO;
import kr.or.dw.web.IAction;

public class NoticeViewAction implements IAction{

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int n_no = 0;
		n_no = Integer.parseInt(req.getParameter("n_no"));
		ICustomerService service = CustomerServiceImpl.getInstance();
		NoticeVO noticeVo = null;
		noticeVo = service.selectNoticeView(n_no);
		
		
		req.setAttribute("noticeVo", noticeVo);
		
		return "/customer/notice.jsp";
	}

}
