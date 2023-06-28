package com.kh.gorri.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gorri.board.model.vo.Board;
import com.kh.gorri.market.model.vo.Pay;
import com.kh.gorri.market.model.vo.Product;

@Repository
public class AdminDAO {

	public ArrayList<Board> adminContent(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("adminMapper.adminContent");
	}

	public int adminDeleteBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.delete("adminMapper.adminDeleteBoard", boardNo);
	}

	public int adminDeleteAttm(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.delete("adminMapper.adminDeleteAttm", boardNo);
	}

	public ArrayList<Product> selectProductList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectProductList");
	}

	public ArrayList<Pay> selectFive(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectPay");
	}

	public int deleteProduct(SqlSessionTemplate sqlSession, int productNo) {
		return sqlSession.delete("adminMapper.deleteProduct", productNo);
	}

}
