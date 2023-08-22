package kr.or.dw.member.service;

import java.util.List;

import kr.or.dw.customer.vo.NoticeVO;
import kr.or.dw.member.dao.IMemberDao;
import kr.or.dw.member.dao.MemberDaoImpl;
import kr.or.dw.member.vo.GBookVO;
import kr.or.dw.member.vo.MemberVO;

public class MemberServiceImpl implements IMemberService {

	private IMemberDao dao;
	private static MemberServiceImpl service;
		
	public static MemberServiceImpl getInstance() {
		if(service == null) service = new MemberServiceImpl();
		return service;
	}
	
	// 생성자
	private MemberServiceImpl() {
		dao = MemberDaoImpl.getInstance();
	}

	@Override
	public String getUserid(String userid) {
		return dao.getUserid(userid);
	}

	@Override
	public int insertMember(MemberVO memberVo) {
		// TODO Auto-generated method stub
		return dao.insertMember(memberVo);
	}

	@Override
	public MemberVO loginMember(String id) {
		return dao.loginMember(id);
	}

	@Override
	public MemberVO userInfoGet(int user_no) {
		return dao.userInfoGet(user_no);
	}

	@Override
	public void updateMemberPicPath(MemberVO memberVo) {
		dao.updateMemberPicPath(memberVo);
		
	}

	@Override
	public void deleteMemberPicPath(int user_no) {
		dao.deleteMemberPicPath(user_no);
		
	}

	@Override
	public List<NoticeVO> selectNoticeList() {
		// TODO Auto-generated method stub
		return dao.selectNoticeList();
	}

	@Override
	public int modProfile(MemberVO memberVo) {
		return dao.modProfile(memberVo);
	}

	@Override
	public List<MemberVO> selectAdminList() {

		return dao.selectAdminList();
	}

	@Override
	public int memberBoardCount(int user_no) {
		
		return dao.memberBoardCount(user_no);
	}

	@Override
	public int memberReplyCount(int user_no) {
		// TODO Auto-generated method stub
		return dao.memberReplyCount(user_no);
	}

	@Override
	public String userNick(String nick) {
		// TODO Auto-generated method stub
		return dao.userNick(nick);
	}

	@Override
	public int insertGB(GBookVO gBVo) {
		// TODO Auto-generated method stub
		return dao.insertGB(gBVo);
	}

	@Override
	public GBookVO selectGBVo(int b_no) {
		// TODO Auto-generated method stub
		return dao.selectGBVo(b_no);
	}

	@Override
	public List<GBookVO> selectGBList(String nick) {
		// TODO Auto-generated method stub
		return dao.selectGBList(nick);
	}

	

	
	

}
