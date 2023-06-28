package com.kh.gorri.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.gorri.board.model.DAO.BoardDAO;
import com.kh.gorri.board.model.vo.Attachment;
import com.kh.gorri.board.model.vo.Board;
import com.kh.gorri.board.model.vo.Reply;
import com.kh.gorri.common.model.vo.PageInfo;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BoardDAO bDAO;
	
	@Override
	public ArrayList<Board> selectBoardList(PageInfo pi) {
		return bDAO.selectBoardList(sqlSession, pi);
	}
	
	@Override
	public Board selectBoard(int bNo) {
		return bDAO.selectBoard(sqlSession, bNo);
	}
	
	@Override
	public int insertBoard(Board b) {
		return bDAO.insertBoard(sqlSession, b);
	}
	
	@Override
	public ArrayList<Attachment> selectAttmBoardList(Board b) {
		return bDAO.selectAttmBoardList(sqlSession, b);
	}
	
	@Override
	public ArrayList<Attachment> selectAttmBoard(int bNo) {
		return bDAO.selectAttmBoard(sqlSession, bNo);
	}
	
	@Override
	public int insertAttm(ArrayList<Attachment> list) {
		return bDAO.insertAttm(sqlSession, list);
	}
	
	@Override
	public int deleteAttm(ArrayList<String> delRename) {
		return bDAO.deleteAttm(sqlSession, delRename);
	}
	
	@Override
	public void updateAttmLevel(int boardNo) {
		bDAO.updateAttmLevel(sqlSession, boardNo);
	}
	
	@Override
	public int updateBoard(Board b) {
		return bDAO.updateBoard(sqlSession, b);
	}
	
	@Override
	public int deleteBoard(int boardNo) {
		return bDAO.deleteBoard(sqlSession, boardNo);
	}
	
	@Override
	public int deleteBoardAttm(int boardNo) {
		return bDAO.deleteBoardAttm(sqlSession, boardNo);
	}
	
	@Override
	public void insertReply(Reply r) {
		bDAO.insertReply(sqlSession, r);
	}
	
	@Override
	public ArrayList<Reply> selectReply(int boardNo) {
		return bDAO.selectReply(sqlSession, boardNo);
	}
	
	@Override
	public ArrayList<Board> selectUserBoardList(String userId) {
		return bDAO.selectUserBoardList(sqlSession, userId);
	}
	
	@Override
	public ArrayList<Attachment> selectUserAttmList(String userId) {
		return bDAO.selectUserAttmList(sqlSession, userId);
	}
	
	@Override
	public int deleteReply(Reply r) {
		return bDAO.deleteReply(sqlSession, r);
	}
	
	@Override
	public int updateReply(Reply r) {
		return bDAO.updateReply(sqlSession, r);
	}
	
	@Override
	public int getListCount() {
		return bDAO.getListCount(sqlSession);
	}
	
	@Override
	public int boardListCount(String userId) {
		return bDAO.boardListCount(sqlSession, userId);
	}
}
