package com.kh.gorri.member.model.vo;

import java.sql.Date;

public class Member {
	private String userId;
	private String userPwd;
	private String pwdQ;
	private String pwdHint;
	private String userName;
	private String address;
	private int wallet;
	private Date enrollDate;
	private String phone;
	private String nickName;
	private String myIntro;
	private String status;
	private String isAdmin;
	
	public Member() {}

	public Member(String userId, String userPwd, String pwdQ, String pwdHint, String userName, String address,
			int wallet, Date enrollDate, String phone, String nickName, String myIntro, String status, String isAdmin) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.pwdQ = pwdQ;
		this.pwdHint = pwdHint;
		this.userName = userName;
		this.address = address;
		this.wallet = wallet;
		this.enrollDate = enrollDate;
		this.phone = phone;
		this.nickName = nickName;
		this.myIntro = myIntro;
		this.status = status;
		this.isAdmin = isAdmin;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getPwdQ() {
		return pwdQ;
	}

	public void setPwdQ(String pwdQ) {
		this.pwdQ = pwdQ;
	}

	public String getPwdHint() {
		return pwdHint;
	}

	public void setPwdHint(String pwdHint) {
		this.pwdHint = pwdHint;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getWallet() {
		return wallet;
	}

	public void setWallet(int wallet) {
		this.wallet = wallet;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getMyIntro() {
		return myIntro;
	}

	public void setMyIntro(String myIntro) {
		this.myIntro = myIntro;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
	}

	@Override
	public String toString() {
		return "Member [userId=" + userId + ", userPwd=" + userPwd + ", pwdQ=" + pwdQ + ", pwdHint=" + pwdHint
				+ ", userName=" + userName + ", address=" + address + ", wallet=" + wallet + ", enrollDate="
				+ enrollDate + ", phone=" + phone + ", nickName=" + nickName + ", myIntro=" + myIntro + ", status="
				+ status + ", isAdmin=" + isAdmin + "]";
	}
	
	
}
