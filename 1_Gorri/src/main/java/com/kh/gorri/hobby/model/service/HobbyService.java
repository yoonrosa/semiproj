package com.kh.gorri.hobby.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.kh.gorri.board.model.vo.Attachment;
import com.kh.gorri.board.model.vo.Board;


public interface HobbyService {

	ArrayList<Board> hobbyCate(String category);

	ArrayList<Board> searchHobby(HashMap<String, String> map);

	ArrayList<Attachment> selectHobbyAttm();

}
