package com.kh.gorri.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.gorri.admin.model.dao.AdminDAO;
import com.kh.gorri.board.model.vo.Board;
import com.kh.gorri.market.model.vo.Pay;
import com.kh.gorri.market.model.vo.Product;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AdminDAO aDAO;
	
	@Override
	public ArrayList<Board> adminContent() {
		return aDAO.adminContent(sqlSession);
	}
	
	@Override
	public int adminDeleteBoard(int boardNo) {
		return aDAO.adminDeleteBoard(sqlSession, boardNo);
	}
	
	@Override
	public int adminDeleteAttm(int boardNo) {
		return aDAO.adminDeleteAttm(sqlSession, boardNo);
	}

	@Override
	public ArrayList<Product> selectProductList() {
		return aDAO.selectProductList(sqlSession);
	}

	@Override
	public ArrayList<Pay> selectFive() {
		return aDAO.selectFive(sqlSession);
	}

	@Override
	public int deleteProduct(int productNo) {
		return aDAO.deleteProduct(sqlSession, productNo);
	}
}
