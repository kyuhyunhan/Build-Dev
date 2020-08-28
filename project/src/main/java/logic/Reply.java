package logic;

import java.util.Date;

public class Reply {

	
	private int no;
	private int rno;
	private int bno;
	private String name;
	private String content;
	private Date regdate;
	private int grp;
	private int grplevel;
	private int grpstep;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
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
	public int getGrp() {
		return grp;
	}
	public void setGrp(int grp) {
		this.grp = grp;
	}
	public int getGrplevel() {
		return grplevel;
	}
	public void setGrplevel(int grplevel) {
		this.grplevel = grplevel;
	}
	public int getGrpstep() {
		return grpstep;
	}
	public void setGrpstep(int grpstep) {
		this.grpstep = grpstep;
	}
	@Override
	public String toString() {
		return "Reply [no=" + no + ", rno=" + rno + ", bno=" + bno + ", name=" + name + ", content=" + content
				+ ", regdate=" + regdate + ", grp=" + grp + ", grplevel=" + grplevel + ", grpstep=" + grpstep + "]";
	}
	
	
	
}
