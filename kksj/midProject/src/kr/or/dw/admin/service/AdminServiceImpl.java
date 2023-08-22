package kr.or.dw.admin.service;

import java.util.List;

import kr.or.dw.admin.dao.AdminDaoImpl;
import kr.or.dw.admin.dao.IAdminDao;
import kr.or.dw.admin.vo.AdminVO;
import kr.or.dw.customer.vo.FaqVO;
import kr.or.dw.customer.vo.NoticeVO;
import kr.or.dw.member.vo.MemberVO;

public class AdminServiceImpl implements IAdminService {

	private IAdminDao dao;
	private static AdminServiceImpl service;
		
	public static AdminServiceImpl getInstance() {
		if(service == null) service = new AdminServiceImpl();
		return service;
	}
	
	// 생성자
	private AdminServiceImpl() {
		dao = AdminDaoImpl.getInstance();
	}

	@Override
	public List<MemberVO> selectMember() {
		
		return dao.selectMember();
	}

	@Override
	public int memCount() {
		return dao.memCount();
	}

	@Override
	public int adminCount() {
		return dao.adminCount();
	}

	@Override
	public MemberVO memberSel(int user_no) {
		return dao.memberSel(user_no);
	}

	@Override
	public List<NoticeVO> selectNoticeList() {
		return dao.selectNoticeList();
	}

	@Override
	public int insertContent(NoticeVO noticeVo) {
		return dao.insertContent(noticeVo);
	}

	@Override
	public NoticeVO selectNotice(int n_no) {
		return dao.selectNotice(n_no);
	}

	@Override
	public int updateNotice(NoticeVO noticeVo) {
		// TODO Auto-generated method stub
		return dao.updateNotice(noticeVo);
	}

	@Override
	public void deleteNotice(int n_no) {
		dao.deleteNotice(n_no);
		
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
	public FaqVO selectFaqView(int f_no) {

		return dao.selectFaqView(f_no);
	}

	@Override
	public int updateFaq(FaqVO faqVo) {
		
		return dao.updateFaq(faqVo);
	}

	@Override
	public int insertFContent(FaqVO faqVo) {
		
		return dao.insertFContent(faqVo);
	}

	@Override
	public void deleteFaq(int f_no) {
		dao.deleteFaq(f_no);
		
	}

	@Override
	public void userBen(int user_no) {
		dao.userBen(user_no);
		
	}

	@Override
	public void userUnBen(int user_no) {
		dao.userUnBen(user_no);
		
	}

	@Override
	public void userUnDel(int user_no) {
		dao.userUnDel(user_no);
		
	}

	@Override
	public void userDel(int user_no) {
		dao.userDel(user_no);
		
	}

	@Override
	public int boardCount() {
		
		return dao.boardCount();
	}

	@Override
	public List<MemberVO> selectSMember(String search) {
		return dao.selectSMember(search);
	}






}
