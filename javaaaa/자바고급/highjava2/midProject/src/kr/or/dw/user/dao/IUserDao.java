package kr.or.dw.user.dao;

import kr.or.dw.user.vo.UserVO;

public interface IUserDao {

	String getUserid(String userid);	// ID 중복체크

	int insertUser(UserVO userVo);		// 회원가입

	
}
