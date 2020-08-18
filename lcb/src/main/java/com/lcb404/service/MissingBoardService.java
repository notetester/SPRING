package com.lcb404.service;

import java.util.List;

import com.lcb404.command.MissingBoardVO;
import com.lcb404.utill.Criteria;

public interface MissingBoardService {
	public int Missingregist(MissingBoardVO vo);
	public List<MissingBoardVO> MissinggetList(Criteria cri); //리스트
	public int getTotal(Criteria cri);
	public MissingBoardVO getContent(int found_number);
	public int Update(MissingBoardVO vo);
	public int delete(int qna_number);
}
