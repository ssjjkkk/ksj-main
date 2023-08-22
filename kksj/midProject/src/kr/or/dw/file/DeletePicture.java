package kr.or.dw.file;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import kr.or.dw.member.service.IMemberService;
import kr.or.dw.member.service.MemberServiceImpl;
import kr.or.dw.member.vo.MemberVO;
import kr.or.dw.web.IAction;

public class DeletePicture implements IAction {

	@Override
	public boolean isRedirect() {
		return true;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		int user_no = Integer.parseInt(req.getParameter("user_no")); 
	    
	    IMemberService service = MemberServiceImpl.getInstance();
	    service.deleteMemberPicPath(user_no);
		
		
		return req.getContextPath() + "/member/myinfo.do";
	}

}
