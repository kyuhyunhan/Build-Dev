package logic;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

public class Coworking {
	private int gno;
	private String name;
	private String title;
	private String category;
	private String content;
	private int maxnum;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date startdate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date enddate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date deadline;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date regdate;
	private String process;
	private String grade;
	private String loc;
	private List<String> hashlist = new ArrayList<String>();
	
	
	
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public List<String> getHashlist() {
		return hashlist;
	}
	public void addHashlist(String hashname) {
		this.hashlist.add(hashname);
	}
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getMaxnum() {
		return maxnum;
	}
	public void setMaxnum(int maxnum) {
		this.maxnum = maxnum;
	}
	public Date getStartdate() {
		return startdate;
	}
	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}
	public Date getEnddate() {
		return enddate;
	}
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}
	public Date getDeadline() {
		return deadline;
	}
	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}
	public String getProcess() {
		return process;
	}
	public void setProcess(String process) {
		this.process = process;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	@Override
	public String toString() {
		return "Coworking [gno=" + gno + ", name=" + name + ", title=" + title + ", category=" + category + ", content="
				+ content + ", maxnum=" + maxnum + ", startdate=" + startdate + ", enddate=" + enddate + ", deadline="
				+ deadline + ", process=" + process + ", grade=" + grade + ", loc=" + loc + ", hashlist=" + hashlist
				+ "]";
	}
	
	
	
}
