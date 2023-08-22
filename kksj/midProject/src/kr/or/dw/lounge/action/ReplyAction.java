package kr.or.dw.lounge.action;

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
import kr.or.dw.member.vo.MemberVO;
import kr.or.dw.ranking.vo.GameVO;
import kr.or.dw.web.IAction;

public class ReplyAction implements IAction{

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		ILoungeService service = LoungeServiceImpl.getInstance();
		IAdminService aService = AdminServiceImpl.getInstance();
		HttpSession session = req.getSession();
		int g_no = Integer.parseInt(req.getParameter("g_no"));
		System.out.println(g_no);
		
		GameVO gameVo = service.selectGame(g_no);
		List<LoungeVO> loungeList = service.selectLoungeList(g_no);
		List<LoungeVO> allLoungeList = service.selAllLoungeList();
		
		req.setAttribute("allLoungeList", allLoungeList);
		req.setAttribute("gameVo", gameVo);
		req.setAttribute("loungeList", loungeList);
		
		int user_no = 0;
		if (session.getAttribute("user_no") != null) {
			user_no = (int)session.getAttribute("user_no");
		}
		GuserVO gVo = new GuserVO();
		gVo.setUser_no(user_no);
		gVo.setG_no(g_no);

		int g_user = service.selGUser(gVo);
		req.setAttribute("g_user", g_user);
		MemberVO memberVo = aService.memberSel(user_no);
		int bd_no = Integer.parseInt(req.getParameter("bd_no"));
		String re_content = req.getParameter("re_content");
		String nick = memberVo.getNick();
		
		System.out.println(nick);
		
		ReplyVO replyVo = new ReplyVO();
		replyVo.setBd_no(bd_no);
		replyVo.setUser_no(user_no);
		replyVo.setNick(nick);
		replyVo.setRe_content(re_content);
		
		int re_no = service.insertReply(replyVo);
		System.out.println(re_no);
		ReplyVO resultReplyVo = service.selectReply(re_no);
		
		System.out.println("replyAction 의 replyVo : " + replyVo.getRe_no() + replyVo.getRe_content());
		
		req.setAttribute("replyVo", resultReplyVo);
		
		return "/lounge/reply_ajax.jsp";
	}

}
