package Bo;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import Bean.CartBEAN;
import Bean.OrderHistoryBEAN;
import Bean.UserBEAN;
import Dao.OrderHistoryDAO;

public class OrderHistoryBO {
	OrderHistoryDAO dao = new OrderHistoryDAO();
	
	public void setOrderHistory(UserBEAN user, ArrayList<CartBEAN> lstCart) {
		ArrayList<OrderHistoryBEAN> lstOrder = new ArrayList<OrderHistoryBEAN>();
		for(CartBEAN c: lstCart) {
			lstOrder.add(new OrderHistoryBEAN(user.getId(), c.getBookId(), c.getQuantity(), new Date()));
		}
		try {
			dao.setOrderHistory(lstOrder);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<OrderHistoryBEAN> getOrderHistory(String userId) {
		return dao.getOrderHistory(userId);
	}
	
	public ArrayList<OrderHistoryBEAN> getPendingOrderHistory() {
		return dao.getPendingOrderHistory();
	}
	
	public void acceptOrder(String orderId) {
		dao.acceptOrder(orderId);
	}
}
