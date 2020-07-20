package com.mytest.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mytest.command.CompVO;
import com.mytest.mapper.BoardMapper;
import com.mytest.util.Criteria;
@Service("BoardService")
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardMapper boardMapper;
	@Override
	public void regist(CompVO vo) {
		boardMapper.regist(vo);
	}
	@Override
	public ArrayList<CompVO> getList(Criteria cri) {
		return boardMapper.getList(cri);
	}
	@Override
	public CompVO getContent(int bno) {
		return boardMapper.getContent(bno);
	}
	@Override
	public int update(CompVO vo) {
		return boardMapper.update(vo);
	}
	@Override
	public int delete(CompVO vo) {
		return boardMapper.delete(vo);
	}
	@Override
	public int getTotal(Criteria cri) {
		return boardMapper.getTotal(cri);
	}
}