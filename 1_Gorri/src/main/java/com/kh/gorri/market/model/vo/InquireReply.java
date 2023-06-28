package com.kh.gorri.market.model.vo;

import java.sql.Date;

public class InquireReply {
	private int replyNo;
	private int inquireNo;
	private int productNo;
	private String replyContent;
	private String replyWriter;
	private Date replyCreateDate;
	private Date replyModifyDate;
	
	public InquireReply(int replyNo, int inquireNo, int productNo, String replyContent, String replyWriter,
			Date replyCreateDate, Date replyModifyDate) {
		super();
		this.replyNo = replyNo;
		this.inquireNo = inquireNo;
		this.productNo = productNo;
		this.replyContent = replyContent;
		this.replyWriter = replyWriter;
		this.replyCreateDate = replyCreateDate;
		this.replyModifyDate = replyModifyDate;
	}
	public InquireReply() {
		super();
	}
	@Override
	public String toString() {
		return "InquireReply [replyNo=" + replyNo + ", inquireNo=" + inquireNo + ", productNo=" + productNo
				+ ", replyContent=" + replyContent + ", replyWriter=" + replyWriter + ", replyCreateDate="
				+ replyCreateDate + ", replyModifyDate=" + replyModifyDate + "]";
	}
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public int getInquireNo() {
		return inquireNo;
	}
	public void setInquireNo(int inquireNo) {
		this.inquireNo = inquireNo;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public String getReplyWriter() {
		return replyWriter;
	}
	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}
	public Date getReplyCreateDate() {
		return replyCreateDate;
	}
	public void setReplyCreateDate(Date replyCreateDate) {
		this.replyCreateDate = replyCreateDate;
	}
	public Date getReplyModifyDate() {
		return replyModifyDate;
	}
	public void setReplyModifyDate(Date replyModifyDate) {
		this.replyModifyDate = replyModifyDate;
	}
	
	
	
	
	
	
	
}

