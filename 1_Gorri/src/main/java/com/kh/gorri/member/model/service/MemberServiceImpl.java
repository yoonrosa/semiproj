package com.kh.gorri.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.gorri.board.model.vo.Attachment;
import com.kh.gorri.common.model.vo.PageInfo;
import com.kh.gorri.member.model.dao.MemberDAO;
import com.kh.gorri.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDAO mDAO;

	@Override
	public Member login(Member m) {
		return mDAO.login(sqlSession, m);
	}

	@Override
	public int findPwd(Member m) {
		return mDAO.findPwd(sqlSession, m);
	}

	@Override
	public int changePwd(Member m) {
		return mDAO.changePwd(sqlSession,m);
	}
	
	@Override
	public int insertMember(Member m) {
		return mDAO.insertMember(sqlSession, m);
	}
	
	@Override
	public int checkId(String id) {
		return mDAO.checkId(sqlSession, id);
	}
	
	@Override
	public int checkNick(String nickName) {
		return mDAO.checkNick(sqlSession, nickName);
	}

	@Override
	public int getListCount() {
		return mDAO.getListCount(sqlSession);
	}

	@Override
	public ArrayList<Member> selectMemberList(PageInfo pi) {
		return mDAO.selectMemberList(sqlSession, pi);
	}
	
	@Override
	public Member findId(Member m) {
		return mDAO.findId(sqlSession, m);
	}

	@Override
	public int updateMember(Member m) {
		return mDAO.updateMember(sqlSession, m);
	}

	@Override
	public int quitGorri(String userId) {
		return mDAO.quitGorri(sqlSession, userId);
	}
	
	@Override
	public Attachment loginAttm(Member m) {
		return mDAO.loginAttm(sqlSession, m);
	}

	@Override
	public Member getUserInfo(String userId) {
		return mDAO.getUserInfo(sqlSession, userId);
	}

	@Override
	public Attachment getUserPic(String userId) {
		return mDAO.getUserPic(sqlSession, userId);
	}
	
}
