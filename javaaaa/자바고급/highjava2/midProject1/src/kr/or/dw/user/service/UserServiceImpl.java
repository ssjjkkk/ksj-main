package kr.or.dw.user.service;

import kr.or.dw.user.dao.IUserDao;
import kr.or.dw.user.dao.UserDaoImpl;
import kr.or.dw.user.vo.UserVO;

public class UserServiceImpl implements IUserService {

	private IUserDao dao;
	private static UserServiceImpl service;
		
	public static UserServiceImpl getInstance() {
		if(service == null) service = new UserServiceImpl();
		return service;
	}
	
	// 생성자
	private UserServiceImpl() {
		dao = UserDaoImpl.getInstance();
	}

	@Override
	public String getUserid(String userid) {
		return dao.getUserid(userid);
	}

	@Override
	public int insertUser(UserVO userVo) {

		return dao.insertUser(userVo);
	}
	
	

}
