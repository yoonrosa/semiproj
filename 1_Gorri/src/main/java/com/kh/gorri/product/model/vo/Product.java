package com.kh.gorri.product.model.vo;

import java.sql.Date;

public class Product {
	private int productNo;
	private String proName;
	private String proContent;
	private int price;
	private Date postDate;
	private Date modifyDate;
	private String category;
	private String sellerId;
	
	public Product() {}

	public Product(int productNo, String proName, String proContent, int price, Date postDate, Date modifyDate,
			String category, String sellerId) {
		super();
		this.productNo = productNo;
		this.proName = proName;
		this.proContent = proContent;
		this.price = price;
		this.postDate = postDate;
		this.modifyDate = modifyDate;
		this.category = category;
		this.sellerId = sellerId;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public String getProContent() {
		return proContent;
	}

	public void setProContent(String proContent) {
		this.proContent = proContent;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSellerId() {
		return sellerId;
	}

	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}

	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", proName=" + proName + ", proContent=" + proContent + ", price="
				+ price + ", postDate=" + postDate + ", modifyDate=" + modifyDate + ", category=" + category
				+ ", sellerId=" + sellerId + "]";
	}
}
