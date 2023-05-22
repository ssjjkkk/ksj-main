package kr.or.dw.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.dw.member.service.IMemberService;
import kr.or.dw.member.service.MemberServiceImpl;
import kr.or.dw.vo.MemberVO;
import kr.or.dw.web.IAction;

public class MemberUpdateAction implements IAction{

	@Override
	public boolean isRedirect() {
		return true;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		IMemberService service = MemberServiceImpl.getInstance();
		
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String tel = req.getParameter("tel");
		String addr = req.getParameter("addr");
		
		MemberVO memVO = new MemberVO();
		memVO.setMem_id(id);
		memVO.setMem_name(name);
		memVO.setMem_tel(tel);
		memVO.setMem_addr(addr);
		
		int result = service.updateMember(memVO);
		
		return "/member/memberList.do";
	}

}
