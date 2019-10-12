package Bo;

import java.util.ArrayList;

import Bean.CategoryBEAN;
import Dao.CategoryDAO;

public class CategoryBO {
	CategoryDAO category = new CategoryDAO();
	public ArrayList<CategoryBEAN> getAllCategories() {
		return category.getAllCategories();
	}
}
