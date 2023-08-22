package kr.or.dw.member.service;

import kr.or.dw.member.dao.IMemberDao;
import kr.or.dw.member.dao.MemberDaoImpl;
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
	

}
