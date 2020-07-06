package com.simple.basic;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class JDBCBasic {
	//Junit - 단위 테스트 환경(자바에서 작은 단위만 분리해서 테스팅)
	//@Test 어노테이션이 붙은 메서드를 main 메서드처럼 실행
	@Test
	public void test() {
		String url="jdbc:oracle:thin:@localhost:1521/XEPDB1";
		String uid="SPRING";
		String upw="SPRING";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn=DriverManager.getConnection(url,uid,upw);
			System.out.println("결과확인:"+conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
