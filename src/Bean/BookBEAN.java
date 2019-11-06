package Bean;

public class BookBEAN {
	private String id;
	private String bookName;
	private String author;
	private String description;
	private String categoryId;
	private Long coverPrice;
	private Long price;
	private int quantity;
	private String imageUrl;
	
	public BookBEAN() {
	}

	public BookBEAN(String id, String bookName, String author, String description, String categoryId, Long coverPrice,
			Long price, Integer quantity, String imageUrl) {
		super();
		this.id = id;
		this.bookName = bookName;
		this.author = author;
		this.description = description;
		this.categoryId = categoryId;
		this.coverPrice = coverPrice;
		this.price = price;
		this.quantity = quantity;
		this.imageUrl = imageUrl;
		
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public Long getCoverPrice() {
		return coverPrice;
	}

	public void setCoverPrice(Long coverPrice) {
		this.coverPrice = coverPrice;
	}

	public Long getPrice() {
		return price;
	}

	public void setPrice(Long price) {
		this.price = price;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
}
