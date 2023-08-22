package kr.or.dw.lounge.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.dw.lounge.service.ILoungeService;
import kr.or.dw.lounge.service.LoungeServiceImpl;
import kr.or.dw.lounge.vo.GuserVO;
import kr.or.dw.lounge.vo.LikeVO;
import kr.or.dw.lounge.vo.LoungeVO;
import kr.or.dw.lounge.vo.ReplyVO;
import kr.or.dw.member.vo.MemberVO;
import kr.or.dw.ranking.vo.GameVO;
import kr.or.dw.web.IAction;

public class BoardViewAction implements IAction{

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
		
		GameVO gameVo = service.selectGame(g_no);
		List<LoungeVO> loungeList = service.selectLoungeList(g_no);
		List<LoungeVO> allLoungeList = service.selAllLoungeList();
		
		req.setAttribute("allLoungeList", allLoungeList);
		req.setAttribute("gameVo", gameVo);
		req.setAttribute("loungeList", loungeList);
		
		int bd_no = 0;
		bd_no = Integer.parseInt(req.getParameter("bd_no"));
		System.out.println(bd_no);
		LoungeVO loungeVo = null;
		loungeVo = service.selectLoungeView(bd_no);
		
		List<ReplyVO> replyList = null;
	    replyList = service.selectReplyList(bd_no);
	    System.out.println("보드뷰 액션에 있는 replyList : " + replyList);

	    req.setAttribute("replyList", replyList);
	    
	    int user_no = 0;
	    if (session.getAttribute("user_no") != null) {
	    	user_no = (int) session.getAttribute("user_no");
	    }
	    
		GuserVO gVo = new GuserVO();
		gVo.setUser_no(user_no);
		gVo.setG_no(g_no);

		int g_user = service.selGUser(gVo);
		req.setAttribute("g_user", g_user);
	    
	    
	    
	    LikeVO likeVo = new LikeVO();
		likeVo.setBd_no(bd_no);
		likeVo.setUser_no(user_no);
		int userLike = 0;
		userLike = service.selectUserLike(likeVo);
		
		
		req.setAttribute("loungeVo", loungeVo);
//		req.setAttribute("replyList", replyList);
		req.setAttribute("userLike", userLike);
		
		return "/lounge/game.jsp";
	}

}
