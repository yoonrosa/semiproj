package com.kh.gorri.market.model.vo;

import java.sql.Date;

public class Product {
	
	private int productNo;
	private String productName;
	private String productContent;
	private int productPrice;
	private Date productPostDate;
	private Date productModifyDate;
	private String productCategory;
	private String productSellerId;
	
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Product(int productNo, String productName, String productContent, int productPrice, Date productPostDate,
			Date productModifyDate, String productCategory, String productSellerId) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.productContent = productContent;
		this.productPrice = productPrice;
		this.productPostDate = productPostDate;
		this.productModifyDate = productModifyDate;
		this.productCategory = productCategory;
		this.productSellerId = productSellerId;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductContent() {
		return productContent;
	}
	public void setProductContent(String productContent) {
		this.productContent = productContent;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public Date getProductPostDate() {
		return productPostDate;
	}
	public void setProductPostDate(Date productPostDate) {
		this.productPostDate = productPostDate;
	}
	public Date getProductModifyDate() {
		return productModifyDate;
	}
	public void setProductModifyDate(Date productModifyDate) {
		this.productModifyDate = productModifyDate;
	}
	public String getProductCategory() {
		return productCategory;
	}
	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}
	public String getProductSellerId() {
		return productSellerId;
	}
	public void setProductSellerId(String productSellerId) {
		this.productSellerId = productSellerId;
	}
	
	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", productName=" + productName + ", productContent=" + productContent
				+ ", productPrice=" + productPrice + ", productPostDate=" + productPostDate + ", productModifyDate="
				+ productModifyDate + ", productCategory=" + productCategory + ", productSellerId=" + productSellerId
				+ "]";
	}
	
	
	
	
	
	
	
}
