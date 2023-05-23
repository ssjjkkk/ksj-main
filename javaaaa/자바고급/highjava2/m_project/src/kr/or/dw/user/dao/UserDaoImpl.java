package kr.or.dw.user.dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.dw.user.vo.UserVO;
import kr.or.dw.util.BuildSqlMapClient;

public class UserDaoImpl implements IUserDao{
	
	private static UserDaoImpl dao;
	private SqlMapClient client;
	
	private UserDaoImpl() {
		client = BuildSqlMapClient.getSqlMapClient();
	}
	
	public static UserDaoImpl getInstance() {
		if(dao == null) dao = new UserDaoImpl();
		return dao;
	}
	
	@Override
	public String getUserNick(String nick) {
		String userNick = null;
		
		try {
			userNick = (String)client.queryForObject("user.getUserNick", nick);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return userNick;
	}

	@Override
	public int insertUser(UserVO userVo) {
		int result = 0;
		try {
			result = (int) client.insert("user.insertUser", userVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public UserVO loginUser(String email) {
		
		UserVO userVo = null;
		
		try {
			userVo = (UserVO) client.queryForObject("user.loginUser", email);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userVo;
	}

	@Override
	public Object updateUserPicPath(UserVO userVo) {
		try {
			client.update("user.updateUserPicPath", userVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
