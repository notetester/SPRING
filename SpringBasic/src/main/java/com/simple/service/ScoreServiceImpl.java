package com.simple.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.simple.command.ScoreVO;
import com.simple.dao.ScoreDAO;
@Service("scoreService")//컴포넌트 스캔이 읽어서 scoreService 이름으로 빈으로 생성
public class ScoreServiceImpl implements ScoreService{
	@Resource(name="scoreDAO")
	private ScoreDAO scoreDAO;
	@Override
	public void scoreRegist(ScoreVO vo) {
		scoreDAO.scoreRegist(vo);
	}
	@Override
	public ArrayList<ScoreVO> scoreList() {
		return scoreDAO.scoreList();
	}
	@Override
	public void scoreDelete(int num) {
		scoreDAO.scoreDelete(num);
	}

}
