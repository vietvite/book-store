package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class Database {
    String DB_USERNAME = "admin";
    String DB_PASSWORD = "987";
    String DB_DBNAME = "book_trading";
    String DB_URL = String.format("jdbc:mysql://localhost:3306/%s", DB_DBNAME);
    
    String DB_DRV = "com.mysql.jdbc.Driver";
    
    Connection conn = null;
    
    private void connect() throws SQLException, ClassNotFoundException {
        Class.forName(DB_DRV);
        conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
//        System.out.println("Database connnected!");
    }
    
    public Connection getConnection() {
    	if(this.conn == null) {
    		try {
				this.connect();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    		return this.conn;
    	}
    	return this.conn;
    }
    
    public void close() throws SQLException {
        conn.close();
//        System.out.println("Database connection closed!");
    }
    
    public ResultSet getAll(String dbName) throws SQLException {
        String query = "SELECT * FROM " + dbName;
        Statement cmd = conn.createStatement();
        ResultSet rs = cmd.executeQuery(query);
        return rs;
    }
}

