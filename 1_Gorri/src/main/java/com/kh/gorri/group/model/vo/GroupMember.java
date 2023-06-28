package com.kh.gorri.group.model.vo;

import java.sql.Date;

public class GroupMember {
	private String memberId;
	private String grade;
	private Date hireDate;
	private int membershipNo;
	private String status;
	
	public GroupMember() {}
	public GroupMember(String memberId, String grade, Date hireDate, int membershipNo, String status) {
		super();
		this.memberId = memberId;
		this.grade = grade;
		this.hireDate = hireDate;
		this.membershipNo = membershipNo;
		this.status = status;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public Date getHireDate() {
		return hireDate;
	}
	public void setHireDate(Date hireDate) {
		this.hireDate = hireDate;
	}
	public int getMembershipNo() {
		return membershipNo;
	}
	public void setMembershipNo(int membershipNo) {
		this.membershipNo = membershipNo;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "GroupMember [memberId=" + memberId + ", grade=" + grade + ", hireDate=" + hireDate + ", membershipNo="
				+ membershipNo + ", status=" + status + "]";
	}

	
}
