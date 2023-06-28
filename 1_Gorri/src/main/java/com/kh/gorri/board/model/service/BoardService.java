package com.kh.gorri.board.model.service;

import java.util.ArrayList;

import com.kh.gorri.board.model.vo.Attachment;
import com.kh.gorri.board.model.vo.Board;
import com.kh.gorri.board.model.vo.Reply;
import com.kh.gorri.common.model.vo.PageInfo;

public interface BoardService {

	ArrayList<Board> selectBoardList(PageInfo pi);

	ArrayList<Attachment> selectAttmBoardList(Board b);

	int insertBoard(Board b);

	int insertAttm(ArrayList<Attachment> list);

	Board selectBoard(int bNo);

	ArrayList<Attachment> selectAttmBoard(int bNo);

	int deleteAttm(ArrayList<String> delRename);

	void updateAttmLevel(int boardNo);

	int updateBoard(Board b);

	int deleteBoard(int boardNo);

	int deleteBoardAttm(int boardNo);

	void insertReply(Reply r);

	ArrayList<Reply> selectReply(int boardNo);

	ArrayList<Board> selectUserBoardList(String userId);

	ArrayList<Attachment> selectUserAttmList(String userId);

	int deleteReply(Reply r);

	int updateReply(Reply r);

	int getListCount();

	int boardListCount(String userId);


}
