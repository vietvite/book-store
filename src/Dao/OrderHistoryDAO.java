package Dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import Bean.OrderHistoryBEAN;

public class OrderHistoryDAO {
	Database db;
	
	public void setOrderHistory(ArrayList<OrderHistoryBEAN> lst) throws SQLException {
		db = new Database();
		String query = "INSERT INTO `order_history`(`userId`, `bookId`, `quantity`, `date`) VALUES (?,?,?,?)";
		PreparedStatement cmd = db.getConnection().prepareStatement(query);
		int count = 0;
		for(OrderHistoryBEAN item : lst) {
			cmd.setString(1, item.getUserId());
			cmd.setString(1, item.getBookId());
			cmd.setLong(1, item.getQuantity());
			cmd.setDate(1, new java.sql.Date(item.getDate().getTime()));
			count++;
			
			if(count % 100 == 0 || count == lst.size()) {
				cmd.executeBatch(); // execute every 100 query or equal list size
			}
		}
	}
}
