package com.kh.gorri.home.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.gorri.board.model.vo.Board;
import com.kh.gorri.group.model.vo.Attachment;
import com.kh.gorri.home.model.DAO.HomeDAO;

@Service
public class HomeServiceImpl implements HomeService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private HomeDAO hoDAO;
	
	@Override
	public ArrayList<Board> hobbyBoardList() {
		return hoDAO.hobbyBoardList(sqlSession);
	}

	@Override
	public ArrayList<Attachment> selectAttmBoardList() {
		return hoDAO.selectAttmBoardList(sqlSession);
	}

}
