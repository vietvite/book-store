package Dao;

import java.util.ArrayList;

import Bean.CategoryBEAN;

public class CategoryDAO {
	public ArrayList<CategoryBEAN> getAllCategories() {
		ArrayList<CategoryBEAN> categories = new ArrayList<CategoryBEAN>();
		categories.add(new CategoryBEAN("vanhoc", "Văn học"));
		categories.add(new CategoryBEAN("quantri", "Quản trị"));
		categories.add(new CategoryBEAN("kynang", "Kỹ năng"));
		categories.add(new CategoryBEAN("kinhte", "Kinh tế"));
		
		return categories;
	}
}
