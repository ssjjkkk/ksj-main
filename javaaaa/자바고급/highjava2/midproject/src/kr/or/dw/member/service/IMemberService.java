package kr.or.dw.member.service;

import kr.or.dw.member.vo.MemberVO;

public interface IMemberService {

	String getUserid(String userid);	// ID 중복체크

	int insertMember(MemberVO memberVo);

	MemberVO loginMember(String id);

	


}
