package com.kh.gorri.mini.model.service;

import java.util.ArrayList;

import com.kh.gorri.board.model.vo.Attachment;
import com.kh.gorri.group.model.vo.Group;
import com.kh.gorri.member.model.vo.Member;
import com.kh.gorri.product.model.vo.Product;

public interface MiniService {


	ArrayList<Product> getProductList(Member m);
	
	int groupListCount(Member m);

	int insertAttm(Attachment a);

	int updateIntro(Member m);

	ArrayList<Group> groupList(Member m);

	int deleteMoim(int mId, String userId);

	Attachment getProfileImage(String id);

	int updateAttm(Attachment a);



}
