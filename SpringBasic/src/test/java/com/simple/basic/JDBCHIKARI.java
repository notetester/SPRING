package com.simple.basic;

import java.sql.Connection;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/config/root-context.xml")
public class JDBCHIKARI {
	//커낵션풀 확인
	@Autowired
	DataSource datasource;
	//스프링 JDBC 확인
	@Autowired
	JdbcTemplate jdbcTemplate;
	@Test
	public void test() {
		try {
			Connection conn=datasource.getConnection();
			System.out.println("결과확인 : "+conn);
			System.out.println("스프링 jdbc 결과확인 : "+jdbcTemplate);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
