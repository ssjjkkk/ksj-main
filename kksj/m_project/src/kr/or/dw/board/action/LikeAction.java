package kr.or.dw.board.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.dw.board.service.BoardServiceImpl;
import kr.or.dw.board.service.IBoardService;
import kr.or.dw.board.vo.LikeVO;
import kr.or.dw.user.vo.UserVO;
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
		
		IBoardService service = BoardServiceImpl.getInstance();
		
		int bd_no = Integer.parseInt(req.getParameter("bd_no"));
		boolean likeFlag = Boolean.parseBoolean(req.getParameter("likeFlag"));	// ajax 로 넘겨준 likeFlag 를 받는다.
		int user_no = ((UserVO)session.getAttribute("userVO")).getUser_no();
		
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
		
		return "/board/like_ajax.jsp";
	}

}
