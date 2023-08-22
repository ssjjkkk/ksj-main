package kr.or.dw.board.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.dw.board.service.BoardServiceImpl;
import kr.or.dw.board.service.IBoardService;
import kr.or.dw.board.vo.BoardVO;
import kr.or.dw.board.vo.LikeVO;
import kr.or.dw.board.vo.ReplyVO;
import kr.or.dw.user.vo.UserVO;
import kr.or.dw.web.IAction;

public class BoardViewAction implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int bd_no = 0;
		bd_no = Integer.parseInt(req.getParameter("bd_no"));
		IBoardService boardService = BoardServiceImpl.getInstance();
		BoardVO boardVo = null;
		boardVo = boardService.selectBoardView(bd_no);
		
		List<ReplyVO> replyList = null;
		replyList = boardService.selectReplyList(bd_no);
		
		HttpSession session = req.getSession();
		UserVO userVo = null;
		int user_no = 0;
		if(session.getAttribute("userVO") != null) {
			user_no = ((UserVO)session.getAttribute("userVO")).getUser_no();
		};
		LikeVO likeVo = new LikeVO();
		likeVo.setBd_no(bd_no);
		likeVo.setUser_no(user_no);
		int userLike = 0;
		userLike = boardService.selectUserLike(likeVo);
		
		req.setAttribute("boardVo", boardVo);
		req.setAttribute("replyList", replyList);
		req.setAttribute("userLike", userLike);
		
		return "/board/boardView.jsp";
	}

}
