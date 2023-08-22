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
import kr.or.dw.member.vo.MemberVO;
import kr.or.dw.ranking.vo.GameVO;
import kr.or.dw.web.IAction;

public class ContentInsertAction implements IAction {

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		ILoungeService service = LoungeServiceImpl.getInstance();
		
		int g_no = Integer.parseInt(req.getParameter("wr_id"));
		
		GameVO gameVo = service.selectGame(g_no);
		List<LoungeVO> loungeList = service.selectLoungeList(g_no);
		List<LoungeVO> allLoungeList = service.selAllLoungeList();
		
		req.setAttribute("allLoungeList", allLoungeList);
		req.setAttribute("gameVo", gameVo);
		req.setAttribute("loungeList", loungeList);
		
	    
	    String bd_title = req.getParameter("subject");
	    String bd_content = req.getParameter("content");
	    int user_no = 0;
		if (session.getAttribute("user_no") != null) {
			user_no = (int)session.getAttribute("user_no");
		}
		GuserVO gVo = new GuserVO();
		gVo.setUser_no(user_no);
		gVo.setG_no(g_no);

		int g_user = service.selGUser(gVo);
		req.setAttribute("g_user", g_user);
	    String nick = req.getParameter("app_id");
	    LoungeVO loungeVo = new LoungeVO();
	    loungeVo.setBd_title(bd_title);
	    loungeVo.setBd_content(bd_content);
	    loungeVo.setNick(nick);
	    loungeVo.setUser_no(user_no);
	    loungeVo.setG_no(g_no);
	    
	    int bd_no = 0;
	    if(req.getParameter("board_id") != null) {
	    	bd_no = Integer.parseInt(req.getParameter("board_id"));
	    	loungeVo.setBd_no(bd_no);;
	    	int result = service.updateLounge(loungeVo);
	    }else {
	    	bd_no = service.insertContent(loungeVo);
	    }

	    	
		return req.getContextPath() + "/lounge/boardView.do?bd_no=" + bd_no + "&g_no=" + g_no;
	}

}
