package com.kh.gorri.hobby.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gorri.board.model.vo.Attachment;
import com.kh.gorri.board.model.vo.Board;

@Repository
public class HobbyDAO {

	public ArrayList<Board> hobbyCate(SqlSessionTemplate sqlSession, String category) {
		return (ArrayList)sqlSession.selectList("hobbyMapper.hobbyCate", category);
	}

	public ArrayList<Board> searchHobby(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return (ArrayList)sqlSession.selectList("hobbyMapper.searchHobby", map);
	}

	public ArrayList<Attachment> selectHobbyAttm(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("hobbyMapper.selectHobbyAttm");
	}

}
