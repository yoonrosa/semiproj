package com.kh.gorri.board.model.DAO;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gorri.board.model.vo.Attachment;
import com.kh.gorri.board.model.vo.Board;
import com.kh.gorri.board.model.vo.Reply;
import com.kh.gorri.common.model.vo.PageInfo;

@Repository
public class BoardDAO {

	public ArrayList<Board> selectBoardList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectBoardList", rowBounds);
	}

	public Board selectBoard(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.selectOne("boardMapper.selectBoard", bNo);
	}
	
	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertBoard", b);
	}
	
	public ArrayList<Attachment> selectAttmBoardList(SqlSessionTemplate sqlSession, Board b) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectAttmBoardList", b);
	}

	public int insertAttm(SqlSessionTemplate sqlSession, ArrayList<Attachment> list) {
		
		
		return sqlSession.insert("boardMapper.insertAttm", list);
	}

	public ArrayList<Attachment> selectAttmBoard(SqlSessionTemplate sqlSession, int bNo) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectAttmBoard", bNo);
	}

	public int deleteAttm(SqlSessionTemplate sqlSession, ArrayList<String> delRename) {
		return sqlSession.delete("boardMapper.deleteAttm", delRename);
	}

	public void updateAttmLevel(SqlSessionTemplate sqlSession, int boardNo) {
		sqlSession.update("boardMapper.updateAttmLevel", boardNo);
	}

	public int updateBoard(SqlSessionTemplate sqlSession, Board b) {
		
		return sqlSession.update("boardMapper.updateBoard", b);
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.delete("boardMapper.deleteBoard", boardNo);
	}

	public int deleteBoardAttm(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.delete("boardMapper.deleteBoardAttm", boardNo);
	}

	public void insertReply(SqlSessionTemplate sqlSession, Reply r) {
		sqlSession.insert("boardMapper.insertReply", r);
	}

	public ArrayList<Reply> selectReply(SqlSessionTemplate sqlSession, int boardNo) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectReply", boardNo);
	}

	public ArrayList<Board> selectUserBoardList(SqlSessionTemplate sqlSession, String userId) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectUserBoardList", userId);
	}

	public ArrayList<Attachment> selectUserAttmList(SqlSessionTemplate sqlSession, String userId) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectUserAttmList", userId);
	}

	public int deleteReply(SqlSessionTemplate sqlSession, Reply r) {
		
		return sqlSession.delete("boardMapper.deleteReply", r);
	}

	public int updateReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.update("boardMapper.updateReply", r);
	}

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.getListCount");
	}

	public int boardListCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("boardMapper.boardListCount", userId);
	}

	

}
