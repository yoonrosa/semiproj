package com.kh.gorri.hobby.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.gorri.board.model.vo.Attachment;
import com.kh.gorri.board.model.vo.Board;
import com.kh.gorri.hobby.model.exception.HobbyException;
import com.kh.gorri.hobby.model.service.HobbyService;

@Controller
public class HobbyController {
	
	@Autowired
	private HobbyService hService;
	
	
	// 취미 - 카테고리 클릭시
		@RequestMapping(value="hobbyCate.hb", produces="application/json; charset=UTF-8")
		@ResponseBody
		public ArrayList<Board> hobbyCate(HttpServletRequest request, Model model) {
			
			String category = request.getParameter("category"); // 카테고리 값 가져옴... -> 이거로 보드에서 카테고리 해당하는거 찾아야 ㅎ마
//			System.out.println("kk"+category);
			
			ArrayList<Board> catelist = hService.hobbyCate(category); // 카테고리에 해당하는 리스트.. 이거를 다시 화면에 나오게...
			System.out.println(catelist);
			
			model.addAttribute("aList", catelist);
			
			return catelist;
		}
		
		
		// 취미 - 검색
		@RequestMapping("searchHobby.hb")
		public String searchHobby(@RequestParam("searchCate") String searchCate, @RequestParam("searchWord") String searchWord, Model model, HttpServletRequest request) {
			
			System.out.println("카테고리" + searchCate);
			System.out.println("word" + searchWord);
			System.out.println(searchWord);
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("searchCate", searchCate);
			map.put("searchWord", searchWord);
			
			ArrayList<Board> searchHobbyList = hService.searchHobby(map);
			ArrayList<Attachment> hobbyAttm = hService.selectHobbyAttm();
			
			System.out.println(searchHobbyList);
			System.out.println(hobbyAttm);
			if(searchHobbyList != null) {
				model.addAttribute("bList", searchHobbyList);
				model.addAttribute("aList", hobbyAttm);
				
			} else {
				throw new HobbyException("취미 조회를 실패했습니다.");
			}
			return "hobbyMain";
		}
}
