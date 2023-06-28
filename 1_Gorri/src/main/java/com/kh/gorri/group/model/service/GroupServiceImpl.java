package com.kh.gorri.group.model.service;

import java.util.ArrayList;
import java.util.Properties;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.gorri.common.model.vo.PageInfo;
import com.kh.gorri.group.model.dao.GroupDAO;
import com.kh.gorri.group.model.vo.Attachment;
import com.kh.gorri.group.model.vo.Calendar;
import com.kh.gorri.group.model.vo.Group;
import com.kh.gorri.group.model.vo.GroupBoard;
import com.kh.gorri.group.model.vo.GroupBoardReply;
import com.kh.gorri.group.model.vo.GroupMember;
import com.kh.gorri.member.model.vo.Member;

@Service
public class GroupServiceImpl implements GroupService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private GroupDAO gDAO;

	@Override
	public ArrayList<Group> searchGroup(Properties search, PageInfo pi) {
		return gDAO.searchGroupList(sqlSession, search, pi);
	}

	@Override
	public int getListCount(int i) {
		return gDAO.selectListCount(sqlSession, i);
	}

	@Override
	public ArrayList<Group> getMainGroupList() {
		return gDAO.getMainGroupList(sqlSession);
	}

	@Override
	public int groupJoin(GroupMember gm) {
		return gDAO.groupJoin(sqlSession, gm);
	}

	@Override
	public int checkGroupAdmin(GroupMember gm) {
		return gDAO.checkGroupAdmin(sqlSession, gm);
	}

	@Override
	public int getSearchListCount(Properties search) {
		return gDAO.getSearchListCount(sqlSession, search);
	}

	@Override
	public int insertNewPic(Attachment a) {
		return gDAO.insertNewPic(sqlSession, a);
	}

	@Override
	public int updateGroup(Group g) {
		return gDAO.updateGroup(sqlSession, g);
	}

	@Override
	public int deleteAttm(String deletePic) {
		return gDAO.deleteAttm(sqlSession, deletePic);
	}

	@Override
	public int updateCapacity(int membershipNo) {
		return gDAO.updateCapacity(sqlSession, membershipNo);
	}

	@Override
	public int downCapacity(int membershipNo) {
		return gDAO.downCapacity(sqlSession, membershipNo);
	}

	@Override
	public int insertGroup(Group g) {
		return gDAO.insertGroup(sqlSession, g);
	}

	@Override
	public int insertAttm(Attachment a) {
		return gDAO.insertAttm(sqlSession, a);
	}

	@Override
	public int insertGroupMember(GroupMember gm) {
		return gDAO.insertGroupMember(sqlSession, gm);
	}

	@Override
	public int getListCount() {
		return gDAO.getListCount(sqlSession);
	}

	@Override
	public ArrayList<Group> selectGroupList(PageInfo pi) {
		return gDAO.selectGroupList(sqlSession, pi);
	}

	@Override
	public ArrayList<Attachment> selectAttmGroupList() {
		return (ArrayList) gDAO.selectAttmGroupList(sqlSession);
	}

	@Override
	public ArrayList<Group> selectGroupView(int groupNo) {
		return gDAO.selectGroupView(sqlSession, groupNo);
	}

	@Override
	public ArrayList<GroupBoard> selectBoardList(PageInfo pi, int i) {
		return gDAO.selectBoardList(sqlSession, pi, i);
	}

	@Override
	public GroupBoard selectDetailBoard(GroupBoard gb) {
		return gDAO.selectDetailBoard(sqlSession, gb);
	}

	@Override
	public ArrayList<Group> selectGroupListWithHost(PageInfo pi) {
		return gDAO.selectGroupListWithHost(sqlSession, pi);
	}

	@Override
	public int getMemberCount(int membershipNo) {
		return gDAO.getMemberCount(sqlSession, membershipNo);
	}

	@Override
	public int getCategoryListCount(String category) {
		return gDAO.getCategoryListCount(sqlSession, category);
	}

	@Override
	public ArrayList<Group> selectCategoryGroupList(String category, PageInfo pi) {
		return gDAO.selectCategoryGroupList(sqlSession, category, pi);
	}

	@Override
	public ArrayList<Member> getGroupMemberList(int membershipNo, PageInfo pi) {
		return gDAO.getGroupMemberList(sqlSession, membershipNo, pi);
	}

	@Override
	public Attachment getGroupPic(int membershipNo) {
		return gDAO.getGroupPic(sqlSession, membershipNo);
	}

	@Override
	public Group getGroupInfo(int membershipNo) {
		return gDAO.getGroupInfo(sqlSession, membershipNo);
	}

	@Override
	public int deleteMember(GroupMember gc) {
		return gDAO.deleteMember(sqlSession, gc);
	}

	@Override
	public int checkStatus(String login, int membershipNo) {
		return gDAO.checkStatus(sqlSession, login, membershipNo);
	}

	@Override
	public int checkAdmin(String login, int membershipNo) {
		return gDAO.checkAdmin(sqlSession, login, membershipNo);
	}

	@Override
	public GroupBoard selectDetailBoard(int boardNo) {
		return gDAO.selectDetailBoard(sqlSession, boardNo);
	}

	@Override
	public int insertBoard(GroupBoard groupBoard) {
		return gDAO.insertBoard(sqlSession, groupBoard);
	}

	@Override
	public int selectNewBoardNo(String id) {
		return gDAO.selectNewBoardNo(sqlSession, id);
	}

	@Override
	public int insertGroupAttm(Attachment attachment) {
		return gDAO.insertGroupAttm(sqlSession, attachment);
	}

	@Override
	public Attachment selectAttm(int boardNo) {
		return gDAO.selectAttm(sqlSession, boardNo);
	}

	@Override
	public int insertReply(GroupBoardReply r) {
		return gDAO.insertReply(sqlSession, r);
	}

	@Override
	public ArrayList<GroupBoardReply> selectReply(int boardNo) {
		return gDAO.selectReply(sqlSession, boardNo);
	}

	@Override
	public Attachment selectProfileAttm(String id) {
		return gDAO.selectProfileAttm(sqlSession, id);
	}

	@Override
	public int insertSche(Calendar cal) {
		return gDAO.insertSche(sqlSession, cal);
	}

	@Override
	public ArrayList<Calendar> selectSche(Calendar cal) {
		return gDAO.selectSche(sqlSession, cal);
	}

	@Override
	public ArrayList<Calendar> selectClickSche(Calendar cal) {
		return gDAO.selectClickSche(sqlSession, cal);
	}

	@Override
	public int deleteSched(int schNo) {
		return gDAO.deleteSched(sqlSession, schNo);
	}

	@Override
	public int delAttm(int delAttm) {
		return gDAO.deleteAttm(sqlSession, delAttm);
	}

	@Override
	public int updateGroupBoard(GroupBoard groupBoard) {
		return gDAO.updateGroupBoard(sqlSession, groupBoard);
	}

	@Override
	public int deleteBoard(int boardNo) {
		return gDAO.deleteBoard(sqlSession, boardNo);
	}

	@Override
	public int delReply(int boardNo) {
		return gDAO.deleteReply(sqlSession, boardNo);
	}

	@Override
	public int updateReply(GroupBoardReply reply) {
		return gDAO.updateReply(sqlSession, reply);
	}

	@Override
	public int selectReplyCount(int boardNo) {
		return gDAO.selectReplyCount(sqlSession, boardNo);
	}

	@Override
	public int getListGroupCount(int membershipNo) {
		return gDAO.getListGroupCount(sqlSession, membershipNo);
	}

	@Override
	public int deleteOneReply(int replyNo) {
		return gDAO.deleteOneReply(sqlSession, replyNo);
	}

	@Override
	public ArrayList<Attachment> selectWriterPic(String replyWriter) {
		return gDAO.selectWriterPic(sqlSession, replyWriter);
	}

	@Override
	public GroupMember getHostId(int membershipNo) {
		return gDAO.getHostId(sqlSession, membershipNo);
	}

}
