package com.kh.gorri.hobby.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.gorri.board.model.vo.Attachment;
import com.kh.gorri.board.model.vo.Board;
import com.kh.gorri.hobby.model.dao.HobbyDAO;

@Service
public class HobbyServiceImpl implements HobbyService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private HobbyDAO hDAO;
	
	@Override
	public ArrayList<Board> hobbyCate(String category) {
		return hDAO.hobbyCate(sqlSession, category);
	}
	
	@Override
	public ArrayList<Board> searchHobby(HashMap<String, String> map) {
		return hDAO.searchHobby(sqlSession, map);
	}
	
	@Override
	public ArrayList<Attachment> selectHobbyAttm() {
		return hDAO.selectHobbyAttm(sqlSession);
	}
}
