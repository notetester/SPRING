package ex06.autowired;

import javax.annotation.Resource;

public class Printer2 {
	/*
	 * @Resource -> 이름으로 찾는다 -> 타입으로 찾음
	 * - 세터, 맴버변수에 적용 가능
	 */
	@Resource(name="doc1")
	private Document document;
	public Printer2() {}
	public Printer2(Document document) {
		this.document = document;
	}
	public Document getDocument() {
		return document;
	}
	public void setDocument(Document document) {
		this.document = document;
	}
}
