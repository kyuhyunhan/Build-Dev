package logic;

public class Tag {
	private int no;
	private int wno;
	private int tno;
	private int prono; 
	private String tag;
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
	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
	}
	public int getProno() {
		return prono;
	}
	public void setProno(int prono) {
		this.prono = prono;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	@Override
	public String toString() {
		return "Tag [no=" + no + ", wno=" + wno + ", tno=" + tno + ", prono=" + prono + ", tag=" + tag + "]";
	}
	
}
