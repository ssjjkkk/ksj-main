package kr.or.dw.customer.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.dw.customer.service.CustomerServiceImpl;
import kr.or.dw.customer.service.ICustomerService;
import kr.or.dw.customer.vo.FaqVO;
import kr.or.dw.web.IAction;

public class FaqAction implements IAction{

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		ICustomerService service = CustomerServiceImpl.getInstance();
		
		List<FaqVO> faqList = service.selectFaqList();
		
		req.setAttribute("faqList", faqList);
		
		return "/customer/faq.jsp";
	}

}
