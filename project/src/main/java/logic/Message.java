package logic;

import java.util.Date;

public class Message {
	private int meno;
	private String me_from;
	private String me_to;
	private String title;
	private String content;
	private Date regdate;
	public int getMeno() {
		return meno;
	}
	public void setMeno(int meno) {
		this.meno = meno;
	}
	public String getMe_from() {
		return me_from;
	}
	public void setMe_from(String me_from) {
		this.me_from = me_from;
	}
	public String getMe_to() {
		return me_to;
	}
	public void setMe_to(String me_to) {
		this.me_to = me_to;
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
	@Override
	public String toString() {
		return "Message [meno=" + meno + ", me_from=" + me_from + ", me_to=" + me_to + ", title=" + title + ", content="
				+ content + ", regdate=" + regdate + "]";
	}
	
	
}
