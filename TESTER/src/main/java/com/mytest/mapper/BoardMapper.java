package com.mytest.mapper;

import java.util.ArrayList;

import com.mytest.command.CompVO;
import com.mytest.util.Criteria;

public interface BoardMapper {
	public void regist(CompVO vo);
	public ArrayList<CompVO>getList(Criteria cri);
	public int getTotal(Criteria cri);
	public CompVO getContent(int bno);
	public int update(CompVO vo);
	public int delete(CompVO vo);
}