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
import kr.or.dw.ranking.vo.GameVO;
import kr.or.dw.web.IAction;

public class LikeAction implements IAction{

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
		
		int bd_no = Integer.parseInt(req.getParameter("bd_no"));
		boolean likeFlag = Boolean.parseBoolean(req.getParameter("likeFlag"));	// ajax 로 넘겨준 likeFlag 를 받는다.
		int user_no = 0;
		if (session.getAttribute("user_no") != null) {
			user_no = (int)session.getAttribute("user_no");
		}
		GuserVO gVo = new GuserVO();
		gVo.setUser_no(user_no);
		gVo.setG_no(g_no);

		int g_user = service.selGUser(gVo);
		req.setAttribute("g_user", g_user);
		
		LikeVO likeVo = new LikeVO();
		likeVo.setBd_no(bd_no);
		likeVo.setUser_no(user_no);
		likeVo.setLike_cnt(likeFlag == true ? 1 : -1);	// likeFlag 가 true 이면 like_cnt 수 +1, false 이면 -1
		
		int result = 0;
		int count = 0;	// 좋아요 수를 다시 조회해서 화면으로 가져가기 위한 변수
		result = service.updateLike(likeVo);
		
		if(result > 0) {	// MERGE 구문이 성공하면(update 태그로 되어있어서 성공하면 '1'반환)
			count = service.selectLikeCount(bd_no);
		}
		req.setAttribute("count", count);
		
		return "/lounge/like_ajax.jsp";
	}

}
