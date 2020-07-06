package com.simple.basic;

import org.junit.Test;

interface Car{
	public void run();
}
class Tico implements Car{
	@Override
	public void run() {
		System.out.println("결과....");
	}
}
public class JDBCANONYMOUS {
	@Test
	public void test() {
		Car car=new Car() {
			@Override
			public void run() {
				System.out.println("결과....");
			}
		};
		car.run();
		//익명 클래스 기법 - 보통의 경우에는 별도 클래스를 생성해서 쓰지만,
		//재사용할 일이 없는 1회성 클래스는 익명 클래스로 빠르게 생성해서 사용합니다.
	}
}