package kr.or.dw.customer.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.dw.customer.vo.FaqVO;
import kr.or.dw.customer.vo.NoticeVO;
import kr.or.dw.member.vo.MemberVO;

import kr.or.dw.util.BuildSqlMapClient;

public class CustomerDaoImpl implements ICustomerDao{
	
	private static CustomerDaoImpl dao;
	private SqlMapClient client;
	
	private CustomerDaoImpl() {
		client = BuildSqlMapClient.getSqlMapClient();
	}
	
	public static ICustomerDao getInstance() {
		if(dao == null) dao = new CustomerDaoImpl();
		return dao;
	}

	@Override
	public int selectNoticeCount() {
		
		int count = 0;
		
		try {
			count = (int)client.queryForObject("customer.selectNoticeCount");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return count;
	}

	@Override
	public List<NoticeVO> selectNoticeList(Map<String, Object> paramMap) {
		
		List<NoticeVO> noticeList = null;
		
		try {
			noticeList = client.queryForList("customer.selectNoticeList", paramMap);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return noticeList;
	}

	@Override
	public NoticeVO selectNoticeView(int n_no) {
		NoticeVO noticeVo = null;
		
		try {
			noticeVo = (NoticeVO)client.queryForObject("customer.selectNoticeView", n_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
	public List<FaqVO> selectFSList(String faqSearch) {
		List<FaqVO> faqSearchList = null;
		
		try {
			faqSearchList = client.queryForList("customer.selectFSList", faqSearch);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return faqSearchList;
	}


}
