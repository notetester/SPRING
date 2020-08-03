package com.team404.snsboard.service;

import java.util.ArrayList;

import com.team404.command.SnsBoardVO;

public interface SnsBoardService {

	public boolean regist(SnsBoardVO vo); //이미지게시글등록
	public ArrayList<SnsBoardVO> getList(); //목록
}
