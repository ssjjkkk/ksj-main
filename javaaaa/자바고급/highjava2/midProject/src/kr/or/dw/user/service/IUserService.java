package kr.or.dw.user.service;

import kr.or.dw.user.vo.UserVO;

public interface IUserService {

	String getUserid(String userid);	// ID 중복체크

	int insertUser(UserVO userVo);		// 회원가입
	

}
