package kr.or.dw.lounge.dao;

import java.util.List;
import java.util.Map;

import kr.or.dw.lounge.vo.GuserVO;
import kr.or.dw.lounge.vo.LikeVO;
import kr.or.dw.lounge.vo.LoungeVO;
import kr.or.dw.lounge.vo.ReplyVO;
import kr.or.dw.ranking.vo.GameVO;

public interface ILoungeDao {

	GameVO selectGame(int g_no);

	List<LoungeVO> selectLoungeList(int g_no);

	LoungeVO selectBoardView(int bd_no);

	List<LoungeVO> selAllLoungeList();

	LoungeVO selectLoungeView(int bd_no);

	int updateLounge(LoungeVO loungeVo);

	int insertContent(LoungeVO loungeVo);

	List<ReplyVO> selectReplyList(int bd_no);

	int insertReply(ReplyVO replyVo);

	ReplyVO selectReply(int re_no);

	int updateLike(LikeVO likeVo);

	int selectLikeCount(int bd_no);

	int selectUserLike(LikeVO likeVo);

	void joinLounge(GuserVO gVo);

	int selGUser(GuserVO gVo);

	void delGUser(GuserVO gVo);

	List<LoungeVO> selectSLoungeList(Map<String, String> map);

	List<GameVO> memGameList(int user_no);

	
	
}
