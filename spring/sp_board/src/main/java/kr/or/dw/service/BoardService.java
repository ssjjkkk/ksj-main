package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.BoardVO;
import kr.or.dw.vo.MemberVO;

public interface BoardService {

	Map<String, Object> selectSearchBoardList(SearchCriteria cri) throws SQLException;

	void write(BoardVO board)throws SQLException;

	BoardVO selectBoard(int bno)throws SQLException;

	void modify(BoardVO board)throws SQLException;

	void remove(int bno)throws SQLException;
	
	
}
