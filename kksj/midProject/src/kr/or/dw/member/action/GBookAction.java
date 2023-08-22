package kr.or.dw.member.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.dw.admin.service.AdminServiceImpl;
import kr.or.dw.admin.service.IAdminService;
import kr.or.dw.lounge.service.ILoungeService;
import kr.or.dw.lounge.service.LoungeServiceImpl;
import kr.or.dw.lounge.vo.GuserVO;
import kr.or.dw.lounge.vo.LoungeVO;
import kr.or.dw.lounge.vo.ReplyVO;
import kr.or.dw.member.service.IMemberService;
import kr.or.dw.member.service.MemberServiceImpl;
import kr.or.dw.member.vo.GBookVO;
import kr.or.dw.member.vo.MemberVO;
import kr.or.dw.ranking.vo.GameVO;
import kr.or.dw.web.IAction;

public class GBookAction implements IAction{

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		int user_no = (int)session.getAttribute("user_no");
		IMemberService service = MemberServiceImpl.getInstance();
		MemberVO memberVo = (MemberVO)service.userInfoGet(user_no);
		
		int memberBoardCount = service.memberBoardCount(user_no);
	    req.setAttribute("memberBoardCount", memberBoardCount);
	    int memberReplyCount = service.memberReplyCount(user_no);
	    req.setAttribute("memberReplyCount", memberReplyCount);
	    req.setAttribute("memberVo", memberVo);
	    
	    ILoungeService Lservice = LoungeServiceImpl.getInstance();
	    List<GameVO> memGameList = (List<GameVO>) Lservice.memGameList(user_no);  
	       
	    req.setAttribute("memGameList", memGameList);
	    
	    String b_content = req.getParameter("b_content");
	    
	    GBookVO gBVo = new GBookVO();
	    gBVo.setB_content(b_content);
	    gBVo.setNick(memberVo.getNick());
	    
	    int b_no = service.insertGB(gBVo); 

	    GBookVO resultGBVo = service.selectGBVo(b_no);
	    
	    req.setAttribute("gBVo", resultGBVo);
		
		return "/member/gb_ajax.jsp";
	}

}
