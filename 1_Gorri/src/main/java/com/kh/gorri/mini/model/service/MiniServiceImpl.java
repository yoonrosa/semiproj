package com.kh.gorri.mini.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.gorri.board.model.vo.Attachment;
import com.kh.gorri.group.model.vo.Group;
import com.kh.gorri.member.model.vo.Member;
import com.kh.gorri.mini.model.DAO.MiniDAO;
import com.kh.gorri.product.model.vo.Product;

@Service
public class MiniServiceImpl implements MiniService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MiniDAO mmDAO;
	
	@Override
	public ArrayList<Group> groupList(Member m) {
		return mmDAO.groupList(sqlSession, m);
	}
	
	@Override
	public ArrayList<Product> getProductList(Member m) {
		return mmDAO.getProductList(sqlSession, m);
	}
	
	@Override
	public int insertAttm(Attachment a) {
		return mmDAO.insertAttm(sqlSession, a);
	}
	
	@Override
	public int updateIntro(Member m) {
		return mmDAO.updateIntro(sqlSession, m);
	}
	
	@Override
	public int groupListCount(Member m) {
		return mmDAO.groupListCount(sqlSession, m);
	}

	@Override
	   public int deleteMoim(int mId, String userId) {
	      return mmDAO.deleteMoim(sqlSession, mId, userId);
	}

	@Override
	public Attachment getProfileImage(String id) {
		return mmDAO.getProfileImage(sqlSession, id);
	}

	@Override
	public int updateAttm(Attachment a) {
		return mmDAO.updateAttm(sqlSession, a);
	}
}
