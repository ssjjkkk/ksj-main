package kr.or.dw.customer.service;

import java.util.List;
import java.util.Map;

import kr.or.dw.admin.dao.AdminDaoImpl;
import kr.or.dw.admin.dao.IAdminDao;
import kr.or.dw.customer.dao.CustomerDaoImpl;
import kr.or.dw.customer.dao.ICustomerDao;
import kr.or.dw.customer.vo.FaqVO;
import kr.or.dw.customer.vo.NoticeVO;
import kr.or.dw.member.vo.MemberVO;

public class CustomerServiceImpl implements ICustomerService {

	private ICustomerDao dao;
	private static CustomerServiceImpl service;
		
	public static CustomerServiceImpl getInstance() {
		if(service == null) service = new CustomerServiceImpl();
		return service;
	}
	
	// 생성자
	private CustomerServiceImpl() {
		dao = CustomerDaoImpl.getInstance();
	}

	@Override
	public int selectNoticeCount() {
		return dao.selectNoticeCount();
	}

	@Override
	public List<NoticeVO> selectNoticeList(Map<String, Object> paramMap) {
		return dao.selectNoticeList(paramMap);
	}

	@Override
	public NoticeVO selectNoticeView(int n_no) {
		return dao.selectNoticeView(n_no);
	}

	@Override
	public List<FaqVO> selectFaqList() {
		return dao.selectFaqList();
	}

	@Override
	public List<FaqVO> selectFSList(String faqSearch) {
		
		return dao.selectFSList(faqSearch);
	}


}
