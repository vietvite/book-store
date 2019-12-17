package Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Bean.UserBEAN;

public class UserDAO {
	Database db;
	public UserBEAN login(String email, String password) {
		UserBEAN user = null;
		try {
			db = new Database();
			String query = "SELECT * FROM `user` WHERE email=? AND password=?";
			PreparedStatement cmd = db.getConnection().prepareStatement(query);
			cmd.setString(1, email);
			cmd.setString(2, password);

			ResultSet rs = cmd.executeQuery();
			if(rs.next()) {
				user = new UserBEAN(rs.getString("id"), rs.getString("username"), rs.getString("email"), rs.getString("password"), rs.getString("role"));
			}
//			Database.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
}
