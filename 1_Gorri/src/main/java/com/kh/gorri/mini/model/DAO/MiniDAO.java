package com.kh.gorri.mini.model.DAO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.gorri.board.model.vo.Attachment;
import com.kh.gorri.group.model.vo.Group;
import com.kh.gorri.member.model.vo.Member;
import com.kh.gorri.product.model.vo.Product;

@Repository
public class MiniDAO {

	
	
	
	
	public int insertAttm(SqlSessionTemplate sqlSession, Attachment a) {
		return sqlSession.insert("miniMapper.insertAttm", a);
	}

	public int updateIntro(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("miniMapper.updateIntro", m);
	}

	public ArrayList<Product> getProductList(SqlSessionTemplate sqlSession, Member m) {
		return (ArrayList)sqlSession.selectList("miniMapper.getProductList", m);
	}

	public ArrayList<Group> groupList(SqlSessionTemplate sqlSession, Member m) {
		return (ArrayList)sqlSession.selectList("miniMapper.groupList", m);
	}

	public int groupListCount(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("miniMapper.groupListCount", m);
	}

	public int deleteMoim(SqlSessionTemplate sqlSession, int mId, String userId) {
	      Map<String, Object> map = new HashMap<String, Object>();
	        map.put("mId", mId);
	        map.put("userId", userId);
	        return sqlSession.update("miniMapper.deleteMoim", map);

	   }

	public Attachment getProfileImage(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("miniMapper.getProfileImage", id);
	}

	public int updateAttm(SqlSessionTemplate sqlSession, Attachment a) {
		return sqlSession.update("miniMapper.updateAttm", a);
	}

}
