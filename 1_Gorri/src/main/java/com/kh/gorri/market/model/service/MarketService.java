package com.kh.gorri.market.model.service;

import java.util.ArrayList;

import com.kh.gorri.board.model.vo.Attachment;
import com.kh.gorri.common.model.vo.PageInfo;
import com.kh.gorri.market.model.vo.Inquire;
import com.kh.gorri.market.model.vo.InquireReply;
import com.kh.gorri.market.model.vo.Pay;
import com.kh.gorri.market.model.vo.Product;
import com.kh.gorri.market.model.vo.Review;
import com.kh.gorri.member.model.vo.Member;

public interface MarketService {

	int getListCount(int i);

	Product getProductInfo(int bId);

	Member getSellerInfo(String seller);

	ArrayList<Inquire> ProductAllInquire(PageInfo pi, Integer productId);
	
	ArrayList<Inquire> ProductAllInquire(int productId);

	ArrayList<Review> ProductAllReview(PageInfo pi, Integer productId);
	
	ArrayList<Review> ProductAllReview(int productId);

	Review ProductOneReview(Integer productId, Integer reviewNo);

	Inquire ProductOneInquire(Integer productId, Integer inquireNo);

	ArrayList<InquireReply> ProductOneInquireReply(Integer productId, Integer inquireNo);

	int insertProduct(Product p);

	int insertProudctAttm(ArrayList<Attachment> list);
	
	ArrayList<Attachment> selectAttmList();

	ArrayList<Product> marketMainPage(PageInfo pi, int i, String category, String search, String seller, String all);

	int deleteProduct(int productId);

	int updateProduct(Product p);

	int addReply(String comment, Member m, String productNo, String inquireNo);

	ArrayList<Product> UserAllProduct(String id);

	int deleteProductAttm(int productId);

	int purchase(Pay pay);

	int insertInquire(Inquire inquire);
      
    ArrayList<Inquire> selectInquire(int productNo);

	ArrayList<Pay> selectPay(int productId);

	int insertReview(Review review);




	



}
