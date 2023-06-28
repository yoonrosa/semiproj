package com.kh.gorri.member.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.gorri.common.Pagination;
import com.kh.gorri.common.model.vo.PageInfo;
import com.kh.gorri.group.model.exception.GroupException;
import com.kh.gorri.board.model.vo.Attachment;
import com.kh.gorri.group.model.vo.Group;
import com.kh.gorri.member.model.exception.MemberException;
import com.kh.gorri.member.model.service.MemberService;
import com.kh.gorri.member.model.vo.Member;

@SessionAttributes({"loginUser", "myProfile"})
@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	@RequestMapping(value="login.me")
	public String login() {
		return "login";
	}
	
	@RequestMapping(value="login2.me")
	public String login2() {
		return "login2";
	}
	
	@RequestMapping("loginConfirm.me")
	public String loginConfirm(@ModelAttribute Member m,
							   Model model) {
		
		Member loginUser = mService.login(m);		
		Attachment myProfile = mService.loginAttm(m);
		
		if(bcrypt.matches(m.getUserPwd(), loginUser.getUserPwd())) {
			model.addAttribute("loginUser", loginUser);
			model.addAttribute("myProfile", myProfile);
			if(loginUser.getIsAdmin().equals("Y")) {
				return "redirect:adminMember.me";
			} else {			
				return "redirect:main.do";
			}
		} else {
			return "redirect:login2.me";
		}
	}
	
	@RequestMapping("logout.me")
	public String logout(SessionStatus status) {
		status.setComplete();		
		return "redirect:main.do";
	}
	
	@RequestMapping("updateMyInfo.me")
	public String updateMyInfo() {
		return "updateMyInfo";
	}
	

	//회원가입 : 보서 - 2023-05-12 23:08분 ----------------------------
	@RequestMapping("join.me")
	public String join() {
		return "join";
	}
	
	@RequestMapping("insertMember.me")
	public String insertMember(@ModelAttribute Member m) {
		
		String userPwd = bcrypt.encode(m.getUserPwd());
		m.setUserPwd(userPwd);
		
		int result = mService.insertMember(m);
		if(result > 0 ) {
			return "redirect:login.me";
		} else {
			throw new MemberException("회원가입에 실패하셨습니다.");
		}
	}
	
	//보서 2023-05-12 : 아이디 중복 확인 
	@RequestMapping("checkId.me") 
	@ResponseBody
	public String checkId(@RequestParam("id") String id) {
		
		int checkUid = mService.checkId(id);
		String result = checkUid == 0 ? "yes" : "no";
		return result;
	}
	
	//보서 2023-05-12 : 닉네임 중복 확인
	@RequestMapping("checkNick.me")
	@ResponseBody
	public String checkNick(@RequestParam("nickName") String nickName) {
		
		int checkNick = mService.checkNick(nickName);
		String result = checkNick == 0 ? "yes" : "no";
			
		return result;
		
	}
	
	@RequestMapping(value="findPwdResult.me")
	public String findPwdResult() {
		return "resetPwdResult";
	}
	
	@RequestMapping("findPwd.me")
	public String findPwd() {
		return "findPwd";
	}
	
	@RequestMapping(value="resetPwd.me")
	public String resetPwd(@ModelAttribute Member m,
							Model model) {
		int result = mService.findPwd(m);
		if(result > 0) {			
			model.addAttribute("userId",m.getUserId());
			return "resetPwd";
		} else {
			return "findPwdResultFail";
		}
		
	}
	
	@RequestMapping(value="changePwd.me")
	public String changePwd(@ModelAttribute Member m) {
		
		String userPwd = bcrypt.encode(m.getUserPwd());
		m.setUserPwd(userPwd);
		int result = mService.changePwd(m);
		if(result > 0) {
			return "redirect:findPwdResult.me";
		} else {
			throw new MemberException("비밀번호 업데이트에 실패했습니다");
		}
		
	}
	
	
	// 관리자 페이지(회원 조회)
	@RequestMapping("adminMember.me")
	public String adminMember(@RequestParam(value="page", required=false) Integer currentPage,
							  Model model) {
		
		if(currentPage == null) {
			currentPage = 1; 
		}
		
		int listCount = mService.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<Member> mList = mService.selectMemberList(pi);
		if(mList != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("mList", mList);
			return "adminMember";
			
		} else {
			throw new GroupException("회원 조회를 실패했습니다.");
		}
		
		
		
	}
	
	
	
	//  내 정보 수정 currentPwd check
	@RequestMapping("checkCurrentPwd.me")
	@ResponseBody
	public String checkCurrentPwd(@ModelAttribute Member m) {
		
		Member m2 = mService.login(m);
		if(bcrypt.matches(m.getUserPwd(),m2.getUserPwd())) {
			return "yes";
		} else {
			return "no";
		}		
	}
	
	@RequestMapping("updateMember.me")
	public String updateMember(@ModelAttribute Member m, Model model) {
		
		int result = mService.updateMember(m);
		if(result > 0) {
			model.addAttribute("loginUser", m);
			return "redirect:main.do";
		} else {
			throw new MemberException("실패함");
		}
		
	}
	
	
	@RequestMapping("findId.me")
	   public String findId() {
	      return "findId";
	   }
	   
	   @RequestMapping("findIdResult.me")
	   public String findIdResult(@ModelAttribute Member m, Member member, Model model) {
	      
	      Member user = mService.findId(m);
	      if(user != null) {
	         m.setUserId(user.getUserId());
	         model.addAttribute("member", m);
	         return "findIdResult";
	      } else {
	         return "findIdResultFail";
	      }
	      
	      
	   }
	 @RequestMapping("updatePwdPage.me")
	 public String updatePwdPage() {
		 return "updatePwd";
	 }
	 
	 @RequestMapping("quitGorri.me")
	 public String quitGorri(@RequestParam("userId") String userId, SessionStatus status) {
		 int result = mService.quitGorri(userId);
		 if(result >0) {
			 status.setComplete();
			 return "redirect:main.do";
		 }else {
			 throw new MemberException("탈퇴에 실패하셨습니다.");
		 }
	 }
	 
	 
	 
	// 관리자 페이지 회원 삭제
	@RequestMapping("deleteMember.me")
	@ResponseBody
	public String deleteMember(@RequestParam("userId") String userId) {
		int result = mService.quitGorri(userId);
		if(result>0) {
			return "yes";
		}else {
			return "no";
		}
			
	}
		
}
