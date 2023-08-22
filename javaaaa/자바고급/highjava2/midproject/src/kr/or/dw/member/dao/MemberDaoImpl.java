package kr.or.dw.member.dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.dw.member.vo.MemberVO;

import kr.or.dw.util.BuildSqlMapClient;

public class MemberDaoImpl implements IMemberDao{
	
	private static MemberDaoImpl dao;
	private SqlMapClient client;
	
	private MemberDaoImpl() {
		client = BuildSqlMapClient.getSqlMapClient();
	}
	
	public static MemberDaoImpl getInstance() {
		if(dao == null) dao = new MemberDaoImpl();
		return dao;
	}

	@Override
	public String getUserid(String userid) {
		String userId = null;
		
		try {
			userId = (String)client.queryForObject("member.getUserId", userid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return userId;
	}

	@Override
	public int insertMember(MemberVO memberVo) {
		int result = 0;
		try {
			result = (int) client.insert("member.insertMember", memberVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
		
	}

	@Override
	public MemberVO loginMember(String id) {
		MemberVO memberVo = null;
		
		try {
			memberVo = (MemberVO) client.queryForObject("member.loginMember", id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return memberVo;
	}

	
	


}
