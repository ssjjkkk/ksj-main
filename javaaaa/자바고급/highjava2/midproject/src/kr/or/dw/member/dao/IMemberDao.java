package kr.or.dw.member.dao;

import kr.or.dw.member.vo.MemberVO;

public interface IMemberDao {

	String getUserid(String userid);	// ID 중복체크

	int insertMember(MemberVO memberVo);

	MemberVO loginMember(String id);


	
}
