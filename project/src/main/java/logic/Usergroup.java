package logic;

public class Usergroup {
	private String name;
	private int gno;
	private String lang;
	private String chk;
	private String auth;
	private String comment;
	private String email;
	private String phone;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	public String getLang() {
		return lang;
	}
	public void setLang(String lang) {
		this.lang = lang;
	}
	public String getChk() {
		return chk;
	}
	public void setChk(String chk) {
		this.chk = chk;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	@Override
	public String toString() {
		return "user_group [name=" + name + ", gno=" + gno + ", lang=" + lang + ", chk=" + chk + ", auth=" + auth
				+ ", comment=" + comment + ", email=" + email + ", phone=" + phone + "]";
	}
	
	
}
