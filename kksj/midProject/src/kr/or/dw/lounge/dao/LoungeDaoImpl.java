package kr.or.dw.lounge.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.dw.customer.vo.NoticeVO;
import kr.or.dw.lounge.vo.GuserVO;
import kr.or.dw.lounge.vo.LikeVO;
import kr.or.dw.lounge.vo.LoungeVO;
import kr.or.dw.lounge.vo.ReplyVO;
import kr.or.dw.ranking.vo.GameVO;
import kr.or.dw.util.BuildSqlMapClient;

public class LoungeDaoImpl implements ILoungeDao{
	
	private static LoungeDaoImpl dao;
	private SqlMapClient client;
	
	private LoungeDaoImpl() {
		client = BuildSqlMapClient.getSqlMapClient();
	}
	
	public static LoungeDaoImpl getInstance() {
		if(dao == null) dao = new LoungeDaoImpl();
		return dao;
	}

	@Override
	public GameVO selectGame(int g_no) {
		GameVO gameVo = null;
		
		try {
			gameVo = (GameVO) client.queryForObject("lounge.selectGame", g_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return gameVo;
	}

	@Override
	public List<LoungeVO> selectLoungeList(int g_no) {
		List<LoungeVO> loungeList = null;
		
		try {
			loungeList = client.queryForList("lounge.selectLoungeList", g_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return loungeList;
	}

	@Override
	public LoungeVO selectBoardView(int bd_no) {
		LoungeVO loungeVo = null;
		
		try {
			loungeVo = (LoungeVO) client.queryForObject("lounge.selectBoardView", bd_no);
			client.update("lounge.increaseHit", bd_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return loungeVo;
	}

	@Override
	public List<LoungeVO> selAllLoungeList() {
		List<LoungeVO> allLoungeList = null;
		
		try {
			allLoungeList = client.queryForList("lounge.selAllLoungeList");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return allLoungeList;
	}

	@Override
	public LoungeVO selectLoungeView(int bd_no) {
		LoungeVO loungeVo = null;
		
		try {
			loungeVo = (LoungeVO)client.queryForObject("lounge.selectLoungeView", bd_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return loungeVo;
	}

	@Override
	public int updateLounge(LoungeVO loungeVo) {
		int result = 0;
		
		try {
			result = client.update("lounge.updateContent", loungeVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int insertContent(LoungeVO loungeVo) {
		int bd_no = 0;
		
		try {
			bd_no = (int) client.insert("lounge.insertContent", loungeVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return bd_no;
	}

	@Override
	   public ReplyVO selectReply(int re_no) {
	      ReplyVO replyVo = null;
	      
	      try {
	         replyVo = (ReplyVO)client.queryForObject("lounge.selectReply", re_no);
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	      
	      return replyVo;
	   }

	   @Override
	   public int insertReply(ReplyVO replyVo) {
	      int re_no = 0;
	      
	      try {
	         re_no = (int)client.insert("lounge.insertReply", replyVo);
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	      
	      return re_no;
	   }

	   @Override
	   public List<ReplyVO> selectReplyList(int bd_no) {
	      List<ReplyVO> replyList = null;
	      
	      try {
	         replyList = client.queryForList("lounge.selectReplyList", bd_no);
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	      }
	      
	      return replyList;
	   }

	   @Override
		public int updateLike(LikeVO likeVo) {
			int result = 0;
			
			try {
				result = client.update("lounge.updateLike", likeVo);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return result;
		}

		@Override
		public int selectLikeCount(int bd_no) {
			int count = 0;
			
			try {
				count = (int) client.queryForObject("lounge.selectLikeCount", bd_no);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return count;
		}

		@Override
		public int selectUserLike(LikeVO likeVo) {
			Object result;
			int num = 0;
			
			try {
				result = client.queryForObject("lounge.selectUserLike", likeVo);
				if(result != null) {
					num = Integer.parseInt(result.toString());
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return num;
		}

		@Override
		public void joinLounge(GuserVO gVo) {
			try {
				client.insert("lounge.joinLounge", gVo);
				client.update("lounge.increaseGU", gVo);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}

		@Override
		public int selGUser(GuserVO gVo) {
			int g_user = 0;
			Object result = null;
			
			try {
				result = client.queryForObject("lounge.selGUser", gVo);
				if(result != null) {
					g_user = (int)client.queryForObject("lounge.selGUser", gVo);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return g_user;
		}

		@Override
		public void delGUser(GuserVO gVo) {
			try {
				client.delete("lounge.delGUser", gVo);
				client.update("lounge.delGU", gVo);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}

		@Override
		public List<LoungeVO> selectSLoungeList(Map<String, String> map) {
			List<LoungeVO> selectSLoungeList = null;
			
			try {
				selectSLoungeList = (List<LoungeVO>) client.queryForList("lounge.selectSLoungeList", map);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return selectSLoungeList;
		}

		 @Override
	      public List<GameVO> memGameList(int user_no) {
	         List<GameVO> memGameList = null;
	         
	         try {
	            memGameList = (List<GameVO>)client.queryForList("lounge.memGameList", user_no);
	         } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }
	         
	         return memGameList;
	      }
	



}
