package kr.or.dw.admin.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.dw.admin.vo.AdminVO;
import kr.or.dw.customer.vo.FaqVO;
import kr.or.dw.customer.vo.NoticeVO;
import kr.or.dw.member.vo.MemberVO;

import kr.or.dw.util.BuildSqlMapClient;

public class AdminDaoImpl implements IAdminDao{
	
	private static AdminDaoImpl dao;
	private SqlMapClient client;
	
	private AdminDaoImpl() {
		client = BuildSqlMapClient.getSqlMapClient();
	}
	
	public static IAdminDao getInstance() {
		if(dao == null) dao = new AdminDaoImpl();
		return dao;
	}

	@Override
	public List<MemberVO> selectMember() {
		
		List<MemberVO> memberList = null;
		
		try {
			memberList = client.queryForList("admin.selectMember");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return memberList;
	}

	@Override
	public int memCount() {
		int memCount = 0;
		
		try {
			memCount = (int)client.queryForObject("admin.countMem");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return memCount;
	}

	@Override
	public int adminCount() {
		int adminCount = 0;
		
		try {
			adminCount = (int)client.queryForObject("admin.countAdmin");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return adminCount;
	}

	@Override
	public MemberVO memberSel(int user_no) {
		
		MemberVO memberVo = null;
		
		try {
			memberVo = (MemberVO)client.queryForObject("admin.memberSel", user_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return memberVo;
	}

	@Override
	public List<NoticeVO> selectNoticeList() {
		
		List<NoticeVO> noticeList = null;
		
		try {
			noticeList = client.queryForList("admin.selectNoticeList");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return noticeList;
	}

	@Override
	public int insertContent(NoticeVO noticeVo) {
		int n_no = 0;
		
		try {
			n_no = (int) client.insert("admin.insertContent", noticeVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return n_no;
	}

	@Override
	public NoticeVO selectNotice(int n_no) {
		NoticeVO notice = null;
		
		try {
			notice = (NoticeVO)client.queryForObject("admin.selectNotice", n_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return notice;
	}

	@Override
	public int updateNotice(NoticeVO noticeVo) {
		int result = 0;
		
		try {
			result = client.update("admin.updateNotice", noticeVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void deleteNotice(int n_no) {
		try {
			client.update("admin.deleteNotice", n_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public NoticeVO selectNoticeView(int n_no) {
		NoticeVO noticeVo = null;
		
		try {
			noticeVo = (NoticeVO)client.queryForObject("admin.selectNoticeView", n_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return noticeVo;
	}

	@Override
	public List<FaqVO> selectFaqList() {
		List<FaqVO> faqList = null;
		
		try {
			faqList = client.queryForList("admin.selectFaqList");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return faqList;
	}

	@Override
	public FaqVO selectFaqView(int f_no) {
		FaqVO faqVo = null;
		
		try {
			faqVo = (FaqVO)client.queryForObject("admin.selectFaqView", f_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return faqVo;
	}

	@Override
	public int updateFaq(FaqVO faqVo) {
		int result = 0;
		
		try {
			result = client.update("admin.updateFaq", faqVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int insertFContent(FaqVO faqVo) {
		int f_no = 0;
		
		try {
			f_no = (int) client.insert("admin.insertFContent", faqVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return f_no;
	}

	@Override
	public void deleteFaq(int f_no) {
		try {
			client.update("admin.deleteFaq", f_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public void userBen(int user_no) {
		try {
			client.update("admin.benUser", user_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public void userUnBen(int user_no) {
		try {
			client.update("admin.unBenUser", user_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public void userUnDel(int user_no) {
		try {
			client.update("admin.unDelUser", user_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public void userDel(int user_no) {
		try {
			client.update("admin.delUser", user_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	 public int boardCount() {
	      int boardCount = 0;
	      
	      try {
	         boardCount = (int)client.queryForObject("admin.countBoard");
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	      
	      return boardCount;
	   }

	@Override
	public List<MemberVO> selectSMember(String search) {
		List<MemberVO> sMemberList = null;
		
		try {
			sMemberList = client.queryForList("admin.selectSMember", search);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return sMemberList;
	}




}
