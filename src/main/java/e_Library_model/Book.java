package e_Library_model;

public class Book {
	
	private int id;
	private String title;
	private String author;
	private String genre;
	private String image;
	private String Download_link;
	
	
	public Book() {
	}

	
	public Book(int id, String title, String author, String genre, String image, String Download_link) {
		super();
		this.id = id;
		this.title = title;
		this.author = author;
		this.genre = genre;
		this.image = image;
		this.Download_link = Download_link;
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}
	
	

	public String getAuthor() {
		return author;
	}


	public void setAuthor(String author) {
		this.author = author;
	}


	public void setTitle(String title) {
		this.title = title;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getDownload_link() {
		return Download_link;
	}


	public void setDownload_link(String download_link) {
		Download_link = download_link;
	}


	@Override
	public String toString() {
		return "Product [id=" + id + ", title=" + title + ", author=" + author + ", genre=" + genre + ", image="
				+ image + "]";
	}

}
