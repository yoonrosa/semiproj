package com.kh.gorri.market.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.gorri.board.model.vo.Attachment;
import com.kh.gorri.common.Pagination;
import com.kh.gorri.common.model.vo.PageInfo;
import com.kh.gorri.market.model.exception.MarketException;
import com.kh.gorri.market.model.service.MarketService;
import com.kh.gorri.market.model.vo.Inquire;
import com.kh.gorri.market.model.vo.InquireReply;
import com.kh.gorri.market.model.vo.Pay;
import com.kh.gorri.market.model.vo.Product;
import com.kh.gorri.market.model.vo.Review;
import com.kh.gorri.member.model.vo.Member;

@Controller
public class MarketController {

	@Autowired
	private MarketService mService;
	
	/**
	 * 마켓 메인페이지로 넘어가는 메소드
	 * marketMainPage.jsp로 이동
	 * 
	 * 기본적으로 모든 상품을 보여주게끔 하고,
	 * 필요시 쿼리스트링으로 전달받은 값을 통해 그쪽으로 넘김.
	 * 필요시 아래와 같은 것을 넘김.
	 * @param currentPage
	 * @param category
	 * @param search
	 * @param model
	 * @return
	 */

	
	@RequestMapping("MainPage.market")
	public String marketMainPage(@RequestParam(value = "page", required = false) Integer currentPage,
								 @RequestParam(value = "category", required = false) String category,
								 @RequestParam(value = "search", required = false) String search,
								 @RequestParam(value = "seller", required = false) String seller,
								 @RequestParam(value = "all", required = false) String all,
								 Model model) {
		//기본 페이지로 1을 설정
		if(currentPage == null) {
			currentPage = 1;
		}
		int listCount = mService.getListCount(1);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		//카테고리가 비어있거나 원하는 것이 아니라면, 잘못된 접근하도록.
		if(category == null || category.equals("예술") || category.equals("운동") || 
				category.equals("음식") || category.equals("여행") || 
				category.equals("창작") || category.equals("자기계발")) {
		
			ArrayList<Product> plist = mService.marketMainPage(pi, 1, category, search, seller, all);
			ArrayList<Attachment> alist = mService.selectAttmList();
			if(plist !=null) {
				//잘 가져왔을 때.
				model.addAttribute("pi", pi);
				model.addAttribute("plist", plist);
				model.addAttribute("alist", alist);
				return "marketMainPage";
			} else {
				throw new MarketException("게시글 조회 실패");
			}
		}else {
			throw new MarketException("URL 잘못 입력 : 카테고리에" + category + "라고 입력했습니다. 지정된 카테고리로만 검색 가능합니다.");
		}
	}

	@RequestMapping("InquireBoard.market")
	public String ProductAllInquire(@RequestParam(value = "page", required = false) Integer currentPage,
								 @RequestParam(value = "productId") Integer productId,
								 Model model) {
		
		if(currentPage == null) {
			currentPage = 1;
		}
		
		int listCount = mService.getListCount(1);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 9);
		
		Product p = mService.getProductInfo(productId);
		ArrayList<Inquire> list = mService.ProductAllInquire(pi, productId);		
		
