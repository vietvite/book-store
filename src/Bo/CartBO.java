package Bo;

import java.util.ArrayList;

import Bean.CartBEAN;

public class CartBO {
	public ArrayList<CartBEAN> cartList = new ArrayList<CartBEAN>();
	
	public void addCart(String bookId, String bookName, String author, long price, int quantity) {
		CartBEAN cart = new CartBEAN(bookId, bookName, author, price, quantity);
		cartList.add(cart);
	}
	
	public long sum() {
		long sum = 0;
		for(CartBEAN c: cartList) {
			sum += c.getTotalPrice();
		}
		return sum;
	}
}
