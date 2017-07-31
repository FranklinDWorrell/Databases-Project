package databaseapp;

import java.sql.*; 
import java.math.*; 
import oracle.jdbc.*; 

/**
 * Contains static method to create and return a <code>Connection</code> 
 * to a database. Set up as singleton because of problems with connection
 * being closed. 
 *
 * @author	Franklin D. Worrell
 * @version	23 April 2017
 */ 
public class DBConnection {
    private static final String PROTOCOL = "jdbc:oracle:thin";
    private static final String LOCATION = ""; 
    private static final String PORT = ""; 
    private static final String SID = "orcl"; 
    private static String username = ""; 
    private static String password = "";
    private static Connection connection = null;     // for Singleton 

	/**
	 * Establishes a <code>Connection</code> to the prescribed 
	 * database using the username and password passed in as 
	 * parameters. Returns a reference to that <code>Connection</code>. 
	 * @throws	SQLException
	 * @return	a new Connection to the database for the project
	 */ 
	public static Connection getDBConnection() throws SQLException { 
            if ((connection == null) || (connection.isClosed())) {
		// Register the JDBC driver. 
		DriverManager.registerDriver(new OracleDriver()); 
		
		// Construct the url for the database.  
		String url = PROTOCOL + ":@" + LOCATION + ":" + PORT + ":" + SID; 
		
		// Create and return the connection. 
		connection = DriverManager.getConnection(url, username, 
			password); 
            }
            
            return connection; 
	} // end method getDBConnection
} // end class DBConnection