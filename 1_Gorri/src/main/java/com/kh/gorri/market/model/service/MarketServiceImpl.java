package com.kh.gorri.market.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.gorri.board.model.vo.Attachment;
import com.kh.gorri.common.model.vo.PageInfo;
import com.kh.gorri.market.model.dao.MarketDAO;
import com.kh.gorri.market.model.vo.Inquire;
import com.kh.gorri.market.model.vo.InquireReply;
import com.kh.gorri.market.model.vo.Pay;
import com.kh.gorri.market.model.vo.Product;
import com.kh.gorri.market.model.vo.Review;
import com.kh.gorri.member.model.vo.Member;
	/**
	 * ���Ͽ����� ����. �߻�Ŭ���� ��ӹް���.
	 * 
	 * @author lee94
	 *
	 */
@Service
public class MarketServiceImpl implements MarketService {
		
		@Autowired
		private SqlSessionTemplate sqlSession;
		
		@Autowired
		private MarketDAO mDAO;
	
		@Override
		public int getListCount(int i) {
			return mDAO.getListCount(sqlSession, i);
		}

		@Override
		public Product getProductInfo(int productId) {
			return mDAO.getProductInfo(sqlSession,productId);
		}

		@Override
		public Member getSellerInfo(String seller) {
			return mDAO.getSellerInfo(sqlSession, seller);
		}

		@Override
		public ArrayList<Inquire> ProductAllInquire(PageInfo pi, Integer productId) {
			return mDAO.ProductAllInquire(sqlSession, pi, productId);
		}
		@Override
		public ArrayList<Review> ProductAllReview(PageInfo pi, Integer productId) {
			return mDAO.ProductAllReview(sqlSession, pi, productId);
		}
		@Override
		public Review ProductOneReview(Integer productId, Integer reviewNo) {
			return mDAO.ProductOneReview(sqlSession, productId, reviewNo);
		}
		@Override
		public Inquire ProductOneInquire(Integer productId, Integer inquireNo) {
			return mDAO.ProductOneInquire(sqlSession, productId, inquireNo);
		}
		@Override
		public ArrayList<Inquire> ProductAllInquire(int productId) {
			return mDAO.ProductAllInquire(sqlSession, productId);
		}
		@Override
		public ArrayList<Review> ProductAllReview(int productId) {
			return mDAO.ProductAllReview(sqlSession, productId);
		}
		@Override
		public ArrayList<InquireReply> ProductOneInquireReply(Integer productId, Integer inquireNo) {
			return mDAO.ProductOneInquireReply(sqlSession, productId, inquireNo);
		}
		@Override
		public int insertProduct(Product p) {
			return mDAO.insertproduct(sqlSession, p);
		}
		@Override
		public int insertProudctAttm(ArrayList<Attachment> list) {
			return mDAO.insertProductAttm(sqlSession, list);
		}
		@Override
		public ArrayList<Attachment> selectAttmList() {
			return mDAO.selectAttmList(sqlSession);
		}
		@Override
		public ArrayList<Product> marketMainPage(PageInfo pi, int i, String category, String search, String seller,
				String all) {
			return mDAO.marketMainPage(sqlSession,pi,i,category,search, seller, all);
		}
		@Override
		public int deleteProduct(int productId) {
			return mDAO.deleteProduct(sqlSession,productId);
		}
		@Override
		public int updateProduct(Product p) {
			return mDAO.updateProduct(sqlSession,p);
		}

		@Override
		public int addReply(String comment, Member m, String productNo, String inquireNo) {
			return mDAO.addReply(sqlSession, comment, m, productNo, inquireNo);
		}

		@Override
		public ArrayList<Product> UserAllProduct(String id) {
			return mDAO.UserAllProduct(sqlSession, id);
		}

		@Override
		public int deleteProductAttm(int productId) {
			return mDAO.deleteProductAttm(sqlSession, productId);
		}
		
		@Override
		public int purchase(Pay pay) {
			return mDAO.purchase(sqlSession, pay);
		}
		
	   @Override
	   public int insertInquire(Inquire inquire) {
         return mDAO.insertInquire(sqlSession, inquire);
	   }
	   
	   @Override
	   public ArrayList<Inquire> selectInquire(int productNo) {
	       return mDAO.selectInquire(sqlSession, productNo);
	   }

		@Override
		public ArrayList<Pay> selectPay(int productId) {
			return mDAO.selectPay(sqlSession, productId);
		}
		
		@Override
		public int insertReview(Review review) {
			return mDAO.insertReview(sqlSession, review);
		}

	
}