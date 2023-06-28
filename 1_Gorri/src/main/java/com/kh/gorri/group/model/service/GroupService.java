package com.kh.gorri.group.model.service;

import java.util.ArrayList;
import java.util.Properties;

import com.kh.gorri.common.model.vo.PageInfo;
import com.kh.gorri.group.model.vo.Attachment;
import com.kh.gorri.group.model.vo.Calendar;
import com.kh.gorri.group.model.vo.Group;
import com.kh.gorri.group.model.vo.GroupBoard;
import com.kh.gorri.group.model.vo.GroupBoardReply;
import com.kh.gorri.group.model.vo.GroupMember;
import com.kh.gorri.member.model.vo.Member;

public interface GroupService {


	ArrayList<Group> searchGroup(Properties search, PageInfo pi);

	int getListCount(int i);

	ArrayList<Group> getMainGroupList();

	int groupJoin(GroupMember gm);

	int checkGroupAdmin(GroupMember gm);

	int getSearchListCount(Properties search);

	int insertNewPic(Attachment a);

	int updateGroup(Group g);

	int deleteAttm(String deletePic);

	int updateCapacity(int membershipNo);

	int downCapacity(int membershipNo);

	int insertGroup(Group g);

	int insertAttm(Attachment a);

	int insertGroupMember(GroupMember gm);

	int getListCount();

	ArrayList<Group> selectGroupList(PageInfo pi);

	ArrayList<Attachment> selectAttmGroupList();

	ArrayList<Group> selectGroupView(int groupNo);

	ArrayList<GroupBoard> selectBoardList(PageInfo pi, int i);

	GroupBoard selectDetailBoard(GroupBoard gb);

	ArrayList<Group> selectGroupListWithHost(PageInfo pi);

	int getMemberCount(int membershipNo);

	int getCategoryListCount(String category);

	ArrayList<Group> selectCategoryGroupList(String category, PageInfo pi);

	ArrayList<Member> getGroupMemberList(int membershipNo, PageInfo pi);

	Attachment getGroupPic(int membershipNo);

	Group getGroupInfo(int membershipNo);

	int deleteMember(GroupMember gc);

	int checkStatus(String login, int membershipNo);

	int checkAdmin(String login, int membershipNo);

	GroupBoard selectDetailBoard(int boardNo);

	int insertBoard(GroupBoard groupBoard);

	int selectNewBoardNo(String id);

	int insertGroupAttm(Attachment attachment);

	Attachment selectAttm(int boardNo);

	int insertReply(GroupBoardReply r);

	ArrayList<GroupBoardReply> selectReply(int boardNo);

	Attachment selectProfileAttm(String id);

	int insertSche(Calendar cal);

	ArrayList<Calendar> selectSche(Calendar cal);

	ArrayList<Calendar> selectClickSche(Calendar cal);

	int deleteSched(int schNo);

	int delAttm(int delAttm);

	int updateGroupBoard(GroupBoard groupBoard);

	int deleteBoard(int boardNo);

	int delReply(int boardNo);

	int updateReply(GroupBoardReply reply);

	int selectReplyCount(int boardNo);

	int getListGroupCount(int membershipNo);

	int deleteOneReply(int replyNo);

	ArrayList<Attachment> selectWriterPic(String replyWriter);

	GroupMember getHostId(int membershipNo);
	   


	


}
