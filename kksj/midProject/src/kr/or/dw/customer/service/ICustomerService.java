package kr.or.dw.customer.service;

import java.util.List;
import java.util.Map;

import kr.or.dw.customer.vo.FaqVO;
import kr.or.dw.customer.vo.NoticeVO;
import kr.or.dw.member.vo.MemberVO;

public interface ICustomerService {

	int selectNoticeCount();

	List<NoticeVO> selectNoticeList(Map<String, Object> paramMap);

	NoticeVO selectNoticeView(int n_no);

	List<FaqVO> selectFaqList();

	List<FaqVO> selectFSList(String faqSearch);



}
