package com.simple.mapper;

import java.util.ArrayList;

import com.simple.command.BoardVO;

public interface BoardMapper {
	public int boardRegist(BoardVO vo);//등록
	public ArrayList<BoardVO>getList();//목록
	public void boardDelete(int num);//삭제
}