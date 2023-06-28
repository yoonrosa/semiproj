package com.kh.gorri.market.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gorri.board.model.vo.Attachment;
import com.kh.gorri.common.model.vo.PageInfo;
import com.kh.gorri.market.model.vo.Inquire;
import com.kh.gorri.market.model.vo.InquireReply;
import com.kh.gorri.market.model.vo.Pay;
import com.kh.gorri.market.model.vo.Product;
import com.kh.gorri.market.model.vo.Review;
import com.kh.gorri.member.model.vo.Member;
	/**
	 *    Ͽ      DAO
	 * @author lee94
	 *
	 */
@Repository
public class MarketDAO {

	/**
	 *          ̼          Լ 2r  
	 * @param sqlSession
	 * @param i
	 * @return
	 */
	public int getListCount(SqlSessionTemplate sqlSession, int i) {
		return sqlSession.selectOne("marketMapper.getListCount", i);
	}

	public ArrayList<Product> marketMainPage(SqlSessionTemplate sqlSession, PageInfo pi,  int i, String category, String search, String seller, String all) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		Map<String, Object> parameterMap = new HashMap<>();
		parameterMap.put("category", category);
		parameterMap.put("search", search);
		parameterMap.put("i", i);
		parameterMap.put("all", all);
		parameterMap.put("search", search);
		return (ArrayList)sqlSession.selectList("marketMapper.marketMainPage", parameterMap, rowBounds);
	}
	
	public Product getProductInfo(SqlSessionTemplate sqlSession, int productId) {
		return sqlSession.selectOne("marketMapper.getProductInfo", productId);
	}

	public Member getSellerInfo(SqlSessionTemplate sqlSession, String seller) {
		return sqlSession.selectOne("marketMapper.getSellerInfo", seller);
	}

	public ArrayList<Inquire> ProductAllInquire(SqlSessionTemplate sqlSession, PageInfo pi, 
											 Integer productId) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("marketMapper.ProductAllInquire", productId, rowBounds);
	}

	public ArrayList<Review> ProductAllReview(SqlSessionTemplate sqlSession, PageInfo pi, 
										   Integer productId) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("marketMapper.ProductAllReview", productId, rowBounds);
	}

	public Review ProductOneReview(SqlSessionTemplate sqlSession, Integer productId, Integer reviewNo) {
		// TODO Auto-generated method stub
		Map<String, Object> parameterMap = new HashMap<>();
		parameterMap.put("productId", productId);
		parameterMap.put("reviewNo", reviewNo);
		return sqlSession.selectOne("marketMapper.ProductOneReview", parameterMap);
	}

	public Inquire ProductOneInquire(SqlSessionTemplate sqlSession, Integer productId, Integer inquireNo) {
		// TODO Auto-generated method stub
		Map<String, Object> parameterMap = new HashMap<>();
		parameterMap.put("productId", productId);
		parameterMap.put("inquireNo", inquireNo);
		
		
		return sqlSession.selectOne("marketMapper.ProductOneInquire", parameterMap);
	}

	public ArrayList<Inquire> ProductAllInquire(SqlSessionTemplate sqlSession, int productId) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("marketMapper.ProductAllInquire", productId);
	}

	public ArrayList<Review> ProductAllReview(SqlSessionTemplate sqlSession, int productId) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("marketMapper.ProductAllReview", productId);
	}

	public ArrayList<InquireReply> ProductOneInquireReply(SqlSessionTemplate sqlSession, Integer productId, Integer inquireNo) {
		// TODO Auto-generated method stub
		Map<String, Object> parameterMap = new HashMap<>();
		parameterMap.put("productId", productId);
		parameterMap.put("inquireNo", inquireNo);	
		return (ArrayList)sqlSession.selectList("marketMapper.ProductOneInquireReply", parameterMap);
	}

	public int insertproduct(SqlSessionTemplate sqlSession, Product p) {
		return sqlSession.insert("marketMapper.insertProduct",p);
	}

	public int insertProductAttm(SqlSessionTemplate sqlSession, ArrayList<Attachment> list) {
		
		System.out.println(list);
		return sqlSession.insert("marketMapper.insertProductAttm",list);
	}

	public ArrayList<Attachment> selectAttmList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("marketMapper.selectAttmList");
	}

	

	public int deleteProduct(SqlSessionTemplate sqlSession, int productId) {
		return sqlSession.delete("marketMapper.deleteProduct",productId);
	}

	public int updateProduct(SqlSessionTemplate sqlSession, Product p) {
		return sqlSession.update("marketMapper.updateProduct",p);
	}

	public int addReply(SqlSessionTemplate sqlSession, String comment, Member m, String productNo, String inquireNo) {
		String id = m.getUserId();
		Map<String, Object> parameterMap = new HashMap<>();
		parameterMap.put("comment", comment);
		parameterMap.put("id", id);
		parameterMap.put("productNo", productNo);
		parameterMap.put("inquireNo", inquireNo);
		return sqlSession.insert("marketMapper.addReply", parameterMap);
	}

	public ArrayList<Product> UserAllProduct(SqlSessionTemplate sqlSession, String id) {
		return (ArrayList)sqlSession.selectList("marketMapper.UserAllProduct", id);
	}

	public int deleteProductAttm(SqlSessionTemplate sqlSession, int productId) {
		return sqlSession.delete("marketMapper.deleteProductAttm",productId);
	}
	
	public int purchase(SqlSessionTemplate sqlSession, Pay pay) {
		Map<String, Object> parameterMap = new HashMap<>();
		parameterMap.put("originalId", pay.getOriginalId());
		parameterMap.put("paymentNo", pay.getPaymentNo());
		parameterMap.put("productNo", pay.getProductNo());
		parameterMap.put("buyerId", pay.getBuyerId());
		parameterMap.put("buyerName", pay.getBuyerName());
		parameterMap.put("buyerPhone", pay.getBuyerPhone());
		parameterMap.put("address", pay.getAddress());
		parameterMap.put("amount", pay.getAmount());
		parameterMap.put("paymentAmount", pay.getPaymentAmount());
		parameterMap.put("require", pay.getRequire());
		parameterMap.put("payDate", pay.getPayDate());

		return sqlSession.insert("marketMapper.purchase", parameterMap);
	}

	   public int insertInquire(SqlSessionTemplate sqlSession, Inquire inquire) {
	      return sqlSession.insert("marketMapper.insertInquire", inquire);
	   }

	   public ArrayList<Inquire> selectInquire(SqlSessionTemplate sqlSession, int productNo) {
	      return (ArrayList)sqlSession.selectList("marketMapper.selectInquire", productNo);
	   }

	public ArrayList<Pay> selectPay(SqlSessionTemplate sqlSession, int productId) {
		return (ArrayList)sqlSession.selectList("marketMapper.selectPay", productId);
	}

	public int insertReview(SqlSessionTemplate sqlSession, Review review) {
		return sqlSession.insert("marketMapper.insertReview", review);
	}

	
	
	
}
