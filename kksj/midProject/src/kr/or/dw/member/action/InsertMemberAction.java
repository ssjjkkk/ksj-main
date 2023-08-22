package kr.or.dw.member.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.dw.member.service.IMemberService;
import kr.or.dw.member.service.MemberServiceImpl;
import kr.or.dw.member.vo.MemberVO;
import kr.or.dw.util.CryptoUtil;
import kr.or.dw.web.IAction;

public class InsertMemberAction implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		IMemberService service = MemberServiceImpl.getInstance();

		MemberVO memberVo = new MemberVO();
		String userId = req.getParameter("userid");
		String nick = req.getParameter("nick");
				
		// 비밀번호 암호화
		String user_pass = req.getParameter("password");
		try {
			user_pass = CryptoUtil.sha512(user_pass);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		memberVo.setId(userId);
		memberVo.setNick(nick);
		memberVo.setPass(user_pass);
		
		int user_no = service.insertMember(memberVo);
//		req.setAttribute("user_no", user_no);
				
		return req.getContextPath() + "/main.do";
	}

}
