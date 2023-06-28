package com.kh.gorri.group.model.vo;

public class Group {
	private int membershipNo;
	private String membershipName;
	private String membershipContent;
	private int capacity;
	private String membershipStatus;
	private String hostPhone;
	private String category;
	private String hostId;
	
	public Group() {}

	public Group(int membershipNo, String membershipName, String membershipContent, int capacity,
			String membershipStatus, String hostPhone, String category, String hostId) {
		super();
		this.membershipNo = membershipNo;
		this.membershipName = membershipName;
		this.membershipContent = membershipContent;
		this.capacity = capacity;
		this.membershipStatus = membershipStatus;
		this.hostPhone = hostPhone;
		this.category = category;
		this.hostId = hostId;
	}

	public int getMembershipNo() {
		return membershipNo;
	}

	public void setMembershipNo(int membershipNo) {
		this.membershipNo = membershipNo;
	}

	public String getMembershipName() {
		return membershipName;
	}

	public void setMembershipName(String membershipName) {
		this.membershipName = membershipName;
	}

	public String getMembershipContent() {
		return membershipContent;
	}

	public void setMembershipContent(String membershipContent) {
		this.membershipContent = membershipContent;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public String getMembershipStatus() {
		return membershipStatus;
	}

	public void setMembership_status(String membershipStatus) {
		this.membershipStatus = membershipStatus;
	}

	public String getHostPhone() {
		return hostPhone;
	}

	public void setHostPhone(String hostPhone) {
		this.hostPhone = hostPhone;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getHostId() {
		return hostId;
	}

	public void setHostId(String hostId) {
		this.hostId = hostId;
	}

	@Override
	public String toString() {
		return "Group [membershipNo=" + membershipNo + ", membershipName=" + membershipName + ", membershipContent="
				+ membershipContent + ", capacity=" + capacity + ", membership_status=" + membershipStatus
				+ ", hostPhone=" + hostPhone + ", category=" + category + ", hostId=" + hostId + "]";
	}
	
	
	
	
}