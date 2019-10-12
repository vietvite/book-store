package Bo;

import java.util.ArrayList;

import Bean.BookBEAN;
import Dao.BookDAO;

public class BookBO {
	BookDAO book = new BookDAO();
	
	public ArrayList<BookBEAN> getBooks() {
		return book.getBooks();
	}
}
