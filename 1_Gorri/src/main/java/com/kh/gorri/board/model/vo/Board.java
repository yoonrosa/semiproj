package com.kh.gorri.board.model.vo;

import java.sql.Date;

public class Board {
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private String isPublic;
	private String status;
	private Date postdate;
	private Date modifydate;
	private String usersId;
	private String category;
	private String savePath;
	private String originalName;
	private String renameName;
	private String boardType;
	private int attmLevel;
	private String nickName;

	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	public String getNickName() {
		return nickName;
	}



	public void setNickName(String nickName) {
		this.nickName = nickName;
	}



	public Board(int boardNo, String boardTitle, String boardContent, String isPublic, String status, Date postdate,
			Date modifydate, String usersId, String category, String savePath, String originalName, String renameName,
			String boardType, int attmLevel, String nickName) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.isPublic = isPublic;
		this.status = status;
		this.postdate = postdate;
		this.modifydate = modifydate;
		this.usersId = usersId;
		this.category = category;
		this.savePath = savePath;
		this.originalName = originalName;
		this.renameName = renameName;
		this.boardType = boardType;
		this.attmLevel = attmLevel;
		this.nickName = nickName;
	}



	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getIsPublic() {
		return isPublic;
	}

	public void setIsPublic(String isPublic) {
		this.isPublic = isPublic;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getPostdate() {
		return postdate;
	}

	public void setPostdate(Date postdate) {
		this.postdate = postdate;
	}

	public Date getModifydate() {
		return modifydate;
	}

	public void setModifydate(Date modifydate) {
		this.modifydate = modifydate;
	}

	public String getUsersId() {
		return usersId;
	}

	public void setUsersId(String usersId) {
		this.usersId = usersId;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSavePath() {
		return savePath;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	public String getOriginalName() {
		return originalName;
	}

	public void setOriginalName(String originalName) {
		this.originalName = originalName;
	}

	public String getRenameName() {
		return renameName;
	}

	public void setRenameName(String renameName) {
		this.renameName = renameName;
	}

	public String getBoardType() {
		return boardType;
	}

	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}

	public int getAttmLevel() {
		return attmLevel;
	}

	public void setAttmLevel(int attmLevel) {
		this.attmLevel = attmLevel;
	}



	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", isPublic=" + isPublic + ", status=" + status + ", postdate=" + postdate + ", modifydate="
				+ modifydate + ", usersId=" + usersId + ", category=" + category + ", savePath=" + savePath
				+ ", originalName=" + originalName + ", renameName=" + renameName + ", boardType=" + boardType
				+ ", attmLevel=" + attmLevel + ", nickName=" + nickName + "]";
	}

	
	
}
