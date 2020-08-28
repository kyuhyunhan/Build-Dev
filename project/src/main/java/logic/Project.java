package logic;

import java.util.Date;

public class Project {
	private String name;
	private int prono;
	private String subject;
	private int num;
	private String description;
	private String repository;
	private boolean able;
	private Date start;
	private Date end;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getProno() {
		return prono;
	}
	public void setProno(int prono) {
		this.prono = prono;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getRepository() {
		return repository;
	}
	public void setRepository(String repository) {
		this.repository = repository;
	}
	public boolean isAble() {
		return able;
	}
	public void setAble(boolean able) {
		this.able = able;
	}
	public Date getStart() {
		return start;
	}
	public void setStart(Date start) {
		this.start = start;
	}
	public Date getEnd() {
		return end;
	}
	public void setEnd(Date end) {
		this.end = end;
	}
	@Override
	public String toString() {
		return "Project [name=" + name + ", prono=" + prono + ", subject=" + subject + ", num=" + num + ", description="
				+ description + ", repository=" + repository + ", able=" + able + ", start=" + start + ", end=" + end
				+ "]";
	}
}
