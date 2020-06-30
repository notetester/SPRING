package ex03.setter;

public class MemberDAO {
	private DatabaseDev datasource;
	public void setDatasource(DatabaseDev datasource) {
		this.datasource = datasource;
	}
	public void info() {
		System.out.println("DB 주소 : "+datasource.getUrl());
		System.out.println("DB 아이디 : "+datasource.getUid());
		System.out.println("DB 비밀번호 : "+datasource.getUpw());
	}
}
