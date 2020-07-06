package com.simple.service;

import java.util.ArrayList;

import com.simple.command.ScoreVO;

public interface ScoreService {
	public void scoreRegist(ScoreVO vo);//점수등록
	public ArrayList<ScoreVO> scoreList();//점수목록
	public void scoreDelete(int num);//점수삭제
}
