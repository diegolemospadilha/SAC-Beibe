
package com.beibe.sac.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author lemospadilha
 */
public class ConnectionFactory {
    public static Connection getConnection() throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{
        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        String str = "jdbc:mysql://localhost/beibe?autoReconnect=true&useSSL=false";
        Connection connection = DriverManager.getConnection(str, "root", "");
        return connection;
    }
        public static ResultSet getResultSet(Connection conn, String sql) throws SQLException {
		Statement statement = conn.createStatement();
		return statement.executeQuery(sql);
    }
	
    public static PreparedStatement getPreparedStatement(Connection conn, String sql) throws SQLException {
		return conn.prepareStatement(sql);
    }
}
