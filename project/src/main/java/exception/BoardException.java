package exception;

public class BoardException extends RuntimeException {

	
	private String url;
	public BoardException(String msg , String url) {
		super(msg);
		this.url=url;
	}
	public String getUrl() {
		return url;
	}
}
