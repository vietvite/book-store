package Dao;

import java.sql.SQLException;

public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Database db = new Database();
		try {
			db.connect();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
