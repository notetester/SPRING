package com.lcb404.mapper;

import java.util.List;

import com.lcb404.command.QNABoardVO;
import com.lcb404.utill.Criteria;

public interface QNABoardMapper {
	public int QNAregist(QNABoardVO vo); //등록
	public List<QNABoardVO> QNAgetList(Criteria cri); //리스트
	public int getTotal(Criteria cri);
	public QNABoardVO getContent(int qna_number);
	public int Update(QNABoardVO vo);
	public int delete(int qna_number);
}
