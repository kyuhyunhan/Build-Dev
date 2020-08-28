package logic;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class TIL {
	private int no;
	private int bno;
	private String name;
	private String title;
	private String content;
	private Date regdate;
	private boolean open;
	private List<String> hashlist = new ArrayList<String>();
	private int point;
	
	
	
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public List<String> getHashlist() {
		return hashlist;
	}
	public void addHashlist(String hashname) {
		this.hashlist.add(hashname);
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public boolean isOpen() {
		return open;
	}
	public void setOpen(boolean open) {
		this.open = open;
	}
	@Override
	public String toString() {
		return "TIL [no=" + no + ", bno=" + bno + ", name=" + name + ", title=" + title + ", content=" + content
				+ ", regdate=" + regdate + ", open=" + open + ", hashlist=" + hashlist + ", point=" + point + "]";
	}
}
