package kr.or.dw.member.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.dw.customer.vo.NoticeVO;
import kr.or.dw.member.vo.GBookVO;
import kr.or.dw.member.vo.MemberVO;

import kr.or.dw.util.BuildSqlMapClient;

public class MemberDaoImpl implements IMemberDao{
	
	private static MemberDaoImpl dao;
	private SqlMapClient client;
	
	private MemberDaoImpl() {
		client = BuildSqlMapClient.getSqlMapClient();
	}
	
	public static MemberDaoImpl getInstance() {
		if(dao == null) dao = new MemberDaoImpl();
		return dao;
	}

	@Override
	public String getUserid(String userid) {
		String userId = null;
		
		try {
			userId = (String)client.queryForObject("member.getUserId", userid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return userId;
	}

	@Override
	public int insertMember(MemberVO memberVo) {
		int result = 0;
		try {
			result = (int) client.insert("member.insertMember", memberVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
		
	}

	@Override
	public MemberVO loginMember(String id) {
		MemberVO memberVo = null;
		
		try {
			memberVo = (MemberVO) client.queryForObject("member.loginMember", id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return memberVo;
	}

	@Override
	public MemberVO userInfoGet(int user_no) {
		MemberVO memberVo = null;
		
		try {
			memberVo = (MemberVO) client.queryForObject("member.userInfoGet", user_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return memberVo;
		
	}

	@Override
	public void updateMemberPicPath(MemberVO memberVo) {
		try {
			client.update("member.updateMemberPicPath", memberVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteMemberPicPath(int user_no) {
		try {
			client.update("member.deleteMemberPicPath", user_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public List<NoticeVO> selectNoticeList() {
		List<NoticeVO> noticeList = null;
		
		try {
			noticeList = client.queryForList("member.selectNoticeList");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return noticeList;
	}

	@Override
	public int modProfile(MemberVO memberVo) {
		int result = 0;
		
		try {
			result = client.update("member.modProfile", memberVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<MemberVO> selectAdminList() {
		List<MemberVO> adminList = null;
		
		try {
			adminList = client.queryForList("member.selectAdminList");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return adminList;
	}

	  @Override
	   public int memberBoardCount(int user_no) {
	      int memberBC = 0;
	            
	       try {
	          memberBC = (int)client.queryForObject("member.memcountBoard", user_no);
	       } catch (SQLException e) {
	         e.printStackTrace();
	       }
	            
	      return memberBC;
	   }

	   @Override
	   public int memberReplyCount(int user_no) {
	      int memberRC = 0;
	         
	       try {
	          memberRC = (int)client.queryForObject("member.memcountReply", user_no);
	       } catch (SQLException e) {
	         e.printStackTrace();
	       }
	            
	      return memberRC;
	   }

	@Override
	public String userNick(String nick) {
		String userNick = null;
		
		try {
			userNick = (String)client.queryForObject("member.userNick", nick);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return userNick;
	}

	@Override
	public int insertGB(GBookVO gBVo) {
		int b_no = 0;
		
		try {
			b_no = (int)client.insert("member.insertGB", gBVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return b_no;
	}

	@Override
	public GBookVO selectGBVo(int b_no) {
		GBookVO gBVo = null;
		
		try {
			gBVo = (GBookVO) client.queryForObject("member.selectGBVo", b_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return gBVo;
	}

	@Override
	public List<GBookVO> selectGBList(String nick) {
		List<GBookVO> gbList = null;
		
		try {
			gbList = client.queryForList("member.selectGBList", nick);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return gbList;
	}


	
	

	
	


}
