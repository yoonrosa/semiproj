package com.kh.gorri.market.model.vo;

import java.sql.Date;

public class Delivery {
	
	private int deliveryNo;
	private Date deliveryDate;
	private String deliveryStatus;
	private int paymentNo;
	
	
	public Delivery() {
		super();
	}
	public Delivery(int deliveryNo, Date deliveryDate, String deliveryStatus, int paymentNo) {
		super();
		this.deliveryNo = deliveryNo;
		this.deliveryDate = deliveryDate;
		this.deliveryStatus = deliveryStatus;
		this.paymentNo = paymentNo;
	}
	public int getDeliveryNo() {
		return deliveryNo;
	}
	public void setDeliveryNo(int deliveryNo) {
		this.deliveryNo = deliveryNo;
	}
	public Date getDeliveryDate() {
		return deliveryDate;
	}
	public void setDeliveryDate(Date deliveryDate) {
		this.deliveryDate = deliveryDate;
	}
	public String getDeliveryStatus() {
		return deliveryStatus;
	}
	public void setDeliveryStatus(String deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}
	public int getPaymentNo() {
		return paymentNo;
	}
	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
	}
	@Override
	public String toString() {
		return "Delivery [deliveryNo=" + deliveryNo + ", deliveryDate=" + deliveryDate + ", deliveryStatus="
				+ deliveryStatus + ", paymentNo=" + paymentNo + "]";
	}
	
	
}