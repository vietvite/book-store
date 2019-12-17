package Bo;

import java.util.ArrayList;

import Bean.BookBEAN;
import Dao.BookDAO;

public class BookBO {
	BookDAO book = new BookDAO();
	ArrayList<BookBEAN> lst;
	
	public ArrayList<BookBEAN> getBooks() {
		lst = book.getBooks();
		return lst;
	}
	
	public ArrayList<BookBEAN> findBookOrAuthor(String keyword) {
		ArrayList<BookBEAN> returnLst = book.findBookOrAuthor(keyword);
		return returnLst;
	}
	
	public BookBEAN findById(String bookId) {
		return book.findById(bookId); 
	}
}
