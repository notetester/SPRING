package com.simple.mapper;

import java.util.ArrayList;

import com.simple.command.ScoreVO;

public interface ScoreMapper {
	public int scoreRegist(ScoreVO vo);//등록
	public ArrayList<ScoreVO> scoreList();//목록
	public void scoreDelete(int num);//삭제
}