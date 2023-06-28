package com.kh.gorri;

import java.util.ArrayList;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.gorri.board.model.vo.Board;
import com.kh.gorri.group.model.service.GroupService;
import com.kh.gorri.group.model.vo.Attachment;
import com.kh.gorri.group.model.vo.Group;
import com.kh.gorri.home.model.service.HomeService;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private GroupService gService;
	
	@Autowired
	private HomeService hoService;
	
	
	
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		ArrayList<Attachment> aList = gService.selectAttmGroupList();
		ArrayList<Group> gList = gService.getMainGroupList();

		
		ArrayList<Board> bList = hoService.hobbyBoardList();
		ArrayList<Attachment> hList = hoService.selectAttmBoardList();
		
		System.out.println(bList);
		System.out.println(gList);
		System.out.println(aList);
		
		model.addAttribute("bList", bList);
		model.addAttribute("gList", gList);
		model.addAttribute("aList", aList);
		model.addAttribute("hList", hList);
		
		return "gorriMain";
	}
	
}
