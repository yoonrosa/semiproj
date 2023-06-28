package com.kh.gorri.home.model.service;

import java.util.ArrayList;

import com.kh.gorri.board.model.vo.Board;
import com.kh.gorri.group.model.vo.Attachment;

public interface HomeService {

	ArrayList<Board> hobbyBoardList();

	ArrayList<Attachment> selectAttmBoardList();

}
