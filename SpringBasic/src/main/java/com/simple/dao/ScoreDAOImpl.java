package com.simple.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
//import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

//import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.simple.command.ScoreVO;
//@Service("scoreDAO")
//@Component
@Repository("scoreDAO")
public class ScoreDAOImpl implements ScoreDAO{
	//DB라고 가정
//	private ArrayList<ScoreVO> DB=new ArrayList<>();
//	@Override
//	public void scoreRegist(ScoreVO vo) {
//		System.out.println("scoreDAO영역");
//		DB.add(vo);
//		System.out.println(DB.toString());
//	}
//	@Override
//	public ArrayList<ScoreVO> scoreList() {
//		return DB;
//	}
//	@Override
//	public void scoreDelete(int num) {
//		DB.remove(num);
//	}
//	@Autowired
//	private DataSource datasource;
//	@Override
//	public void scoreRegist(ScoreVO vo) {
//		Connection conn;
//		try {
//			conn=datasource.getConnection();
//			System.out.println("결과확인 : "+conn);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Override
	public void scoreRegist(ScoreVO vo) {
		String sql="insert into score(num,name,kor,eng,math) values(score_seq.nextval,?,?,?,?)";
//		String[]arr=new String[] {"1","2","3"};
		int result=jdbcTemplate.update(sql,new Object[] {vo.getName(),vo.getKor(),vo.getEng(),vo.getMath()});
		System.out.println("성공실패 : "+result);
	}
	@Override
	public ArrayList<ScoreVO> scoreList() {
		String sql="select * from score";
		List<ScoreVO> list=jdbcTemplate.query(sql,new Object[] {},new RowMapper<ScoreVO>() {
			@Override
			public ScoreVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				//제네릭에는 select 구문을 처리할 vo가 들어갑니다.
				//mapRow 메서드 안에서는 resultSet 객체를 처리하는 구문이 들어갑니다.
				ScoreVO vo=new ScoreVO();//결과를 반환받아서 가져갈 vo
				vo.setNum(rs.getInt("num"));
				vo.setName(rs.getString("name"));
				vo.setKor(rs.getString("kor"));
				vo.setEng(rs.getString("eng"));
				vo.setMath(rs.getString("math"));
				return vo;
			}
		});
		return (ArrayList<ScoreVO>)list;
	}

	@Override
	public void scoreDelete(int num) {
		String sql="delete from score where num=?";
		jdbcTemplate.update(sql,new Object[] {num});
	}

}
