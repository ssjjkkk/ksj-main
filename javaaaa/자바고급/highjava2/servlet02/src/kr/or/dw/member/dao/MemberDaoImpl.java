package kr.or.dw.member.dao;

import java.sql.SQLException;
import java.util.List;
import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.dw.util.BuildSqlMapClient;
import kr.or.dw.vo.MemberVO;

public class MemberDaoImpl implements IMemberDao{
	
	private static MemberDaoImpl dao;
	private SqlMapClient smc;	// ibatis 용 SqlMapClient 객체 변수 선언
	
	private MemberDaoImpl() {
		smc = BuildSqlMapClient.getSqlMapClient();
	}
	
	public static MemberDaoImpl getInstance() {
		if(dao == null) {
			dao = new MemberDaoImpl();
		}
		return dao;
	}
	
	@Override
	public List<MemberVO> getAllMember() {
		// SQL문을 실행을 하고 결과를 받아서 service에 넘겨준다.
		List<MemberVO> memList = null;
		try {
			memList = smc.queryForList("mymember.getAllMember");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return memList;
	}

	@Override
	public int getMemberCount(String mem_id) {
		int cnt = 0;
		
		try {
			cnt = (int)smc.queryForObject("mymember.getMemberCount", mem_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public int insertMember(MemberVO memVO) {
		int result = 0;
		
		try {
			Object obj = smc.insert("mymember.insertMember", memVO);
			
			if(obj == null) {
				result = 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public MemberVO getMember(String mem_id) {
		
		MemberVO memVO = null;
		
		try {
			memVO = (MemberVO)smc.queryForObject("mymember.getMember", mem_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return memVO;
	}

	@Override
	public int updateMember(MemberVO memVO) {
		int result = 0;
		
		try {
			int obj = smc.update("mymember.updateMember", memVO);
			if(obj == 1) {
				result = 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int deleteMember(String id) {
		int result = 0;
		
		try {
			result = smc.delete("mymember.deleteMember", id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
