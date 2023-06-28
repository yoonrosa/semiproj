package com.kh.gorri.admin.model.service;

import java.util.ArrayList;

import com.kh.gorri.board.model.vo.Board;
import com.kh.gorri.market.model.vo.Pay;
import com.kh.gorri.market.model.vo.Product;

public interface AdminService {

	ArrayList<Board> adminContent();

	int adminDeleteBoard(int boardNo);

	int adminDeleteAttm(int boardNo);

	ArrayList<Product> selectProductList();

	ArrayList<Pay> selectFive();

	int deleteProduct(int productNo);

}
