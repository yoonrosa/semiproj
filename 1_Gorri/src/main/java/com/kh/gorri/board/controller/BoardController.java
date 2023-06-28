package com.kh.gorri.board.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.gorri.board.model.exception.BoardException;
import com.kh.gorri.board.model.service.BoardService;
import com.kh.gorri.board.model.vo.Attachment;
import com.kh.gorri.board.model.vo.Board;
import com.kh.gorri.board.model.vo.Reply;
import com.kh.gorri.common.Pagination;
import com.kh.gorri.common.model.vo.PageInfo;
import com.kh.gorri.member.model.service.MemberService;
import com.kh.gorri.member.model.vo.Member;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	@Autowired
	private MemberService mService;
	
	@RequestMapping("miniMain.mi")
	public String miniMain(@ModelAttribute Board b, Model model, HttpSession session) {
		String userId = ((Member)session.getAttribute("loginUser")).getUserId();
		
		System.out.println(userId);
		ArrayList<Board> bList = bService.selectUserBoardList(userId);
		ArrayList<Attachment> aList = bService.selectUserAttmList(userId);
		int listCount = bService.boardListCount(userId);
		
		if(bList != null) {
			model.addAttribute("bList", bList);
			model.addAttribute("aList", aList);
			model.addAttribute("listCount", listCount);
			
			return "miniMain";
		}
		throw new BoardException("게시글 조회를 실패하였습니다.");
	}
	
	@RequestMapping("miniMainN.mi")
	public String miniMainN(Model model, @RequestParam("userId") String userId) {
		
		System.out.println("미니홈까지 넘어오나?" + userId);
		ArrayList<Board> bList = bService.selectUserBoardList(userId);
		ArrayList<Attachment> aList = bService.selectUserAttmList(userId);
		Member m = mService.getUserInfo(userId);
		Attachment profile = mService.getUserPic(userId);
		int listCount = bService.boardListCount(userId);
		
		
		
		if(bList != null) {
			model.addAttribute("bList", bList);
			model.addAttribute("aList", aList);
			model.addAttribute("listCount", listCount);
			model.addAttribute("m", m);
			model.addAttribute("profile", profile);
			return "miniMain2";
		}
		throw new BoardException("게시글 조회를 실패하였습니다.");
	}
	
	@RequestMapping("hobbyMain.hb")
	public String hobbyMain(@ModelAttribute Board b, Model model, @RequestParam(value="page", required=false) Integer currentPage) {
		if(currentPage == null) {
			currentPage = 1;
		}
		
		int listCount = bService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 15);
		
		ArrayList<Board> bList = bService.selectBoardList(pi);
		ArrayList<Attachment> aList = bService.selectAttmBoardList(b);
		
		if(bList != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("bList", bList);
			model.addAttribute("aList", aList);
			
			return "hobbyMain";
		}	
		
		throw new BoardException("게시글 조회를 실패하였습니다.");
	}
	
	@GetMapping("miniBoardContent.mi")
	public ModelAndView miniBoardContent(@RequestParam("bNo") int bNo, 
										 @RequestParam("bId") String bId,
//										 @RequestParam("page") int page,
										 HttpSession session, ModelAndView mv) {
		Member m = (Member)session.getAttribute("loginUser");
		String login = null;
		if(m != null) {
			login = m.getUserId();
		}
		boolean yn = false;
		if(!bId.equals(login)) {
			yn = true;
		}
		
		Board b = bService.selectBoard(bNo);
		ArrayList<Attachment> list = bService.selectAttmBoard(bNo);
		ArrayList<Reply> rList = bService.selectReply(bNo);
		Attachment profile = mService.getUserPic(bId);
		
		if(b != null) {
			mv.addObject("b", b);
//			mv.addObject("page", page);
			mv.addObject("list", list);
			mv.addObject("rList", rList);
			mv.addObject("profile", profile);
			mv.setViewName("miniBoardContent");
			
			return mv;
		}
		
		throw new BoardException("게시글 상세조회를 실패하였습니다.");
	}
	
	@RequestMapping("boardWrite.hb")
	public String boardWrite() {
		return "boardWrite";
	}
	
	@PostMapping("insertBoard.hb")
	public String insertBoard(@ModelAttribute Board b, HttpServletRequest request,
							  @RequestParam("file") ArrayList<MultipartFile> files) {
		String id = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		b.setUsersId(id);
		
		ArrayList<Attachment> list = new ArrayList<>();
		for(int i = 0; i < files.size(); i++) {
			MultipartFile upload = files.get(i);
			if(upload != null && !upload.isEmpty()) {
				String[] returnArr = saveFile(upload, request);
				if(returnArr[1] != null) {
					Attachment a = new Attachment();
					a.setSavePath(returnArr[0]);
					a.setOriginalName(upload.getOriginalFilename());
					a.setRenameName(returnArr[1]);
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
		
		int result1 = 0;
		int result2 = 0;
		
		result1 = bService.insertBoard(b);
		result2 = bService.insertAttm(list);
		
		if(result1 + result2 == list.size()+1) {
			return "redirect:miniMain.mi";
		} else {
			for(Attachment a : list) {
				deleteFile(a.getRenameName(), request);
			}
			throw new BoardException("게시글 작성을 실패하였습니다.");
		}
		
	}
	
	@RequestMapping("boardEdit.hb")
	public String boardEdit(@RequestParam("boardNo") int bNo, Model model) {
		
		System.out.println(bNo);
		Board b = bService.selectBoard(bNo);
		ArrayList<Attachment> list = bService.selectAttmBoard(bNo);
		
		System.out.println(list);
		model.addAttribute("b", b);
		model.addAttribute("list", list);
//		model.addAttribute("page", page);
		
		return "boardEdit";
	}
	
	
//	
//	public String[] saveFile(MultipartFile file, HttpServletRequest request) {
//		String root = "C:\\practice\\SemiProject\\1_Gorri\\src\\main\\webapp\\resources";
//		String savePath = root + "\\uploadFiles";
//		File folder = new File(savePath);
//		if(!folder.exists()) {
//			folder.mkdirs();
//		}
//		
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
//		int ranNum = (int)(Math.random()*100000);
//		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + ranNum + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
//		
//		String renamePath = folder + "\\" + renameFileName;
//		
//		try {
//			file.transferTo(new File(renamePath));
//		} catch (IllegalStateException | IOException e) {
//			e.printStackTrace();
//		}
//		
//		String[] returnArr = new String [2];
//		returnArr[0] = savePath;
//		returnArr[1] = renameFileName;
//		
//		return returnArr;
//	}
	
	public String[] saveFile(MultipartFile file, HttpServletRequest request) {

		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		File folder = new File(savePath);

		if (!folder.exists()) {
			folder.mkdirs();
		}

		// 파일 이름 변경 형식 지정
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		int ranNum = (int) (Math.random() * 100000);
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
	
	
	
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		
		File f = new File(savePath + "\\" + fileName);
		if(f.exists()) {
			f.delete();
		}
	}
	
//	public void deleteFile(String fileName, HttpServletRequest request) {
//		String root = "C:\\practice\\SemiProject\\1_Gorri\\src\\main\\webapp\\resources";
//		String savePath = root + "\\uploadFiles";
//		
//		File f = new File(savePath + "\\" + fileName);
//		if(f.exists()) {
//			f.delete();
//		}
//	}
	
	@RequestMapping("boardUpdate.hb")
	public String boardUpdate(@ModelAttribute Board b, @RequestParam("deleteAttm") String[] deleteAttm,
							  @RequestParam("file") ArrayList<MultipartFile> files,
							  HttpServletRequest request, Model model) {
		
		ArrayList<Attachment> list = new ArrayList<>();
		
		for(int i = 0; i < files.size(); i++) {
			MultipartFile upload = files.get(i);
			if(!upload.getOriginalFilename().equals("")) {
				String[] returnArr = saveFile(upload, request);
				if(returnArr[1] != null) {
					Attachment a = new Attachment();
					a.setOriginalName(upload.getOriginalFilename());
					a.setRenameName(returnArr[1]);
					a.setSavePath(returnArr[0]);
					
					list.add(a);
				}
			}
			
		}
		
		ArrayList<String> delRename = new ArrayList<>();
		ArrayList<Integer> delLevel = new ArrayList<>();
		
		for(String rename : deleteAttm) {
			if(!rename.equals("none")) {
				String[] split = rename.split("/");
				delRename.add(split[0]);
				delLevel.add(Integer.parseInt(split[1]));
			}
		}
		
		int deleteAttmResult = 0;
		int updateBoardResult = 0;
		boolean existBeforeAttm = true;
		
		if(!delRename.isEmpty()) {
			deleteAttmResult = bService.deleteAttm(delRename);
			if(deleteAttmResult > 0) {
				for(String rename : delRename) {
					deleteFile(rename, request);
				}
			}
			
			if(delRename.size() == deleteAttm.length) {
				existBeforeAttm = false;
			} else {
				for(int level : delLevel) {
					if(level == 0) {
						bService.updateAttmLevel(b.getBoardNo());
						break;
					}
				}
			}
		}
		
		for(int i = 0; i < list.size(); i++) {
			Attachment a = list.get(i);
			a.setBoardNo(b.getBoardNo());
			
			if(existBeforeAttm) {
				a.setAttmLevel(1);
			}else {
				if(i == 0) {
					a.setAttmLevel(0);
				} else {
					a.setAttmLevel(1);
				}
			}
		}
		
		updateBoardResult = bService.updateBoard(b);
		
		int updateAttmResult = 0;
		if(!list.isEmpty()) {
			updateAttmResult = bService.insertAttm(list);
		}
		
		System.out.println(updateBoardResult);
		System.out.println(updateAttmResult);
		System.out.println(list.size());
		
		if(updateBoardResult + updateAttmResult == list.size()+1) {
			if(delRename.size() == deleteAttm.length && updateAttmResult == 0) {
				return "redirect:miniBoardContent.mi";
			} else {
				model.addAttribute("bNo", b.getBoardNo());
				model.addAttribute("bId", ((Member)request.getSession().getAttribute("loginUser")).getUserId());
//				model.addAttribute("page", page);

				return "redirect:miniBoardContent.mi";
			}
		} else {
			throw new BoardException("게시글 수정을 실패하였습니다.");
		}
	}
	
	@RequestMapping("deleteBoard.hb")
	public String deleteBoard(@RequestParam("boardNo") int boardNo) {
		
		int result1 = bService.deleteBoard(boardNo);
		int result2 = bService.deleteBoardAttm(boardNo);
		
		if(result1 > 0 && result2 > 0) {
			return "redirect:miniMain.mi";
		} else {
			throw new BoardException("게시글 삭제를 실패하였습니다.");
		}
	}
	
	@RequestMapping("insertReply.hb")
	public void insertReply(@ModelAttribute Reply r, HttpServletResponse response) {
		bService.insertReply(r);
		ArrayList<Reply> list = bService.selectReply(r.getBoardNo());
		
		response.setContentType("application/json; charset=UTF-8");
		
		GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy-MM-dd");
		Gson gson = gb.create();
		
		try {
			gson.toJson(list, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("deleteReply.hb")
	public String deleteReply(@RequestParam("replyNo") int replyNo, @RequestParam("replyWriter") String replyWriter, 
							@ModelAttribute Reply r, @RequestParam("bId") String bId, @RequestParam("bNo") int bNo,
							Model model) {
		r.setReplyNo(replyNo);
		r.setReplyWriter(replyWriter);
		
		int result = bService.deleteReply(r);
		
		if(result > 0) {
			model.addAttribute("bId", bId);
			model.addAttribute("bNo", bNo);
			
			return "redirect:miniBoardContent.mi";
		} else {
			throw new BoardException("댓글 삭제를 실패하였습니다.");
		}
	}
	
	@PostMapping("updateReply.hb")
	public String updateReply(@RequestParam("upReNo") int replyNo, @RequestParam("upReWriter") String replyWriter, 
							  @RequestParam("upReContent") String replyContent, @RequestParam("bNo") int bNo, @RequestParam("bId") String bId,
							  @ModelAttribute Reply r, Model model) {
		r.setReplyNo(replyNo);
		r.setReplyWriter(replyWriter);
		r.setReplyContent(replyContent);
		
		int result = bService.updateReply(r);
		
		if(result > 0) {
			model.addAttribute("bNo", bNo);
			model.addAttribute("bId", bId);
			
			return "redirect:miniBoardContent.mi";
		} else {
			throw new BoardException("댓글 수정이 실패하였습니다.");
		}
	}
}
