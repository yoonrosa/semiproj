package com.kh.gorri.mini.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.kh.gorri.board.model.vo.Attachment;
import com.kh.gorri.group.model.service.GroupService;
import com.kh.gorri.group.model.vo.Group;
import com.kh.gorri.member.model.vo.Member;
import com.kh.gorri.mini.model.exception.MiniException;
import com.kh.gorri.mini.model.service.MiniService;
import com.kh.gorri.product.model.vo.Product;

@Controller
@SessionAttributes("myProfile")
public class MiniController {
	
	@Autowired
	private MiniService mmService;
	
	@Autowired
	private GroupService gService;
	
	
	// 미이홈 - 모임 목록
		@RequestMapping("miniMoim.mi")
		public String miniMoim(HttpServletRequest request, Model model) {
			Member m = (Member)request.getSession().getAttribute("loginUser");
			ArrayList<Group> glist = mmService.groupList(m);
			System.out.println(glist);
			
			
			
			model.addAttribute("glist", glist);
			
			return "miniMoim";
		}
		
//		미니홈 - 구매목록
	@RequestMapping("miniBuy.mi")
	public String miniBuy(Model model, HttpServletRequest request) {
		Member m = (Member)request.getSession().getAttribute("loginUser");
		ArrayList<Product> pList = mmService.getProductList(m);
		
		model.addAttribute("pList", pList);
		
		return "miniBuy";
	}
	
//	미니홈 - 자기소개 등록, 수정
	@RequestMapping("updateIntro.mi")
	@ResponseBody
	public String updateIntro(HttpServletResponse response, HttpServletRequest request) {
			
			String myIntro = request.getParameter("myIntro"); // 얘를 디비에 업데이트 해야함
			System.out.println(myIntro);
			Member m = (Member)request.getSession().getAttribute("loginUser");
			m.setMyIntro(myIntro);
			mmService.updateIntro(m); //새로운 내용으로 업뎃.. -> m을 화면으로 다시 보내야함...
			
	//		System.out.println("myIntro : " + myIntro);
	//		System.out.println("수정 : " + m); 
			
			return myIntro;
		}
//	미니홈 - 프사 등록, 수정
	@RequestMapping(value="insertProfileImg.mi", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String[] insertProfileImg(HttpServletRequest request, @RequestParam("file") MultipartFile file, Model model, Member m) {
			
			String originalName = request.getParameter("filename"); // originName을 데이터에 저장. -> 값 한개씩 밖에 안오는디..
	
			
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "\\uploadFiles"; // 저장경로..
			File folder = new File(savePath);
			if(!folder.exists()) {
				folder.mkdirs();
			}
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
			int ranNum = (int)(Math.random()*100000);
			String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + ranNum + originalName.substring(originalName.lastIndexOf("."));
	
			
			String renamePath = folder + "\\" + renameFileName;
	
			try {
				file.transferTo(new File(renamePath)); // 파일 저장
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			Attachment a = new Attachment();
			String id = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
			
			a.setOriginalName(originalName);
			a.setSavePath(savePath);
			a.setRenameName(renameFileName);
			a.setUsersId(id);
			a.setBoardType("프사");
			
			
			Attachment existingProfileImg = mmService.getProfileImage(id);
	         
	         int result;
	          
	          if (existingProfileImg != null) {
	              // 기존 프로필 이미지 업데이트
	              existingProfileImg.setOriginalName(originalName);
	              existingProfileImg.setRenameName(renameFileName);
	              result = mmService.updateAttm(a);
	          } else {
	              // 새로운 프로필 이미지 삽입
	              result = mmService.insertAttm(a);
	          }

	          String[] returnArr = new String[2];
	          returnArr[0] = savePath;
	          returnArr[1] = renameFileName;

	          if (result > 0) {
	              model.addAttribute("myProfile", a);
	              return returnArr;
	          } else {
	              throw new MiniException("실패.");
	          }
	}
	
		@RequestMapping("deleteMoim.mi")
		public String deleteMoim(@RequestParam("mId") int mId, HttpServletRequest request) {
			Member m = (Member) request.getSession().getAttribute("loginUser");
			String userId = m.getUserId();

			int result = mmService.deleteMoim(mId, userId);
			int result2 = gService.downCapacity(mId);
			if (result > 0) {
				return "redirect:miniMoim.mi";
			} else {
				throw new MiniException("");
			}

		}
		
}
