package kr.or.dw.member.dao;

import java.util.List;

import kr.or.dw.customer.vo.NoticeVO;
import kr.or.dw.member.vo.GBookVO;
import kr.or.dw.member.vo.MemberVO;

public interface IMemberDao {

	String getUserid(String userid);	// ID 중복체크

	int insertMember(MemberVO memberVo);

	MemberVO loginMember(String id);

	MemberVO userInfoGet(int user_no);

	void updateMemberPicPath(MemberVO memberVo);

	void deleteMemberPicPath(int user_no);

	List<NoticeVO> selectNoticeList();

	int modProfile(MemberVO memberVo);

	List<MemberVO> selectAdminList();

	int memberBoardCount(int user_no);

	int memberReplyCount(int user_no);

	String userNick(String nick);

	int insertGB(GBookVO gBVo);

	GBookVO selectGBVo(int b_no);

	List<GBookVO> selectGBList(String nick);



	
}