		if(list !=null) {
			//잘 가져왔을 때.
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
			model.addAttribute("p", p);

			return "marketInquireBoard";
		} else {
			throw new MarketException("게시글 조회 실패");
		}
	}
	
	
	@RequestMapping("ReviewBoard.market")
	public String ProductAllReview(@RequestParam(value = "page", required = false) Integer currentPage,
			@RequestParam(value = "productId", required=false) Integer productId,
			Model model) {
		
		System.out.println("ProductAllReview 작동");
		if(currentPage == null) {
			currentPage = 1;
		}
		
		int listCount = mService.getListCount(1);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 9);
		
		
		Product p = mService.getProductInfo(productId);
		ArrayList<Review> list = mService.ProductAllReview(pi, productId);
		
		
		
		if(list !=null) {
			//잘 가져왔을 때.
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
			model.addAttribute("p", p);
			return "marketReviewBoard";
		} else {
			throw new MarketException("게시글 조회 실패");
		}
	}
	
	@RequestMapping("ProductReview.market")
	public ModelAndView ProductOneReview(@RequestParam(value = "productId") Integer productId,
								   		 @RequestParam("reviewNo") Integer reviewNo,
								   		 ModelAndView mv) {
		
		Review r = mService.ProductOneReview(productId, reviewNo);
		
		if(r != null) {
			mv.addObject("r", r);
			mv.setViewName("marketReview");
			return mv;
		} else {
			throw new MarketException("리뷰 상세보기를 실패하였습니다.");
		}
	}
	
	/*
	 * 한 리뷰의 상세페이지로
	 * marketInquireDetail.jsp로 이동
	 * 
	 * @param productId
	 * @param inquireNo
	 * @param mv
	 * @return
	 */
	@RequestMapping("ProductInquire.market")
	public ModelAndView ProductOneInquire(@RequestParam(value = "productId") Integer productId,
			@RequestParam("inquireNo") Integer inquireNo,
			ModelAndView mv) {
		System.out.println("ProductInquire 작동");
		Inquire i = mService.ProductOneInquire(productId, inquireNo);
		ArrayList<InquireReply> irList = mService.ProductOneInquireReply(productId,inquireNo);
		System.out.println("irList : " + irList);
		System.out.println("i : " + i);
		if(i != null) {
			mv.addObject("i", i);
			mv.addObject("irList", irList);
			mv.setViewName("marketInquireDetail");
			return mv;
		} else {
			throw new MarketException("리뷰 상세보기를 실패하였습니다.");
		}
	}
	
	/**
		 * 게시물의 상세페이지로 넘어감.
	 * marketProduct.jsp로 이동
	 * @param session
	 * @param mv
	 * @param productId
	 * @param page
	 * @return
	 */
	@RequestMapping("Product.market")
	public ModelAndView marketProduct(HttpSession session,
											ModelAndView mv,
											@RequestParam("productId") int productId,	//상품번호(productId)
											@RequestParam(value="page", required=false) Integer page) {
		
		if(page == null) {
			page = 1;
		}
		
		Member m = (Member)session.getAttribute("loginUser");	//지금 로그인한 놈 객체 만드는 함수
		//지금 당장은 필요없지만, 나중에 쓰일스도 있어서 만들어놓음.
		
		Product p = mService.getProductInfo(productId);
		System.out.println(p);
		ArrayList<Attachment> alist = mService.selectAttmList();

	
		//1. 문의
		ArrayList<Inquire> productInq = mService.ProductAllInquire(productId);
		
		//2. 후기
		ArrayList<Pay> pay = mService.selectPay(productId);
		System.out.println(pay);
		ArrayList<Review> productReview = mService.ProductAllReview(productId);
		System.out.println(productReview);
		
		
		mv.addObject("p", p);
		mv.addObject("page", page);
		mv.addObject("alist", alist);
		mv.addObject("seller", m);
		mv.addObject("productInq", productInq);
		mv.addObject("productReview", productReview);
		mv.addObject("pay", pay);
		mv.setViewName("marketProduct");	//어느 jsp로 보내는지에 대한 것

		return mv;
	}

	
	/* 
	 * 유저가 등록한 상품 게시판으로 이동합니다.
	 * marketMyProductBoard.jsp로 이동ㄴ
	 * @param session
	 * @param mv
	 * @return
	 */
	@GetMapping("MyProductBoard.market")
	public ModelAndView marketMyProductBoard(HttpSession session,
									   ModelAndView mv) {
		
		System.out.println("marketMyProductBoard 실행");
		String id = ((Member)session.getAttribute("loginUser")).getUserId();
		ArrayList<Product> list = mService.UserAllProduct(id);
		
		ArrayList<Attachment> alist = mService.selectAttmList();
		
		
		if(id != null) {
			mv.addObject("list", list);
			mv.addObject("aList", alist);
			mv.setViewName("marketMyProductBoard");
			return mv;
		} else {
			throw new MarketException("내가 등록한 상품 조회를 실패하였습니다.");
		}	
	}
	
	/*
	 * 마켓 메인페이지에서 상품 등록 버튼 누르면
	 * 상품 등록하는 게시글 뜹니다.
	 */
	@RequestMapping("Register.market")
	public String marketRegister() {
		return "marketRegister";
	}
	
	/**
	 * 남이 등록한 게시물에서, 구매하기 누르면
	 * 구매창으로 넘어가게 함. 
	 */
	@RequestMapping("BuyingPage.market")
	public ModelAndView marketBuyingPage(@RequestParam("productId") int productId,
											HttpSession session,
											ModelAndView mv
											) {
		System.out.println("marketBuyingPage 실행");
		//상품정보 가져와서 넘겨라. 멤버정보도 javascript에 필요하므로 넘긴다.
		Product p = mService.getProductInfo(productId);
		ArrayList<Attachment> proAttm = mService.selectAttmList();
		Member m = (Member)session.getAttribute("loginUser");
		
		mv.addObject("p", p);
		mv.addObject("m", m);
		mv.addObject("proAttm", proAttm);
		mv.setViewName("marketBuyingPage");
		return mv;
	}
	/**
	 * 댓글을 작성하는 코드입니다.
	 * @param session
	 * @param comment
	 * @param productNo
	 * @param inquireNo
	 * @param mv
	 * @return
	 */
	@PostMapping("ReplySubmit.market")
	public String marketMyProductBoard(HttpSession session, 
											    @RequestParam("comment") String comment, 
											    @RequestParam("productNo") String productNo, 
											    @RequestParam("inquireNo") String inquireNo, 
											    Model model) {

	  //TODO 완성해야합니다.
	  System.out.println("Received comment: " + comment);
	  System.out.println(productNo);
	  System.out.println(inquireNo);
	  System.out.println(session);

	  Member m = (Member)session.getAttribute("loginUser");
	  int result = mService.addReply(comment, m, productNo, inquireNo);
	  

	  return "redirect:ProductInquire.market?productId=" + Objects.toString(productNo, "") + "&inquireNo=" + Objects.toString(inquireNo, "");
	}
	// 파일 저장소 지정
		public String[] saveFile(MultipartFile file, HttpServletRequest request) {
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "\\uploadFiles";
			File folder = new File(savePath);
			if(!folder.exists()) {
				folder.mkdirs();
			}
			
			//파일 이름 변경 형식 지정
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
			int ranNum = (int)(Math.random()*100000);
			String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + ranNum + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			
			// 변경된 파일 이름 저장
			String renamePath = folder + "\\" + renameFileName;
			try {
				file.transferTo(new File(renamePath));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			String[] returnArr = new String[2];
			returnArr[0] = savePath;
			returnArr[1] = renameFileName;
			
			return returnArr;
		}
			
		public void deleteFile(String fileName, HttpServletRequest request) {
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "\\uploadFiles";
			
			File f = new File(savePath + "\\" + fileName);
			if(f.exists()) {
				f.delete();
			}
		}
			
		
		// 상품 등록
		@PostMapping("insertProduct.market")
		public String insertProduct(@ModelAttribute Product p, HttpSession session,
									HttpServletRequest request, @RequestParam("file") ArrayList<MultipartFile> files) {
			
			ArrayList<Attachment> list = new ArrayList<>();
			String id = ((Member)session.getAttribute("loginUser")).getUserId();
			for(int i = 0; i < files.size(); i ++) {
				MultipartFile upload = files.get(i);
				if(upload != null && !upload.isEmpty()) {
					String[] returnArr = saveFile(upload, request);
					if(returnArr[1] != null) {
						Attachment a = new Attachment();

						a.setSavePath(returnArr[0]);
						a.setOriginalName(upload.getOriginalFilename());
						a.setRenameName(returnArr[1]);
						a.setBoardType("마켓");
						a.setUsersId(id);
						list.add(a);
					}
				}
			}
				
			for(int i = 0; i < list.size(); i++) {
				Attachment a = list.get(i);
				if(i == 0) {
					a.setAttmLevel(0);
				} else {
					a.setAttmLevel(1);
				}
			}
			
			System.out.println(list);
			p.setProductSellerId(id);
			int result1 = mService.insertProduct(p);
			int result2 = mService.insertProudctAttm(list);
			
				
			if(result1 + result2 == list.size()+1) {
				if(result2 == 0) {
					return "redirect:Mainpage.market";
				}else {
					return "redirect:MainPage.market";
				}
			} else {
				for(Attachment a : list) {
					deleteFile(a.getRenameName(), request);
				}
				throw new MarketException("상품 등록을 실패했습니다.");
			}	
		}
			
			
		@RequestMapping("updateproduct.market")				
		public String updateproduct(@RequestParam(value = "productId") Integer productId,
									 Model model) { 
			Product p = mService.getProductInfo(productId);
			model.addAttribute("p",p);
			return "marketUpdate";
		}
		
		@RequestMapping("updateMyProduct.market")
		public String updateMyProduct(@RequestParam(value="productId") Integer productId,
									@ModelAttribute Product updateProduct, HttpSession session) {
									
			String id = ((Member)session.getAttribute("loginUser")).getUserId();
			updateProduct.setProductNo(productId);
			updateProduct.setProductSellerId(id);
			int result = mService.updateProduct(updateProduct);
			if (result > 0) {
				return "redirect:MainPage.market";
			} else {
				throw new MarketException("게시글 수정을 실패했습니다.");
			}
		}
		
		
		
		@RequestMapping("deleteProduct.market")
		public String deleteProduct(@RequestParam(value = "productId")String encode) {
			
			Decoder decoder = Base64.getDecoder();
			byte[] byteArr = decoder.decode(encode);
			String decode = new String(byteArr);
			int productId = Integer.parseInt(decode);
			
			int result = 0;
			int result1 = mService.deleteProduct(productId);
			int result2 = mService.deleteProductAttm(productId);
			result = result1 + result2;
			if(result > 0 ){
				return "redirect:MainPage.market";
			} else {
				throw new MarketException("게시글 삭제를 실패하였습니다.");
			}
		}
		

	      
	      //마켓 문의 등록 
	       @RequestMapping(value="insertInquire.market", produces="application/json; charset=UTF-8")
	         public void insertInquire(Inquire inquire, HttpSession session, @RequestParam("inquireContent") String inquireContent, 
	                                 @RequestParam("productNo") int productNo, HttpServletResponse response) {
//	            
	          Member m = (Member)session.getAttribute("loginUser");
	          
	          inquire.setProductNo(productNo);
	          inquire.setInquireContent(inquireContent);
	          inquire.setBuyerId(m.getUserId());
	          
	          int result = mService.insertInquire(inquire);
	         }
	       
	       //상품 문의 조회 
	       @RequestMapping(value="selectInquire.market", produces="application/json; charset=UTF-8")
	         public void selectInquire(Inquire inquire, @RequestParam("productNo") int productNo, HttpServletResponse response) {
	          ArrayList<Inquire> iq = mService.selectInquire(productNo);
	          
	            response.setContentType("application/json; charset=UTF-8");
	            GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy-MM-dd"); 
	            Gson gson = gb.create();
	            try {
	               gson.toJson(iq, response.getWriter()); 
	            } catch (JsonIOException | IOException e) {
	               e.printStackTrace();
	            }
	                 
	         }
	       
	       // 상품 후기 등록
	       @RequestMapping(value="insertReview.market")
	       @ResponseBody
	       public String insertReview(@ModelAttribute Review review, @RequestParam("productNo") int productNo, @RequestParam("reviewContent") String reviewContent, HttpSession session, HttpServletResponse response) {
	    	   Member m = (Member)session.getAttribute("loginUser");
	    	   
	    	   review.setProductNo(productNo);
	    	   review.setReviewContent(reviewContent);
	    	   review.setBuyerId(m.getUserId());
	    	   
	    	   int result = mService.insertReview(review);
	    	   if(result>0) {
	    		   return "yes";
	    	   } else {
	    		   return "no";
	    	   }
	    	   
	       }
	   
	       // 상품 후기 조회
	       @RequestMapping(value="selectReview.market", produces="application/json; charset=UTF-8")
	       public void selectReview(@ModelAttribute Review review, @RequestParam("productNo") int productNo, HttpServletResponse response) {
	    	  ArrayList<Review> reList = mService.ProductAllReview(productNo);
	    	  
	    	  response.setContentType("application/json; charset=UTF-8");
	    	  GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy-MM-dd");
	    	  Gson gson = gb.create();
	    	  
	    	  try {
				gson.toJson(reList, response.getWriter());
			} catch (JsonIOException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	       }
		
		
		
		
	
}
