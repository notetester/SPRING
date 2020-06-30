package ex06.autowired;

import org.springframework.beans.factory.annotation.Autowired;

public class Printer {
	private Document doc1;
	@Autowired
	public Printer(Document doc1) {
		this.doc1=doc1;
	}
	public Document getDoc1() {
		return doc1;
	}
	public void setDoc1(Document doc1) {
		this.doc1 = doc1;
	}
}
