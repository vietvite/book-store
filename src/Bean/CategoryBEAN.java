package Bean;

public class CategoryBEAN {
	private String id;
	private String categoryName;
	
	public CategoryBEAN(String id, String categoryName) {
		super();
		this.id = id;
		this.categoryName = categoryName;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
}
