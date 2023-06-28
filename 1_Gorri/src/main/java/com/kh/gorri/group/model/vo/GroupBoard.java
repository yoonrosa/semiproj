package com.kh.gorri.group.model.vo;

import java.sql.Date;

public class GroupBoard {
	int boardNo;
	String title;
	String content;
	Date postDate;
	Date modifyDate;
	String usersId;
	int groupNo;
	char status;
	
	
	public GroupBoard() {};
	
	public GroupBoard(int boardNo, String title, String content, Date postDate, Date modifyDate, String usersId,
			int groupNo, char status) {
		super();
		this.boardNo = boardNo;
		this.title = title;
		this.content = content;
		this.postDate = postDate;
		this.modifyDate = modifyDate;
		this.usersId = usersId;
		this.groupNo = groupNo;
		this.status = status;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public String getUsersId() {
		return usersId;
	}

	public void setUsersId(String usersId) {
		this.usersId = usersId;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "GroupBoard [boardNo=" + boardNo + ", title=" + title + ", content=" + content + ", postDate=" + postDate
				+ ", modifyDate=" + modifyDate + ", usersId=" + usersId + ", groupNo=" + groupNo + ", status=" + status
				+ "]";
	}
	
	
	
}


	









