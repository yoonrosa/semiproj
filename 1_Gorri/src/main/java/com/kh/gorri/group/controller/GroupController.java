package com.kh.gorri.group.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.gorri.common.Pagination;
import com.kh.gorri.common.model.vo.PageInfo;
import com.kh.gorri.group.model.exception.GroupException;
import com.kh.gorri.group.model.service.GroupService;
import com.kh.gorri.group.model.vo.Attachment;
import com.kh.gorri.group.model.vo.Calendar;
import com.kh.gorri.group.model.vo.Group;
import com.kh.gorri.group.model.vo.GroupBoard;
import com.kh.gorri.group.model.vo.GroupBoardReply;
import com.kh.gorri.group.model.vo.GroupMember;
import com.kh.gorri.member.model.vo.Member;

@Controller
public class GroupController {
	
	@Autowired
	private GroupService gService;
	
	@RequestMapping("groupMain.gr")
	public String groupMain(@RequestParam(value="page", required=false) Integer page, Model model) {

		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = gService.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 9);
		
		ArrayList<Group> gList = gService.selectGroupList(pi);
		ArrayList<Attachment> gAttm = gService.selectAttmGroupList();
		
		
		if(gList != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("gList", gList);
			model.addAttribute("gAttm", gAttm);
			
		} else {
			throw new GroupException("모임 조회를 실패했습니다.");
		}
		
		
		return "groupMain3";
	}
	
	
	@RequestMapping(value="groupDetailN.gr")
	public String groupDetailN(@RequestParam("membershipNo") int membershipNo, Model model) {
		model.addAttribute("membershipNo", membershipNo);
		return "group_nJoin"; 
	}
	
	
	@RequestMapping(value="groupMaking.gr")
	public String groupMaking(HttpServletRequest request) {
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		if(loginUser != null) {			
			return "groupMaking"; 
		} else {
			throw new GroupException("잘못된 접근입니다");
		}
	}
	
	
	
	@RequestMapping(value="groupDetailAdmin.gr")
	public String groupDetailAdmin() {
		return "group_Y_Admin"; 
	}
		
	@RequestMapping("insertGroup.gr")
	public String insertGroup(@ModelAttribute Group g,@ModelAttribute GroupMember gm,
							  Model model, HttpServletRequest request,
							  @RequestParam("file") ArrayList<MultipartFile> file) {
		
			
			MultipartFile upload = file.get(0);
			gm.setMemberId(g.getHostId());
			gm.setGrade("모임장");
			String[] returnArr = saveFile(upload, request);
			Attachment a = new Attachment();
			if(returnArr[1] != null) {
				 a.setSavePath(returnArr[0]);
				 a.setOriginalName(upload.getOriginalFilename());
				 a.setRenameName(returnArr[1]);
				 a.setAttmLevel(0);
			 }
					
			
			int result1 = gService.insertGroup(g);
			int result2 = gService.insertAttm(a);
			int result3 = gService.insertGroupMember(gm);
		
			
			if(result1 + result2 + result3 == 3) {
				return "redirect:groupMain.gr";
			}else {
				throw new GroupException("모임 개설에 실패하였습니다");
			}
	}
	
	
	public String[] saveFile(MultipartFile file, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources"); 
		String savePath = root + "\\uploadFiles";
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		// 파일 이름 변경 형식 지정
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		int ranNum = (int)(Math.random()*100000);
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + ranNum 
								+ file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		
		// 변경된 이름의 파일을 저장 
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
	     
	   //---------------------보서 : 2023-05-14 : 가입자일 때 모임 화면 
	   @RequestMapping(value="groupDetailY.gr")
	   public String groupDetailY() {	      
	      return "redirect:selectGroupView.gr"; 
	   }


		// 수빈 : 모임 가입 페이지 23.05.17
		@RequestMapping(value = "groupJoin.gr")
		public String groupJoin(@RequestParam("membershipNo") int membershipNo, @RequestParam("page") int page, HttpSession session, Model model) {
			Member m = (Member)session.getAttribute("loginUser");
			GroupMember gm = new GroupMember();
			gm.setMemberId(m.getUserId());
			gm.setMembershipNo(membershipNo);
			int result = gService.groupJoin(gm);			
			int result2 = gService.updateCapacity(membershipNo);
			if(result + result2 == 2) {				
				return "redirect:selectGroupView.gr?membershipNo=" + membershipNo + "&page=" + page;
			} else {
				throw new GroupException("모임 가입에 실패했습니다");
			}
		}
		
		// 수빈 : 모임장 페이지 수정 23.05.17
		@RequestMapping(value="groupAdmin.gr")
		public String groupAdmin(@RequestParam("membershipNo") int membershipNo,
								@RequestParam(value="page", required=false) Integer page, Model model, HttpSession session) {
			
		    Member loginUser = (Member)session.getAttribute("loginUser");
		   	GroupMember gm = new GroupMember();
		   	gm.setMemberId(loginUser.getUserId());
			gm.setMembershipNo(membershipNo);
			int result = gService.checkGroupAdmin(gm);		
			
			if(result > 0) {
				int currentPage = 1;
				if(page != null) {
					currentPage = page;
				}
				
				int memberCount = gService.getMemberCount(membershipNo);
				PageInfo pi = Pagination.getPageInfo(currentPage, memberCount, 10);
				
				ArrayList<Member> mList = gService.getGroupMemberList(membershipNo, pi);
				if(mList != null) {
					model.addAttribute("pi", pi);
					model.addAttribute("mList", mList);
					model.addAttribute("membershipNo", membershipNo);
					return "groupAdmin";
					
				} else {
					throw new GroupException("모임 회원 조회를 실패했습니다.");
				}
				
			} else {
				throw new GroupException("잘못된 접근입니다");
			}
		}		
		
		
		// 그룹 검색 230518 수빈 수정
		@RequestMapping("searchGroup.gr")
		public String searchGroup(@RequestParam(value="searchCate") String searchCate, 
								  @RequestParam(value="searchWord") String searchWord,
								  @RequestParam(value="page", required=false) Integer page,
								  Model model) {
			
			Properties search = new Properties();
			search.put("searchCate", searchCate);
			search.put("searchWord", searchWord);
			
			int currentPage = 1;
			if(page != null) {
				currentPage = page;
			}
			
			int listCount = gService.getSearchListCount(search);
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 7);
			
			ArrayList<Group> searchGroupList = gService.searchGroup(search, pi);
		
			ArrayList<Attachment> gAttm = gService.selectAttmGroupList();
			
			model.addAttribute("pi", pi);
			model.addAttribute("gList", searchGroupList);
			model.addAttribute("gAttm", gAttm);
			model.addAttribute("searchCate", searchCate);
			model.addAttribute("searchWord",searchWord);
			
			return "searchGroup";
			
		}
		
		// 카테고리 검색 230518 수정
		@RequestMapping("selectCate.gr")
		public String selectCate(@RequestParam(value="page", required=false) Integer page,
								 @RequestParam("category") String category, Model model) {
			
			int currentPage = 1;
			if(page != null) {
				currentPage = page;
			}
			
			int listCount = gService.getCategoryListCount(category);
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 9);
			
			ArrayList<Group> gList = gService.selectCategoryGroupList(category, pi);
			ArrayList<Attachment> gAttm = gService.selectAttmGroupList();
			if(gList != null) {
				model.addAttribute("pi", pi);
				model.addAttribute("gList", gList);
				model.addAttribute("gAttm", gAttm);
				model.addAttribute("category", category);
			} else {
				throw new GroupException("모임 조회를 실패했습니다.");
			}		
			return "groupCateSelect";
		}
		
		
		// 모임 수정 페이지로 들어감
		@RequestMapping(value = "groupUpdate.gr")
		public String groupUpdate(@RequestParam("membershipNo") int membershipNo, @RequestParam("page") int page, Model model) {

			Attachment a = gService.getGroupPic(membershipNo);
			Group membership = gService.getGroupInfo(membershipNo);

			model.addAttribute("groupPic", a);
			model.addAttribute("groupInfo", membership);
			model.addAttribute("membershipNo", membershipNo);
			model.addAttribute("page", page);
			return "groupUpdate";
		}
		
		// 모임 수정하기
		@RequestMapping("updateGroup.gr")
		public String updateGroup(@ModelAttribute Group g, @RequestParam("deletePic") String deletePic,
								  @RequestParam(value="file", required=false) MultipartFile file, HttpServletRequest request,
								  @RequestParam("page") int page, Model model) {
			
			
			int resultAttm = 0;
			int updateGroup = 0;
			
			
			if(!deletePic.equals("notUpdate")) {
				deleteFile(deletePic, request);
				int deleteAttm = gService.deleteAttm(deletePic);
				String[] returnArr = saveFile(file, request);
				Attachment a = new Attachment();
				if(returnArr[1] != null) {
					a.setSavePath(returnArr[0]);
					a.setOriginalName(file.getOriginalFilename());
					a.setRenameName(returnArr[1]);
					a.setAttmLevel(0);
					a.setBoardNo(g.getMembershipNo());
				}				
				
				resultAttm = gService.insertNewPic(a);		
				
				updateGroup = gService.updateGroup(g);
				if(resultAttm + updateGroup == 2) {
					model.addAttribute("page", page);
					model.addAttribute("membershipNo", g.getMembershipNo());					
					return "redirect:selectGroupView.gr?membershipNo=" + g.getMembershipNo() + "&page=" + page;
				} else {
					throw new GroupException("모임 수정에 싪패했습니다. ");
				}
				
			} else {
				updateGroup = gService.updateGroup(g);

				if(updateGroup > 0) {
					model.addAttribute("page", page);
					model.addAttribute("membershipNo", g.getMembershipNo());
					return "redirect:selectGroupView.gr?membershipNo=" + g.getMembershipNo() + "&page=" + page;
				} else {
					throw new GroupException("모임 수정에 실패했습니다. ");
				}
				
			}
			
			
			
			
		}
		
		
		
		// 파일 삭제
		public void deleteFile(String fileName, HttpServletRequest request) {
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "\\uploadFiles";
			
			File f = new File(savePath + "\\" + fileName);
			if(f.exists()) {
				f.delete();
			}
		}
		
		
		
		 // ---------------------보서 : 2023-05-15 : 가입자/미가입자/모임장 화면 나누기 
	      @RequestMapping(value = "selectGroupView.gr")
	      public String selectGroupView(
	            @RequestParam("membershipNo") int membershipNo,
	            @RequestParam(value = "page", required = false) Integer currentPage, Model model
	            , HttpSession session
	            ) {
	                
	         
	         Attachment a = gService.getGroupPic(membershipNo);
	         
	         //미가입자-가입자 화면 나누기 
	         Member m = (Member)session.getAttribute("loginUser");
	         String login = null;
	         if( m != null) { 
	            login = m.getUserId();
	         }
	         int checkStatus = gService.checkStatus(login, membershipNo); 
	         
	         //비관리자-관리자
	         int checkAdmin = gService.checkAdmin(login, membershipNo);
	         
	         //membershipNo에 해당되는 화면 
	         ArrayList<Group> groups = gService.selectGroupView(membershipNo); //지금 이게 0번으로 들어와서 그래...
	         model.addAttribute("list", groups);
	         
	         // boardList 가져오기
	         if (currentPage == null) { // 값이 안 들어오면
	            currentPage = 1;
	         }
	         // 행 개수 가져오기
	         int listCount = gService.getListGroupCount(membershipNo);
	         
	         PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
	         ArrayList<GroupBoard> boardList = gService.selectBoardList(pi, membershipNo);
	       
	         //페이지, 게시글, 미가입자/가입자, 비관리자/관리자 여부 
	         if (boardList != null) {
	        	model.addAttribute("listCount", listCount);
	            model.addAttribute("pi", pi);
	            model.addAttribute("boardList", boardList); //게시글 
	            model.addAttribute("status", checkStatus);
	            model.addAttribute("adminStatus", checkAdmin);
	            model.addAttribute("membershipNo", membershipNo);
	            model.addAttribute("a", a);
	            model.addAttribute("page", currentPage);
	            return "group_yJoin";
	         } else {
	            return "groupMain3"; // 게시글 조회 실패 시 보여줄 화면 만들기
	         }
	      }
	      
	      // ---------------------보서 : 2023-05-14 : 모임 게시글 상세보기
	      @RequestMapping(value = "groupDetailBoard.gr")
	      public String groupDetailBoard(@ModelAttribute GroupBoardReply r, HttpServletRequest request, @RequestParam("boardNo") int boardNo,  @RequestParam("page") Integer page, Model model) {
	         //모임 글번호를 보내서 모임 번호에 일치하는 상세 글 조회 
	    	 
	         GroupBoard detailBoard = gService.selectDetailBoard(boardNo);
	         //글번호에 맞는 사진 조회 
	         Attachment gAttm = gService.selectAttm(boardNo);
	         //프로필 사진 가져오기 
	         String id = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
	         Attachment pAttm = gService.selectProfileAttm(detailBoard.getUsersId()); //등록 시 
	         
	         //댓글 정보 조회 
	         ArrayList<GroupBoardReply> replyList = gService.selectReply(r.getBoardNo());
	         
	         //작성자 프로필 사진 조회 
	         ArrayList<Attachment> replyWriterPic = gService.selectWriterPic(r.getReplyWriter());
	          
	         //댓글 개수 조회
	         int rCount = gService.selectReplyCount(boardNo);
	         
	         if (detailBoard != null) {
	            model.addAttribute("list", detailBoard); //게시글 정보 
	            model.addAttribute("gAttm", gAttm); //게시글 작성자가 게시한 사진 정보 
	            model.addAttribute("pAttm", pAttm); // loginUser 프로필 사진 정보 
	            model.addAttribute("replyList", replyList); // 
	            model.addAttribute("page", page);
	            model.addAttribute("rCount", rCount);
	            model.addAttribute("loginUserId", id);
	            model.addAttribute("replyWriterPic", replyWriterPic);
	            return "detailBoardNotice";
	         } else {
	            return "groupMain3"; 
	         }
	      }

	      //---------------------보서 : 2023-05-15 : 모임 게시글 작성하기
	      //상세 페이지에서 작성하기 버튼
	      @RequestMapping("groupBoardWrite.gr") 
	      public String groupBoardWrite(@RequestParam(value = "page", required = false) Integer page, 
	                           @RequestParam("membershipNo") int groupNo, Model model) {
	         
	         model.addAttribute("groupNo", groupNo);
	         model.addAttribute("page", page);
	         
	         
	         return "boardWrite"; //글 작성 화면에서 데이터 쓰고 submit누르면 
	      }
	     
	      // 관리자 모임 페이지
	      @RequestMapping("adminMoim.gr")
	      public String adminMember(@RequestParam(value="page", required=false) Integer page, Model model) {
	         int currentPage = 1;
	         if(page != null) {
	            currentPage = page;
	         }
	         
	         int listCount = gService.getListCount();
	         PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
	         
	         ArrayList<Group> gList = gService.selectGroupListWithHost(pi);
	         if(gList != null) {
	            model.addAttribute("pi", pi);
	            model.addAttribute("gList", gList);
	            return "adminMoim";
	            
	         } else {
	            throw new GroupException("모임 조회를 실패했습니다.");
	         }
	         
	      }
	      
