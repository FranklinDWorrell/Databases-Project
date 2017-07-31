import java.sql.*; 

/**
 * Performs the interrupting read operation for the concurrency 
 * control tests. 
 * 
 * @author 	Franklin D. Worrell
 * @version	30 April 2017
 */ 
public class ReadCertificate {
	PreparedStatement getName; 
	
	
	/**
	 * Initializes <code>PreparedStatement</code> used by this
	 * part of the first concurrency control test. 
	 */ 
	private ReadCertificate() {
		try {
			this.getName = DBConnection.getDBConnection().prepareStatement(
				"SELECT certificate_name FROM Certificate " + 
					"WHERE certificate_code = '110005'"); 
		} 
		
		catch (SQLException e) {
			e.printStackTrace(); 
		} 
	} // end Constructor 
	
	
	/**
	 * Executes this half of the first concurrency control test. 
	 */ 
	public static void main(String[] args) {
		ReadCertificate asker = new ReadCertificate(); 
		asker.runTest(); 
	} // end method main 
	
	
	/**
	 * Performs a read from the database by querying a certificate's name
	 * and displays the result to the terminal. 
	 */ 
	private void runTest() {
		try {
			DBConnection.getDBConnection().setAutoCommit(true); 
			ResultSet result = this.getName.executeQuery(); 
			ResultSetDisplayer.displayResults(result); 
		} 
		
		catch (SQLException e) {
			e.printStackTrace(); 
		} 
	} // end method runTest
} // end class ReadCertificate 