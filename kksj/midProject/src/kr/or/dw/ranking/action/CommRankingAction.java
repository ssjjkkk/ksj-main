package kr.or.dw.ranking.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.dw.ranking.service.IRankingService;
import kr.or.dw.ranking.service.RankingServiceImpl;
import kr.or.dw.ranking.vo.GameVO;
import kr.or.dw.web.IAction;

public class CommRankingAction implements IAction{

   @Override
   public boolean isRedirect() {
      // TODO Auto-generated method stub
      return false;
   }

   @Override
   public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
      IRankingService service = RankingServiceImpl.getInstance();
      
      List<GameVO> gameList = service.selectGameList();
      List<GameVO> gameHList = service.selectGameHList();
      List<GameVO> gameJList = service.selectGameJList();
      
      int g = Integer.parseInt(req.getParameter("g"));
      
      req.setAttribute("gameList", gameList);
      req.setAttribute("gameHList", gameHList);
      req.setAttribute("gameJList", gameJList);
      req.setAttribute("g", g);
      return "/ranking/community.jsp";
   }

}