//	      // 모임 가입 페이지
//	      @RequestMapping(value="groupJoin.gr")
//	      public String groupJoin(@RequestParam("membershipNo") int membershipNo, Model model) {      
//	         Attachment a = gService.getGroupPic(membershipNo);
//	         Group membership = gService.getGroupInfo(membershipNo);
//	         model.addAttribute("groupPic", a );
//	         model.addAttribute("groupInfo", membership );
//	         
//	         return "groupJoin"; 
//	      }
//	      
//	      
	      
	      @RequestMapping("deleteMember.gr")
	      public String deleteMember(@ModelAttribute GroupMember gc, Model model) {
	         
	    	 int result = gService.deleteMember(gc);
	         int membershipNo = gc.getMembershipNo();
	         int result2 = gService.downCapacity(membershipNo);
	         
	         if(result>0) {
	            model.addAttribute("membershipNo", membershipNo);
	            return "redirect:groupAdmin.gr";
	         } else {
	            throw new GroupException("멤버 추방에 실패했습니다.");
	         }
	      }
	      
	      //-----------------------------------------20230517 댓글 gson으로 구현 
	      @RequestMapping(value ="insertReply.gr", produces="application/json; charset=UTF-8")
	      public void insertReply(@ModelAttribute GroupBoardReply r, HttpServletResponse response) {
	         
	         //댓글 등록 처리
	         int result = gService.insertReply(r);
	         //댓글 조회 처리 
	         ArrayList<GroupBoardReply> replyList = gService.selectReply(r.getBoardNo());
	         
	         response.setContentType("application/json; charset=UTF-8");
	         GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy-MM-dd"); 
	         Gson gson = gb.create();
	         try {
	            //json에 보내고 싶은 객체를 toJson에 담아서 보내기 
	            gson.toJson(replyList, response.getWriter()); //등록 버튼 클릭하면 계속 조회 
	         } catch (JsonIOException | IOException e) {
	            e.printStackTrace();
	         }
	      }
	      
	      //----------------------------------------------달력
	      @RequestMapping(value="calendar.gr")
	         public String calendar(@ModelAttribute Calendar cal, @RequestParam("groupNo") int gNo, HttpServletRequest request, Model model) {
	           String loginUser = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
	            model.addAttribute("groupNo", gNo);
	            ArrayList<Calendar> allSche = gService.selectSche(cal);
	            model.addAttribute("allSche", allSche);
	            model.addAttribute("logUser", loginUser);
	            return "calendar"; 
	         }
	         
	         @RequestMapping(value="insertCalendar.gr", produces="application/json; charset=UTF-8")
	         public void insertCalendar(@ModelAttribute Calendar cal, Model model, HttpServletRequest request, HttpServletResponse response) {
	          
	            //일정 등록
	           String id = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
	            cal.setCalWriter(id);
	            
	           int sche = gService.insertSche(cal);
	           
	           
	            ArrayList<Calendar> thisSched = gService.selectClickSche(cal);
	            response.setContentType("application/json; charset=UTF-8");
	            GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy-MM-dd"); 
	            Gson gson = gb.create();
	            try {
	               gson.toJson(thisSched, response.getWriter());
	            } catch (JsonIOException | IOException e) {
	               e.printStackTrace();
	            }
	            
	         }
	         
	         //this 눌렀을 때 캘린더 조회 
	         @RequestMapping(value = "selectSche.gr", produces="application/json; charset=UTF-8")
	         public void selectSche(@ModelAttribute Calendar cal, HttpServletResponse response) {
	            //innerHTML 이랑 일치하는 date 날짜 조회 
//	            String clickDay = cal.getSchDate();
	           
	            ArrayList<Calendar> thisSched = gService.selectClickSche(cal);
	            response.setContentType("application/json; charset=UTF-8");
	            GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy-MM-dd"); 
	            Gson gson = gb.create();
	            
	            try {
	               gson.toJson(thisSched, response.getWriter());
	            }  catch (JsonIOException | IOException e) {
	               e.printStackTrace();
	            }
	         }
	         
	         //일정 삭제 
	         @RequestMapping(value = "delButton.gr", produces="application/json; charset=UTF-8")
	         public String delButton(@RequestParam("schNo") int schNo) {
	            
	            int result = gService.deleteSched(schNo);           
	            return null;
	         }
	      
	        
	      //20230520 게시글 작성 - insertBoard.gr 수정 
	      @RequestMapping("insertBoard.gr") 
	      public String groupBoardWrite(@ModelAttribute GroupBoard groupBoard, HttpServletRequest request,
	                                  @RequestParam(value = "page", required = false) Integer page,
	                                  @RequestParam("file") MultipartFile file, Model model) {
	         
	         int currentPage = 1;
	         if (page != null) {
	            currentPage = page;
	         }
	         
	        
	         String id = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
	         groupBoard.setUsersId(id);
	         
	         //첨부파일
	         Attachment attachment = new Attachment();
	         
	         MultipartFile upload = file;
	         //file : MultipartFile[field="file", filename=짱구.png, contentType=image/png, size=1174898]
	         if(file != null && !file.isEmpty()) { //파일이 들어 왔다면?
	            String[] returnArr = saveFile(upload, request); 
	            if (returnArr[1] != null) { //내용이 있는 파일만 list에 담기 
	                  attachment.setSavePath(returnArr[0]); //경로 변경 
	                  attachment.setOriginalName(upload.getOriginalFilename());
	                  attachment.setRenameName(returnArr[1]); //변경 이름 넣기 
	                  attachment.setAttmLevel(1);
	                  attachment.setBoardType("모임");
	                  attachment.setUserId(id);
	               }
	         }
	         //-------------------------------------------글 insert 
	         //GroupBoard - Attachment 각각 하나씩 저장 
	         int result1 = gService.insertBoard(groupBoard); //글 등록
	         //최신 글번호 조회 
	         int newBoardNo = gService.selectNewBoardNo(id);
	         attachment.setBoardNo(newBoardNo);
	         
	         int result2 = gService.insertGroupAttm(attachment); //사진 등록 
	         
	         return "redirect:groupDetailBoard.gr?page=" + currentPage + "&boardNo=" + newBoardNo;
	      }
	      
	      //게시글 수정 ( 게시글 수정 버튼 눌러서 옴 ) 
	      @RequestMapping("updateBoard.gr") 
	      public String updateWrite(@RequestParam("boardNo") int boardNo,@RequestParam("page") Integer page, Model model) {
	         //boardNo와 일치하는 사진 / 게시글 조회
	         Attachment gAttm = gService.selectAttm(boardNo); //기존 사진 가지고 오기 
	         GroupBoard bList = gService.selectDetailBoard(boardNo); // 기존 글 가지고 오기 
	         
	         
	         model.addAttribute("gAttm", gAttm);
	         model.addAttribute("bList", bList);
	         model.addAttribute("page", page);
	         return "edit";
	      }
	      
	         
	      
	      
	      //게시글 수정 후 작성 버튼 
	      @RequestMapping("updateGroupBoard.gr")
	      public String updateGroupBoard(
	            @RequestParam(value = "page", required = false) Integer page,GroupBoard groupBoard, HttpServletRequest request
	            ,@RequestParam("file") MultipartFile file, @RequestParam("originFile") String originName, @RequestParam("originFile") String originFile,  Model model) {
	         
				int currentPage = 1;
				if (page != null) {
					currentPage = page;
				}
				String id = ((Member) request.getSession().getAttribute("loginUser")).getUserId();
				groupBoard.setUsersId(id);
				
				// 첨부파일 삭제
				if (!file.isEmpty()) {
					int result = gService.delAttm(groupBoard.getBoardNo());
					deleteFile(originName, request);		

					// 게시글 수정 => 파일이 있는 경우 없는 경우

					// 추가 사진
					Attachment attachment = new Attachment();
					MultipartFile upload = file;

					String[] returnArr = saveFile(upload, request);
					if (returnArr[1] != null) { // 내용이 있는 파일만 list에 담기
						attachment.setSavePath(returnArr[0]); // 경로 변경
						attachment.setOriginalName(upload.getOriginalFilename());
						attachment.setRenameName(returnArr[1]); // 변경 이름 넣기
						attachment.setAttmLevel(1);
						attachment.setBoardType("모임");
						attachment.setBoardNo(groupBoard.getBoardNo());
						attachment.setUserId(id);
					}
					// 글 update
					int result2 = gService.updateGroupBoard(groupBoard);

					// originFile은 이제 경로랑 다 들어온 거라서..
					attachment.setBoardNo(groupBoard.getBoardNo());
					int result3 = gService.insertGroupAttm(attachment); // 새로운 사진 등록

					// select할 때 지금 글번호가 아니라
					Attachment gAttm = gService.selectAttm(groupBoard.getBoardNo());

					Attachment pAttm = gService.selectProfileAttm(groupBoard.getUsersId());
			         
			       
					ArrayList<GroupBoardReply> reply = gService.selectReply(groupBoard.getBoardNo());
					
//					model.addAttribute("loginUser", id);
					model.addAttribute("pAttm", pAttm);
					model.addAttribute("list", groupBoard);
					model.addAttribute("page", page);
					model.addAttribute("gAttm", gAttm);
					model.addAttribute("originFile", originFile);
					model.addAttribute("replyList", reply);
					model.addAttribute("gList", originFile);
					return "detailBoardNotice";
		    	  
		    	  
		    	  
	    	  } else {
	    		  
	    		  int result2 = gService.updateGroupBoard(groupBoard);
	    		  Attachment gAttm = gService.selectAttm(groupBoard.getBoardNo());
	    		  
	    		  Attachment pAttm = gService.selectProfileAttm(groupBoard.getUsersId());
	    		  	model.addAttribute("pAttm", pAttm);
//	    		  	model.addAttribute("loginUser", id);
	    		  ArrayList<GroupBoardReply> reply = gService.selectReply(groupBoard.getBoardNo());
					model.addAttribute("list", groupBoard);
					model.addAttribute("page", page);
					model.addAttribute("gAttm", gAttm);
					model.addAttribute("originFile", originFile);
					model.addAttribute("replyList", reply);
					model.addAttribute("gList", originFile);
					return "detailBoardNotice";
	    		  
	    		  
	    		  
	    	  }	    	  
	    	  
	      }
	      
	      //게시글 삭제
	      @RequestMapping("deleteBoard.gr")
	      public String deleteBoard(Model model, @RequestParam("groupNo") int membershipNo, @RequestParam("page") Integer page, @RequestParam("boardNo") int boardNo) {
	         //댓글 삭제 
	         int result2 = gService.delReply(boardNo);
	         //게시글 삭제
	         int result = gService.deleteBoard(boardNo);
	         //게시글에 해당되는 첨부파일 삭제 
//	         model.addAttribute(membershipNo);
	         gService.delAttm(boardNo);
	         //게시글에 해당되는 댓글 전부 삭제
	         
	         return "redirect:selectGroupView.gr?page=" + page + "&membershipNo=" + membershipNo;
	      }
	      
	      //댓글 내용 수정
	      @RequestMapping(value="updateReply.gr", produces="application/json; charset=UTF-8")
	      public void updateReply(@ModelAttribute GroupBoardReply reply, Model model, HttpServletResponse response) {
	         
	         int result = gService.updateReply(reply);
	         
	      }
	      
	      //댓글 개수 조회
	      @RequestMapping(value="selectReplyCount.gr", produces="application/json; charset=UTF-8")
	      public void selectReplyCount(@RequestParam("boardNo") int boardNo, HttpServletResponse response) {
	         
	         int rCount = gService.selectReplyCount(boardNo);
	         
	         response.setContentType("application/json; charset=UTF-8");
	         GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy-MM-dd"); 
	         Gson gson = gb.create();
	         try {
	            gson.toJson(rCount, response.getWriter()); //등록 버튼 클릭하면 계속 조회 
	         } catch (JsonIOException | IOException e) {
	            e.printStackTrace();
	         }
	              
	      }
	      
	      //댓글 삭제
	      @RequestMapping(value="deleteReply.gr", produces="application/json; charset=UTF-8")
	      public void deleteReply(@RequestParam("replyNo") int replyNo, HttpServletResponse response) {
	         
	         int result = gService.deleteOneReply(replyNo);
	       
	              
	      }
	      
	      
	      
	      @RequestMapping("moveMinihome.gr")
	      public String moveMinihome(@RequestParam("membershipNo") int membershipNo) {
	    	  GroupMember gm = gService.getHostId(membershipNo);
	    	  String userId = gm.getMemberId();
	    	  return "redirect:miniMainN.mi?userId=" +userId;
	      }

}
