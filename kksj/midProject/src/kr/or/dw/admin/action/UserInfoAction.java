package kr.or.dw.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.dw.lounge.service.ILoungeService;
import kr.or.dw.lounge.service.LoungeServiceImpl;
import kr.or.dw.member.service.IMemberService;
import kr.or.dw.member.service.MemberServiceImpl;
import kr.or.dw.member.vo.MemberVO;
import kr.or.dw.ranking.vo.GameVO;
import kr.or.dw.web.IAction;

public class UserInfoAction implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		int user_no = Integer.parseInt(req.getParameter("user_no"));
		IMemberService service = MemberServiceImpl.getInstance();
		MemberVO memberVo = (MemberVO)service.userInfoGet(user_no);
		
		int memberBC = service.memberBoardCount(user_no);
	    req.setAttribute("memberBoardCount", memberBC);
	    int memberRC = service.memberReplyCount(user_no);
	    req.setAttribute("memberReplyCount", memberRC);
	      
	    req.setAttribute("memberVo", memberVo);
	    
	    int memberBoardCount = service.memberBoardCount(user_no);
	    req.setAttribute("memberBoardCount", memberBoardCount);
	    int memberReplyCount = service.memberReplyCount(user_no);
	    req.setAttribute("memberReplyCount", memberReplyCount);
		
		req.setAttribute("memberVo", memberVo);
		
		 ILoungeService Lservice = LoungeServiceImpl.getInstance();
	       List<GameVO> memGameList = (List<GameVO>) Lservice.memGameList(user_no);  
	       
	       req.setAttribute("memGameList", memGameList);
		
		
		
		return "/member/profile.jsp";
	}

}
