package kr.or.dw.ranking.service;

import java.util.List;

import kr.or.dw.ranking.vo.GameVO;

public interface IRankingService {

	List<GameVO> selectGameList();

	List<GameVO> selectGameHList();

	List<GameVO> selectGameJList();



	

	


}
