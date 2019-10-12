package Dao;

import java.util.ArrayList;

import Bean.BookBEAN;

public class BookDAO {
	public ArrayList<BookBEAN> getBooks() {
		ArrayList<BookBEAN> books = new ArrayList<BookBEAN>();
		books.add(new BookBEAN("B01", "Hai số phận", "Jeffrey Archer", "Mô tả của Hai số phận", "vanhoc", (long) 120000, (long) 90000, 100, "images/books/haisophan.jpg"));
		books.add(new BookBEAN("B01", "Suối nguồn", "Ayn Rand", "Mô tả của Suối nguồn", "vanhoc", (long) 120000, (long) 90000, 100, "images/books/suoinguon.jpg"));
		books.add(new BookBEAN("B01", "Bá tước Monte Cristo", "Alexander Dumas", "Mô tả của Bá tước Monte Cristo", "vanhoc", (long) 120000, (long) 90000, 100, "images/books/batuocmontecristo.jpg"));
		books.add(new BookBEAN("B01", "Một đời quản trị", "Phan Văn Trường", "Mô tả của Một đời quản trị", "quantri", (long) 120000, (long) 90000, 100, "images/books/motdoiquantri.jpg"));
		books.add(new BookBEAN("B01", "Một đời thương thuyết", "Phan Văn Trường", "Mô tả của Một đời thương thuyết", "quantri", (long) 120000, (long) 90000, 100, "images/books/motdoithuongthuyet.jpg"));
		books.add(new BookBEAN("B01", "Một nửa của 13 là 8", "Jack Foster", "Mô tả của Một nửa của 13 là 8", "kynang", (long) 120000, (long) 90000, 100, "images/books/motnuacua13la8.jpg"));
		books.add(new BookBEAN("B01", "Nhà giả kim", "Paulo Coelho", "Mô tả của Nhà giả kim", "vanhoc", (long) 120000, (long) 90000, 100, "images/books/nhagiakim.jpg"));
		books.add(new BookBEAN("B01", "Bài giảng cuối cùng", "Randy Pausch", "Mô tả của Bài giảng cuối cùng", "kynang", (long) 120000, (long) 90000, 100, "images/books/baigiangcuoicung.jpg"));
		
		return books;
	}
}
