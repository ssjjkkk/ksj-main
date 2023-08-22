package kr.or.dw.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.dw.member.service.IMemberService;
import kr.or.dw.member.service.MemberServiceImpl;
import kr.or.dw.web.IAction;

public class NickCheckAction implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("application/json; charset=utf-8");
		
		String nick = req.getParameter("nick");
		
		IMemberService service = MemberServiceImpl.getInstance();
		
		nick = service.userNick(nick);
		
//		req.setAttribute("userid", userid);
		
		System.out.println(nick);
		
		Gson gson = new Gson();
		String result = null;
		
		if(nick == null) {	// 중복되지 않는 경우
			result = gson.toJson("success");
		}else {	// 중복되는 경우
			result = gson.toJson("중복된 닉네임 입니다. 다시 입력해주세요.");
		};
		
		PrintWriter out = res.getWriter();
		out.println(result);
		out.flush();
		
		return null;

	}

}
