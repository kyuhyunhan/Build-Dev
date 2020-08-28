package logic;

public class Subscribe {

	String Scrapper;
	String Scrapped;


	public String getScrapper() {
		return Scrapper;
	}

	public void setScrapper(String scrapper) {
		Scrapper = scrapper;
	}

	public String getScrapped() {
		return Scrapped;
	}

	public void setScrapped(String scrapped) {
		Scrapped = scrapped;
	}

	@Override
	public String toString() {
		return "Subscribe [Scrapper=" + Scrapper + ", Scrapped=" + Scrapped + "]";
	}

}
