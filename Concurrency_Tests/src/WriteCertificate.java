import java.sql.*; 

/**
 * Performs the interrupting write operation for the concurrency
 * control tests. 
 * 
 * @author 	Franklin D. Worrell
 * @version	30 April 2017
 */ 
public class WriteCertificate {
	PreparedStatement updateCertificate; 
	
	
	/**
	 * Initializes <code>PreparedStatement</code> used by this
	 * part of the first concurrency control test. 
	 */ 
	private WriteCertificate() {
		try {
			this.updateCertificate = DBConnection.getDBConnection().prepareStatement(
				"UPDATE Certificate " + 
				"SET certificate_name = 'A Prettier Named Skill " + 
					"Associate: SQL Server 2012/2014/2017' " + 
				"WHERE certificate_code = '110005'"); 
		} 
		
		catch (SQLException e) {
			e.printStackTrace(); 
		} 
	} // end Constructor 
	
	
	/**
	 * Executes this half of the concurrency control test. 
	 */ 
	public static void main(String[] args) {
		WriteCertificate writer = new WriteCertificate(); 
		writer.runTest(); 
	} // end method main 
	
	
	/**
	 * Executes update on same row of Certificate table as that
	 * updated by <code>ReadWriteCertificate</code> and prints the
	 * result of the transaction to the terminal. 
	 */ 
	private void runTest() {
		try {
			DBConnection.getDBConnection().setAutoCommit(true); 
			int rowsChanged = this.updateCertificate.executeUpdate(); 
			System.out.println("Changed " + rowsChanged + " in Certificate."); 
		} 
		
		catch (SQLException e) {
			e.printStackTrace(); 
		} 
	} // end method runTest
} // end class WriteCertificate 