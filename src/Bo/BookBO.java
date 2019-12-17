package Bo;

import java.util.ArrayList;

import Bean.BookBEAN;
import Dao.BookDAO;

public class BookBO {
	BookDAO dao = new BookDAO();
	ArrayList<BookBEAN> lst;
	
	public ArrayList<BookBEAN> getBooks() {
		lst = dao.getBooks();
		return lst;
	}
	
	public ArrayList<BookBEAN> findBookOrAuthor(String keyword) {
		ArrayList<BookBEAN> returnLst = dao.findBookOrAuthor(keyword);
		return returnLst;
	}
	
	public BookBEAN findById(String bookId) {
		return dao.findById(bookId); 
	}
	
	public void deleteBook(String bookId) {
		dao.deleteBook(bookId);
	}

	public void editBook(BookBEAN book) {
		dao.editBook(book);
	}
	
	public void addBook(BookBEAN book) {
		dao.addBook(book);
	}
}
