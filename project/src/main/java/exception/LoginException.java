package exception;

public class LoginException extends RuntimeException {
	private String url;
	public LoginException(String msg, String url) {
		super(msg);
		this.url = url;
	}
	public String getUrl() {
		return url;
	}
}
