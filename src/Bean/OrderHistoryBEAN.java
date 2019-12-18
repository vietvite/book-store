package Bean;

import java.util.Date;

public class OrderHistoryBEAN {
	long orderHistoryId;
	String userId;
	String bookId;
	int quantity;
	String bookName;
	Date date;
	boolean confirmedOrder;
	long price;
	String email;
	
	public OrderHistoryBEAN(String userId, String bookId, int quantity, Date date) {
		super();
		this.userId = userId;
		this.bookId = bookId;
		this.quantity = quantity;
		this.date = date;
	}

	public OrderHistoryBEAN(long orderHistoryId, String bookId, int quantity, String bookName,
			Date date, boolean confirmedOrder, long price, String email) {
		super();
		this.orderHistoryId = orderHistoryId;
		this.bookId = bookId;
		this.quantity = quantity;
		this.bookName = bookName;
		this.date = date;
		this.confirmedOrder = confirmedOrder;
		this.price = price;
		this.email = email;
	}
	public OrderHistoryBEAN(long orderHistoryId, String bookId, int quantity, String bookName,
			Date date, boolean confirmedOrder, long price) {
		super();
		this.orderHistoryId = orderHistoryId;
		this.bookId = bookId;
		this.quantity = quantity;
		this.bookName = bookName;
		this.date = date;
		this.confirmedOrder = confirmedOrder;
		this.price = price;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public long getPrice() {
		return price;
	}

	public void setPrice(long price) {
		this.price = price;
	}

	public boolean isConfirmedOrder() {
		return confirmedOrder;
	}

	public void setConfirmedOrder(boolean confirmedOrder) {
		this.confirmedOrder = confirmedOrder;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public long getOrderHistoryId() {
		return orderHistoryId;
	}

	public void setOrderHistoryId(long orderHistoryId) {
		this.orderHistoryId = orderHistoryId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getBookId() {
		return bookId;
	}

	public void setBookId(String bookId) {
		this.bookId = bookId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
}
