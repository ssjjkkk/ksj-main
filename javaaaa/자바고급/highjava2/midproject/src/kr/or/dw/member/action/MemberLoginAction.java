package kr.or.dw.member.action;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.dw.member.service.IMemberService;
import kr.or.dw.member.service.MemberServiceImpl;
import kr.or.dw.member.vo.MemberVO;
import kr.or.dw.util.CryptoUtil;
import kr.or.dw.web.IAction;

public class MemberLoginAction implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		IMemberService service = MemberServiceImpl.getInstance();
		
		String id = req.getParameter("id");
		String pass = req.getParameter("pass");
		
		MemberVO memberVo = service.loginMember(id);
		
		String cpass = "";
		try {
			cpass = CryptoUtil.sha512(pass);
			System.out.println(pass);
			
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int result = 0;
		System.out.println(cpass);
		if(memberVo != null && (cpass.equals(memberVo.getPass()))) {
			result = 1;
			HttpSession session = req.getSession();
			session.setAttribute("user_no", memberVo.getUser_no());
		};
		req.setAttribute("result", result);
		
		
		return "/member/memberLoginResult.jsp";
	}

}
