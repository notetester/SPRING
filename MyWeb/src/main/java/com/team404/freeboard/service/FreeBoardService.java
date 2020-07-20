package com.team404.freeboard.service;

import java.util.ArrayList;

import com.team404.command.FreeBoardVO;
import com.team404.util.Criteria;

public interface FreeBoardService {
	public void regist(FreeBoardVO vo);
	public ArrayList<FreeBoardVO>getList(Criteria cri);
	public int getTotal(Criteria cri);
	public FreeBoardVO getContent(int bno);
	public int update(FreeBoardVO vo);
	public int delete(FreeBoardVO vo);
}
