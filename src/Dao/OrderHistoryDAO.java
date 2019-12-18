package Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Bean.OrderHistoryBEAN;

public class OrderHistoryDAO {
	Database db;
	
	public void setOrderHistory(ArrayList<OrderHistoryBEAN> lst) throws SQLException {
		db = new Database();
		String query = "INSERT INTO `order_history`(`userId`, `bookId`, `quantity`) VALUES (?,?,?)";
		PreparedStatement cmd = db.getConnection().prepareStatement(query);
		int count = 0;
		for(OrderHistoryBEAN item : lst) {
			cmd.setString(1, item.getUserId());
			cmd.setString(2, item.getBookId());
			cmd.setLong(3, item.getQuantity());
			count++;
			cmd.addBatch();
			if(count % 100 == 0 || count == lst.size()) {
				cmd.executeBatch(); // execute every 100 query or equal list size
			}
		}
	}
	
	public ArrayList<OrderHistoryBEAN> getOrderHistory(String userId) {
		db = new Database();
		String query = "SELECT orderHistoryId, bookId, bookName, order_history.quantity, date, confirmedOrder, price FROM `order_history` JOIN books ON order_history.bookId=books.id WHERE userId=?";
		PreparedStatement cmd;
		try {
			cmd = db.getConnection().prepareStatement(query);
			cmd.setString(1, userId);
			ResultSet rs = cmd.executeQuery();
			ArrayList<OrderHistoryBEAN> lstHistory = new ArrayList<OrderHistoryBEAN>();
			while(rs.next()) {
				lstHistory.add(new OrderHistoryBEAN(rs.getLong("orderHistoryId"), rs.getString("bookId"), rs.getInt("quantity"), rs.getString("bookName"), rs.getDate("date"), rs.getBoolean("confirmedOrder"), rs.getLong("price")));
			}
			
			return lstHistory;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public ArrayList<OrderHistoryBEAN> getPendingOrderHistory() {
		db = new Database();
		String query = "SELECT orderHistoryId, bookId, bookName, order_history.quantity, date, confirmedOrder, price, user.email FROM `order_history` JOIN books ON order_history.bookId=books.id JOIN user on user.id=order_history.userId WHERE confirmedOrder=0";
		PreparedStatement cmd;
		try {
			cmd = db.getConnection().prepareStatement(query);
			ResultSet rs = cmd.executeQuery();
			ArrayList<OrderHistoryBEAN> lstHistory = new ArrayList<OrderHistoryBEAN>();
			while(rs.next()) {
				lstHistory.add(new OrderHistoryBEAN(rs.getLong("orderHistoryId"), rs.getString("bookId"), rs.getInt("quantity"), rs.getString("bookName"), rs.getDate("date"), rs.getBoolean("confirmedOrder"), rs.getLong("price"), rs.getString("email")));
			}
			
			return lstHistory;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public void acceptOrder(String orderId) {
		db = new Database();
		String query = "UPDATE `order_history` SET `confirmedOrder`=1 WHERE orderHistoryId=?";
		PreparedStatement cmd;
		try {
			cmd = db.getConnection().prepareStatement(query);
			cmd.setString(1, orderId);
			cmd.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
