package logic;

import java.util.Date;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class User {
	private int uno;
	@Size(min=2, max=10, message="2자 이상 10자 이하 입력하세요")
	private String name;
	@Size(min=4, max=10, message="4자 이상 10자 이하 입력하세요")
	private String id;
	@Size(min=4, message="비밀번호는 4자 이상 입력하세요")
	private String pw;
	@Email(message="Email 형식으로 입력하세요")
	@NotEmpty(message="Email은 필수 입력사항입니다")
	private String email;
	@NotEmpty(message="연락처는 필수 입력사항입니다")
	private String phone;
	private Date regdate;
	private String auth;
	private int alertnum;
	private String giturl;
	private boolean giturlable;
	private String tilurl;
	private boolean tilurlable;
	private String content;
	private boolean open;
	public int getUno() {
		return uno;
	}
	public void setUno(int uno) {
		this.uno = uno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
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
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	public int getAlertnum() {
		return alertnum;
	}
	public void setAlertnum(int alertnum) {
		this.alertnum = alertnum;
	}
	public String getGiturl() {
		return giturl;
	}
	public void setGiturl(String giturl) {
		this.giturl = giturl;
	}
	public boolean isGiturlable() {
		return giturlable;
	}
	public void setGiturlable(boolean giturlable) {
		this.giturlable = giturlable;
	}
	public String getTilurl() {
		return tilurl;
	}
	public void setTilurl(String tilurl) {
		this.tilurl = tilurl;
	}
	public boolean isTilurlable() {
		return tilurlable;
	}
	public void setTilurlable(boolean tilurlable) {
		this.tilurlable = tilurlable;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public boolean isOpen() {
		return open;
	}
	public void setOpen(boolean open) {
		this.open = open;
	}
	@Override
	public String toString() {
		return "User [uno=" + uno + ", name=" + name + ", id=" + id + ", pw=" + pw + ", email=" + email + ", phone="
				+ phone + ", regdate=" + regdate + ", auth=" + auth + ", alertnum=" + alertnum + ", giturl=" + giturl
				+ ", giturlable=" + giturlable + ", tilurl=" + tilurl + ", tilurlable=" + tilurlable + ", content="
				+ content + ", open=" + open + "]";
	}
}
