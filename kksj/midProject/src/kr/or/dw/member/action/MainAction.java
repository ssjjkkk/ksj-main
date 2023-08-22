package kr.or.dw.member.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.dw.customer.vo.NoticeVO;
import kr.or.dw.lounge.service.ILoungeService;
import kr.or.dw.lounge.service.LoungeServiceImpl;
import kr.or.dw.lounge.vo.LoungeVO;
import kr.or.dw.member.service.IMemberService;
import kr.or.dw.member.service.MemberServiceImpl;
import kr.or.dw.member.vo.MemberVO;
import kr.or.dw.ranking.service.IRankingService;
import kr.or.dw.ranking.service.RankingServiceImpl;
import kr.or.dw.ranking.vo.GameVO;
import kr.or.dw.web.IAction;

public class MainAction implements IAction{

   @Override
   public boolean isRedirect() {
      return false;
   }

   @Override
   public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
      IMemberService service = MemberServiceImpl.getInstance();
      IRankingService Rservice = RankingServiceImpl.getInstance();
      ILoungeService Lservice = LoungeServiceImpl.getInstance();
      
      List<NoticeVO> noticeList = service.selectNoticeList();
      List<MemberVO> adminList = service.selectAdminList();
      List<GameVO> gameList = Rservice.selectGameList();
      List<GameVO> gameHList = Rservice.selectGameHList();
       List<GameVO> gameJList = Rservice.selectGameJList();
       List<LoungeVO> allLoungeList = Lservice.selAllLoungeList();
         
         
      req.setAttribute("adminList", adminList);
        req.setAttribute("noticeList", noticeList);
        req.setAttribute("gameList", gameList);
        req.setAttribute("gameList", gameList);
        req.setAttribute("gameHList", gameHList);
        req.setAttribute("gameJList", gameJList);
        req.setAttribute("allLoungeList", allLoungeList);

        return "/main.jsp";
   }

}