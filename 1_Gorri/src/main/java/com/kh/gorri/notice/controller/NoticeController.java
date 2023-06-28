package com.kh.gorri.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {
	
	
	@RequestMapping("noticeSelect.no")
	public String main() {
		return "noticeSelect";
	}
	
	@RequestMapping("boardWrite.no")
	public String boardWrite() {
		return "boardWrite";
	}
	
	@RequestMapping("detailBoardNoticeAdmin.no")
	public String detailBoardNoticeAdmin() {
		return "detailBoardNotice_Admin";
	}
	
	@RequestMapping("detailBoardNotice.no")
	public String detailBoardNotice() {
		return "detailBoardNotice";
	}
	
	@RequestMapping("updateWrite.no")
	public String updateWrite() {
		return "updateWrite";
	}
	
	
	
}
