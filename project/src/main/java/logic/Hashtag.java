package logic;

public class Hashtag {
	int no, wno, hno;
	String hashname;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getWno() {
		return wno;
	}
	public void setWno(int wno) {
		this.wno = wno;
	}
	public int getHno() {
		return hno;
	}
	public void setHno(int hno) {
		this.hno = hno;
	}
	public String getHashname() {
		return hashname;
	}
	public void setHashname(String hashname) {
		this.hashname = hashname;
	}
	@Override
	public String toString() {
		return "Hashtag [no=" + no + ", wno=" + wno + ", hno=" + hno + ", hashname=" + hashname + "]";
	}
	
}
