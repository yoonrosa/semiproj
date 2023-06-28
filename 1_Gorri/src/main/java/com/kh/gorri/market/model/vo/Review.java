package com.kh.gorri.market.model.vo;

import java.sql.Date;

/**
 * �� Ŭ������, ���� ����(PAY)�� ���� Ŭ�����Դϴ�.
 *
 */

public class Review {
	/**
	 * erd�� ���� ��ġ�մϴ�.
	 * ������� ���Ź�ȣ, ��������, ����, �����ݾ�, ��ǰ��ȣ, �����ھ��̵�
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