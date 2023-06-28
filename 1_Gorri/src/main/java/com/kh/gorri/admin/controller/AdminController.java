package com.kh.gorri.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.gorri.admin.model.exception.AdminException;
import com.kh.gorri.admin.model.service.AdminService;
import com.kh.gorri.board.model.vo.Board;
import com.kh.gorri.market.model.vo.Pay;
import com.kh.gorri.market.model.vo.Product;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService aService;
	
	@RequestMapping("adminMember.ad")
	public String adminMember() {
		return "adminMember";
	}
	
	@RequestMapping("adminContent.ad")
	public String adminContent(@ModelAttribute Board b, Model model) {
		ArrayList<Board> bList = new ArrayList<Board>();
		
		bList = aService.adminContent();
		
		System.out.println(bList);
		model.addAttribute("bList", bList);
		
		return "adminContent";
	}
	
	@RequestMapping(value="adminDeleteBoard.ad", produces="application/json; charset=UTF-8")
	@ResponseBody
	public void adminDeleteBoard(@RequestParam("boardNo") int boardNo) {
		int bResult = aService.adminDeleteBoard(boardNo);
		int aResult = aService.adminDeleteAttm(boardNo);
	}
	
	@RequestMapping("adminMarket.ad")
	public String adminMarket(Model model) {
		ArrayList<Pay> payList = aService.selectFive();
		ArrayList<Product> pList = aService.selectProductList();
		model.addAttribute("pList", pList);
		model.addAttribute("payList", payList);
		return "adminMarket";
	}
	
	@RequestMapping("deleteProduct.ad")
	public String deleteProduct(@RequestParam("productNo") int productNo, Model model) {
		int result = aService.deleteProduct(productNo);
		
		if(result > 0) {
			return "redirect:adminMarket.ad";
		} else {
			throw new AdminException("상품 삭제에 실패하였습니다.");
		}
	}
	
}
