package kr.or.dw.admin.dao;

import java.util.List;

import kr.or.dw.admin.vo.AdminVO;
import kr.or.dw.customer.vo.FaqVO;
import kr.or.dw.customer.vo.NoticeVO;
import kr.or.dw.member.vo.MemberVO;

public interface IAdminDao {

	List<MemberVO> selectMember();

	int memCount();

	int adminCount();

	MemberVO memberSel(int user_no);

	List<NoticeVO> selectNoticeList();

	int insertContent(NoticeVO noticeVo);


	NoticeVO selectNotice(int n_no);

	int updateNotice(NoticeVO noticeVo);

	void deleteNotice(int n_no);

	NoticeVO selectNoticeView(int n_no);

	List<FaqVO> selectFaqList();

	FaqVO selectFaqView(int f_no);

	int updateFaq(FaqVO faqVo);

	int insertFContent(FaqVO faqVo);

	void deleteFaq(int f_no);

	void userBen(int user_no);

	void userUnBen(int user_no);

	void userUnDel(int user_no);

	void userDel(int user_no);

	int boardCount();

	List<MemberVO> selectSMember(String search);


}
