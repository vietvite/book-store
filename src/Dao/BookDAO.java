package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import Bean.BookBEAN;

public class BookDAO {
	Connection conn;
	BookBEAN book;
	Database db;
	
	ArrayList<BookBEAN> books = null;
	
//	public ArrayList<BookBEAN> getBooks() {
//		books = new ArrayList<BookBEAN>();
//		
//		books.add(new BookBEAN("B01", "Hai số phận", "Jeffrey Archer", "Mô tả của Hai số phận", "vanhoc", (long) 120000, (long) 90000, 100, "images/books/haisophan.jpg"));
//		books.add(new BookBEAN("B02", "Suối nguồn", "Ayn Rand", "Mô tả của Suối nguồn", "vanhoc", (long) 120000, (long) 90000, 100, "images/books/suoinguon.jpg"));
//		books.add(new BookBEAN("B03", "Bá tước Monte Cristo", "Alexander Dumas", "Mô tả của Bá tước Monte Cristo", "vanhoc", (long) 120000, (long) 90000, 100, "images/books/batuocmontecristo.jpg"));
//		books.add(new BookBEAN("B04", "Một đời quản trị", "Phan Văn Trường", "Mô tả của Một đời quản trị", "quantri", (long) 120000, (long) 90000, 100, "images/books/motdoiquantri.jpg"));
//		books.add(new BookBEAN("B05", "Một đời thương thuyết", "Phan Văn Trường", "Mô tả của Một đời thương thuyết", "quantri", (long) 120000, (long) 90000, 100, "images/books/motdoithuongthuyet.jpg"));
//		books.add(new BookBEAN("B06", "Một nửa của 13 là 8", "Jack Foster", "Mô tả của Một nửa của 13 là 8", "kynang", (long) 120000, (long) 90000, 100, "images/books/motnuacua13la8.jpg"));
//		books.add(new BookBEAN("B07", "Nhà giả kim", "Paulo Coelho", "Mô tả của Nhà giả kim", "vanhoc", (long) 120000, (long) 90000, 100, "images/books/nhagiakim.jpg"));
//		books.add(new BookBEAN("B08", "Bài giảng cuối cùng", "Randy Pausch", "Mô tả của Bài giảng cuối cùng", "kynang", (long) 120000, (long) 90000, 100, "images/books/baigiangcuoicung.jpg"));
//		
//		return books;
//	}
	
	public ArrayList<BookBEAN> getBooks() {
		books = new ArrayList<BookBEAN>();
		try {
			db = new Database();
			String query = "SELECT * FROM `books`";
			Statement cmd = db.getConnection().createStatement();
			
			ResultSet rs = cmd.executeQuery(query);
			
			while(rs.next()) {
				book = new BookBEAN(rs.getString("id"), rs.getString("bookName"), rs.getString("author"),
						rs.getString("description"), rs.getString("categoryId"), rs.getLong("coverPrice"), 
						rs.getLong("price"), rs.getInt("quantity"), rs.getString("imageUrl"));
				books.add(book);
			}
			db.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
//			System.out.println("SQLException");
		}
		
		return books;
	}
	
	public BookBEAN findById(String bookId) {
		BookBEAN book = null;
		try {
			db = new Database();
			String query = "SELECT * FROM `books` WHERE id=?";
			PreparedStatement cmd = db.getConnection().prepareStatement(query);
			cmd.setString(1, bookId);
//			tach ra lam tham so de truyen vao
			
			ResultSet rs = cmd.executeQuery();
			if(rs.next()) {
				book = new BookBEAN(
						rs.getString("id"), 
						rs.getString("bookName"), 
						rs.getString("author"), 
						rs.getString("description"), 
						rs.getString("categoryId"), 
						rs.getLong("coverPrice"),
						rs.getLong("price"),
						rs.getInt("quantity"),
						rs.getString("imageUrl"));
			}
			db.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return book;
	}

	public ArrayList<BookBEAN> findBookOrAuthor(String keyword) {
		return null;
	}
}









































