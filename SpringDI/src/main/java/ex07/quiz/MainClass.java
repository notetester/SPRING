package ex07.quiz;

import org.springframework.context.support.GenericXmlApplicationContext;

public class MainClass {

	public static void main(String[] args) {
		//Computer에 키보드, 마우스, 모니터를 자동주입 명령으로
		//주입하고 메인에서 확인
		GenericXmlApplicationContext ctx=new GenericXmlApplicationContext("autowired-context.xml");
		Computer com=ctx.getBean(Computer.class);
		com.computerInfo();
	}

}
