package kr.or.dw.ranking.service;

import java.util.List;

import kr.or.dw.ranking.dao.IRankingDao;
import kr.or.dw.ranking.dao.RankingDaoImpl;
import kr.or.dw.ranking.vo.GameVO;

public class RankingServiceImpl implements IRankingService {

	private IRankingDao dao;
	private static RankingServiceImpl service;
		
	public static RankingServiceImpl getInstance() {
		if(service == null) service = new RankingServiceImpl();
		return service;
	}
	
	// 생성자
	private RankingServiceImpl() {
		dao = RankingDaoImpl.getInstance();
	}

	@Override
	public List<GameVO> selectGameList() {
		
		return dao.selectGameList();
	}

	@Override
	public List<GameVO> selectGameHList() {
		
		return dao.selectGameHList();
	}

	@Override
	public List<GameVO> selectGameJList() {
		// TODO Auto-generated method stub
		return dao.selectGameJList();
	}


}
