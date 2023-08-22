package kr.or.dw.lounge.service;

import java.util.List;
import java.util.Map;

import kr.or.dw.lounge.dao.ILoungeDao;
import kr.or.dw.lounge.dao.LoungeDaoImpl;
import kr.or.dw.lounge.vo.GuserVO;
import kr.or.dw.lounge.vo.LikeVO;
import kr.or.dw.lounge.vo.LoungeVO;
import kr.or.dw.lounge.vo.ReplyVO;
import kr.or.dw.ranking.dao.IRankingDao;
import kr.or.dw.ranking.dao.RankingDaoImpl;
import kr.or.dw.ranking.vo.GameVO;

public class LoungeServiceImpl implements ILoungeService {

	private ILoungeDao dao;
	private static LoungeServiceImpl service;
		
	public static LoungeServiceImpl getInstance() {
		if(service == null) service = new LoungeServiceImpl();
		return service;
	}
	
	// 생성자
	private LoungeServiceImpl() {
		dao = LoungeDaoImpl.getInstance();
	}

	@Override
	public GameVO selectGame(int g_no) {
		
		return dao.selectGame(g_no);
	}

	@Override
	public List<LoungeVO> selectLoungeList(int g_no) {
		
		return dao.selectLoungeList(g_no);
	}

	@Override
	public LoungeVO selectBoardView(int bd_no) {

		return dao.selectBoardView(bd_no);
	}

	@Override
	public List<LoungeVO> selAllLoungeList() {
		
		return dao.selAllLoungeList();
	}

	@Override
	public LoungeVO selectLoungeView(int bd_no) {
		
		return dao.selectLoungeView(bd_no);
	}

	@Override
	public int updateLounge(LoungeVO loungeVo) {
		
		return dao.updateLounge(loungeVo);
	}

	@Override
	public int insertContent(LoungeVO loungeVo) {
		
		return dao.insertContent(loungeVo);
	}

	@Override
	public List<ReplyVO> selectReplyList(int bd_no) {
		// TODO Auto-generated method stub
		return dao.selectReplyList(bd_no);
	}

	@Override
	public int insertReply(ReplyVO replyVo) {
		// TODO Auto-generated method stub
		return dao.insertReply(replyVo);
	}

	@Override
	public ReplyVO selectReply(int re_no) {
		// TODO Auto-generated method stub
		return dao.selectReply(re_no);
	}

	@Override
	public int updateLike(LikeVO likeVo) {
		// TODO Auto-generated method stub
		return dao.updateLike(likeVo);
	}

	@Override
	public int selectLikeCount(int bd_no) {
		// TODO Auto-generated method stub
		return dao.selectLikeCount(bd_no);
	}

	@Override
	public int selectUserLike(LikeVO likeVo) {
		// TODO Auto-generated method stub
		return dao.selectUserLike(likeVo);
	}

	@Override
	public void joinLounge(GuserVO gVo) {
		// TODO Auto-generated method stub
		dao.joinLounge(gVo);
		
	}

	@Override
	public int selGUser(GuserVO gVo) {
		// TODO Auto-generated method stub
		return dao.selGUser(gVo);
	}

	@Override
	public void delGuser(GuserVO gVo) {
		// TODO Auto-generated method stub
		dao.delGUser(gVo);
	}

	@Override
	public List<LoungeVO> selectSLoungeList(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.selectSLoungeList(map);
	}

	@Override
	public List<GameVO> memGameList(int user_no) {
		// TODO Auto-generated method stub
		return dao.memGameList(user_no);
	}

	


}
