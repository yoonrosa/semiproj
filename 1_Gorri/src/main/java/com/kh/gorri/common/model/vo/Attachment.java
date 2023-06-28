package com.kh.gorri.common.model.vo;

public class Attachment {
	private int attmId;
	private String savePath;
	private String originalName;
	private String renameName;
	private String boardType;
	private int boardNo;
	private int attmLevel;
	private String usersId;
	
	public Attachment() {
	}

	public Attachment(int attmId, String savePath, String originalName, String renameName, String boardType,
			int boardNo, int attmLevel, String usersId) {
		super();
		this.attmId = attmId;
		this.savePath = savePath;
		this.originalName = originalName;
		this.renameName = renameName;
		this.boardType = boardType;
		this.boardNo = boardNo;
		this.attmLevel = attmLevel;
		this.usersId = usersId;
	}

	public int getAttmId() {
		return attmId;
	}

	public void setAttmId(int attmId) {
		this.attmId = attmId;
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

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getAttmLevel() {
		return attmLevel;
	}

	public void setAttmLevel(int attmLevel) {
		this.attmLevel = attmLevel;
	}

	public String getUsersId() {
		return usersId;
	}

	public void setUsersId(String usersId) {
		this.usersId = usersId;
	}

	@Override
	public String toString() {
		return "Attachment [attmId=" + attmId + ", savePath=" + savePath + ", originalName=" + originalName
				+ ", renameName=" + renameName + ", boardType=" + boardType + ", boardNo=" + boardNo + ", attmLevel="
				+ attmLevel + ", usersId=" + usersId + "]";
	}
	
	
	
}
