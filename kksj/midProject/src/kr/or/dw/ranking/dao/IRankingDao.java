package kr.or.dw.ranking.dao;

import java.util.List;

import kr.or.dw.ranking.vo.GameVO;

public interface IRankingDao {

	List<GameVO> selectGameList();

	List<GameVO> selectGameHList();

	List<GameVO> selectGameJList();

	
}
