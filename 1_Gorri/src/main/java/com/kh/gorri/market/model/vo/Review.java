package com.kh.gorri.market.model.vo;

import java.sql.Date;

/**
 * 이 클래스는, 구매 내역(PAY)를 위한 클래스입니다.
 *
 */

public class Review {
	/**
	 * erd와 순서 일치합니다.
	 * 순서대로 구매번호, 구매일자, 수량, 결제금액, 상품번호, 구매자아이디
	 */
	private int reviewNo;
	private String reviewContent;
	private Date reviewPostDate;
	private String buyerId;
	private int productNo;
	
	
	public Review() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Review(int reviewNo, String reviewContent, Date reviewPostDate, String buyerId, int productNo) {
		super();
		this.reviewNo = reviewNo;
		this.reviewContent = reviewContent;
		this.reviewPostDate = reviewPostDate;
		this.buyerId = buyerId;
		this.productNo = productNo;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public Date getReviewPostDate() {
		return reviewPostDate;
	}
	public void setReviewPostDate(Date reviewPostDate) {
		this.reviewPostDate = reviewPostDate;
	}
	public String getBuyerId() {
		return buyerId;
	}
	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", reviewContent=" + reviewContent + ", reviewPostDate="
				+ reviewPostDate + ", buyerId=" + buyerId + ", productNo=" + productNo + "]";
	}
	
	
}