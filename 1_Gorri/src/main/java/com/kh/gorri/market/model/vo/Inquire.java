package com.kh.gorri.market.model.vo;

import java.sql.Date;

public class Inquire {
	
	private int inquireNo;
	private String inquireContent;
	private Date inquirePostDate;
	private String buyerId;
	private int productNo;
	
	public Inquire() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Inquire(int inquireNo, String inquireContent, Date inquirePostDate, String buyerId, int productNo) {
		super();
		this.inquireNo = inquireNo;
		this.inquireContent = inquireContent;
		this.inquirePostDate = inquirePostDate;
		this.buyerId = buyerId;
		this.productNo = productNo;
	}
	public int getInquireNo() {
		return inquireNo;
	}
	public void setInquireNo(int inquireNo) {
		this.inquireNo = inquireNo;
	}
	public String getInquireContent() {
		return inquireContent;
	}
	public void setInquireContent(String inquireContent) {
		this.inquireContent = inquireContent;
	}
	public Date getInquirePostDate() {
		return inquirePostDate;
	}
	public void setInquirePostDate(Date inquirePostDate) {
		this.inquirePostDate = inquirePostDate;
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
		return "Inquire [inquireNo=" + inquireNo + ", inquireContent=" + inquireContent + ", inquirePostDate="
				+ inquirePostDate + ", buyerId=" + buyerId + ", productNo=" + productNo + "]";
	}
	
	
	
}