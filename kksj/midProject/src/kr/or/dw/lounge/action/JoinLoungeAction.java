package kr.or.dw.lounge.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.dw.lounge.service.ILoungeService;
import kr.or.dw.lounge.service.LoungeServiceImpl;
import kr.or.dw.lounge.vo.GuserVO;
import kr.or.dw.lounge.vo.LoungeVO;
import kr.or.dw.ranking.vo.GameVO;
import kr.or.dw.web.IAction;

public class JoinLoungeAction implements IAction {

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		ILoungeService service = LoungeServiceImpl.getInstance();
		int g_no = Integer.parseInt(req.getParameter("g_no"));
		
		int user_no = 0;
		if (session.getAttribute("user_no") != null) {
			user_no = (int)session.getAttribute("user_no");
		}
		
		GameVO gameVo = service.selectGame(g_no);
		List<LoungeVO> loungeList = service.selectLoungeList(g_no);
		List<LoungeVO> allLoungeList = service.selAllLoungeList();
		
		req.setAttribute("allLoungeList", allLoungeList);
		req.setAttribute("gameVo", gameVo);
		req.setAttribute("loungeList", loungeList);
		
		GuserVO gVo = new GuserVO();
		gVo.setUser_no(user_no);
		gVo.setG_no(g_no);
		service.joinLounge(gVo);
		int g_user = service.selGUser(gVo);
		req.setAttribute("g_user", g_user);
		
		return "/lounge/board.jsp";
	}

}
