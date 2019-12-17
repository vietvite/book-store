package Bean;

import java.util.Date;

public class OrderHistoryBEAN {
	long orderHistoryId;
	String userId;
	String bookId;
	int quantity;
	Date date;
	
	public OrderHistoryBEAN(String userId, String bookId, int quantity, Date date) {
		super();
		this.userId = userId;
		this.bookId = bookId;
		this.quantity = quantity;
		this.date = date;
	}

	public OrderHistoryBEAN(long orderHistoryId, String userId, String bookId, int quantity, Date date) {
		super();
		this.orderHistoryId = orderHistoryId;
		this.userId = userId;
		this.bookId = bookId;
		this.quantity = quantity;
		this.date = date;
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
