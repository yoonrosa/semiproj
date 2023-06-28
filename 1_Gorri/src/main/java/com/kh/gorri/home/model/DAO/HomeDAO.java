package com.kh.gorri.home.model.DAO;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gorri.board.model.vo.Board;
import com.kh.gorri.group.model.vo.Attachment;

@Repository
public class HomeDAO {

	public ArrayList<Board> hobbyBoardList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("homeMapper.hobbyBoardList");
	}

	public ArrayList<Attachment> selectAttmBoardList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("homeMapper.selectAttmBoard");
	}

}
