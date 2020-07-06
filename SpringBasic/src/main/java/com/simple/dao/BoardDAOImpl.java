package com.simple.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.simple.command.BoardVO;
@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO{
//	private ArrayList<BoardVO> DB=new ArrayList<>();
//	@Override
//	public void boardRegist(BoardVO vo) {
//		DB.add(vo);
//	}
//
//	@Override
//	public ArrayList<BoardVO> getList() {
//		return DB;
//	}
//
//	@Override
//	public void boardDelete(int num) {
//		DB.remove(num);
//	}
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Override
	public void boardRegist(BoardVO vo) {
		String sql="INSERT INTO BOARD(NUM,NAME,TITLE,CONTENT) VALUES(BOARD_SEQ.NEXTVAL,?,?,?)";
		jdbcTemplate.update(sql,new Object[] {vo.getName(),vo.getTitle(),vo.getContent()});
	}
	@Override
	public ArrayList<BoardVO> getList() {
		String sql="SELECT * FROM BOARD";
		List<BoardVO>list=jdbcTemplate.query(sql,new Object[]{},new RowMapper<BoardVO>(){
			@Override
			public BoardVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				BoardVO vo=new BoardVO();
				vo.setNum(rs.getInt("NUM"));
				vo.setName(rs.getString("NAME"));
				vo.setTitle(rs.getString("TITLE"));
				vo.setContent(rs.getString("CONTENT"));
				return vo;
			}
		});
		return (ArrayList<BoardVO>)list;
	}
	@Override
	public void boardDelete(int num) {
		String sql="DELETE FROM BOARD WHERE NUM=?";
		jdbcTemplate.update(sql,new Object[]{num});
	}
}