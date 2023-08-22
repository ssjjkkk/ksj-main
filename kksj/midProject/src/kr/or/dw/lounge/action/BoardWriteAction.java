package kr.or.dw.lounge.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.dw.admin.service.AdminServiceImpl;
import kr.or.dw.admin.service.IAdminService;
import kr.or.dw.customer.vo.NoticeVO;
import kr.or.dw.lounge.service.ILoungeService;
import kr.or.dw.lounge.service.LoungeServiceImpl;
import kr.or.dw.lounge.vo.GuserVO;
import kr.or.dw.lounge.vo.LoungeVO;
import kr.or.dw.member.service.IMemberService;
import kr.or.dw.member.service.MemberServiceImpl;
import kr.or.dw.member.vo.MemberVO;
import kr.or.dw.ranking.vo.GameVO;
import kr.or.dw.web.IAction;

public class BoardWriteAction implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		ILoungeService service = LoungeServiceImpl.getInstance();
		IAdminService aService = AdminServiceImpl.getInstance();
		int g_no = Integer.parseInt(req.getParameter("g_no"));
		GameVO gameVo = service.selectGame(g_no);
		List<LoungeVO> loungeList = service.selectLoungeList(g_no);
		List<LoungeVO> allLoungeList = service.selAllLoungeList();
		
		req.setAttribute("allLoungeList", allLoungeList);
		req.setAttribute("gameVo", gameVo);
		req.setAttribute("loungeList", loungeList);		
		
		
		if(session.getAttribute("user_no") != null) {
			int user_no = (int)session.getAttribute("user_no");
			GuserVO gVo = new GuserVO();
			gVo.setUser_no(user_no);
			gVo.setG_no(g_no);
			int g_user = service.selGUser(gVo);
			req.setAttribute("g_user", g_user);
			MemberVO memberVo = aService.memberSel(user_no);
			req.setAttribute("memberVo", memberVo);
			
			if(req.getParameter("bd_no") != null) {
				int bd_no = Integer.parseInt(req.getParameter("bd_no"));
				LoungeVO loungeVo = service.selectLoungeView(bd_no);
				req.setAttribute("loungeVo", loungeVo);
			}
			return "/lounge/write.jsp";			
		} else {
			return "/lounge/board.jsp";
		}
	}

}
