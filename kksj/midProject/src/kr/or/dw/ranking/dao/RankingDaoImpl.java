package kr.or.dw.ranking.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.dw.ranking.vo.GameVO;
import kr.or.dw.util.BuildSqlMapClient;

public class RankingDaoImpl implements IRankingDao{
	
	private static RankingDaoImpl dao;
	private SqlMapClient client;
	
	private RankingDaoImpl() {
		client = BuildSqlMapClient.getSqlMapClient();
	}
	
	public static RankingDaoImpl getInstance() {
		if(dao == null) dao = new RankingDaoImpl();
		return dao;
	}

	@Override
	public List<GameVO> selectGameList() {
		List<GameVO> gameList = null;
		
		try {
			gameList = client.queryForList("ranking.selectGameList");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return gameList;
	}

	   @Override
	   public List<GameVO> selectGameHList() {
	      List<GameVO> gameHList = null;
	      
	      try {
	         gameHList = client.queryForList("ranking.selectGameHList");
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	      
	      return gameHList;
	   }

	   @Override
	   public List<GameVO> selectGameJList() {
	      List<GameVO> gameJList = null;
	      
	      try {
	         gameJList = client.queryForList("ranking.selectGameJList");
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	      
	      return gameJList;
	   }



}
