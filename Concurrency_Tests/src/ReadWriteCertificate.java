import java.sql.*; 
import java.util.Scanner; 

/**
 * For use in the concurrency tests that deal with interrupting
 * a read-write transaction. Must be used in conjuction with either
 * <code>ReadCertificate</code> or <code>WriteCertificate</code>.
 *
 * @author 	Franklin D. Worrell
 * @version	30 April 2017
 */ 
public class ReadWriteCertificate {
	PreparedStatement getName; 
	PreparedStatement updateCertificate; 
	
	
	/**
	 * Initializes each <code>PreparedStatement</code> used in
	 * this part of the first concurrency test.
	 */ 
	private ReadWriteCertificate() {
		try {
			this.getName = DBConnection.getDBConnection().prepareStatement(
				"SELECT certificate_name FROM Certificate " + 
					"WHERE certificate_code = '110005'"); 
			this.updateCertificate = DBConnection.getDBConnection().prepareStatement(
				"UPDATE Certificate " + 
				"SET certificate_name = 'Microsoft Certified Solutions " + 
					"Associate: SQL Server 2012/2014/2017' " + 
				"WHERE certificate_code = '110005'"); 
		} 
		
		catch (SQLException e) {
			e.printStackTrace(); 
		} 
	} // end Constructor
	
	
	/**
	 * Creates a new instance of the class and runs the test. The
	 * program takes a command-line argument, an integer value that is
	 * the constant associated with one of the five transaction isolation
	 * levels in the Java SQL implementation. 
	 */ 
	public static void main(String[] args) {
		ReadWriteCertificate readAndUpdate = new ReadWriteCertificate(); 
		readAndUpdate.runTest(Integer.parseInt(args[0])); 
	} // end method main


	/**
	 * Attempts to update the database after checking a value. Pauses
	 * between the read and the update During this pause, the user should 
	 * run the <code>WriteCertificate</code> or <code>ReadCertificate</code> 
	 * program in this folder. 
	 *
	 * @param	isolationLevel	the desire Transaction Isolation Level
	 */ 
	private void runTest(int isolationLevel) {
		try {
			DBConnection.getDBConnection().setAutoCommit(false);
			DBConnection.getDBConnection().setTransactionIsolation(
				isolationLevel); 
			this.readCertificateName(); 
			this.pauseForInput(); 
			this.updateCertificateName(); 
			System.out.println("Attempting to commit changes..."); 
			DBConnection.getDBConnection().commit(); 
		} 
		
		catch (SQLException e) {
			e.printStackTrace(); 
			
			try {
				System.out.println("Attempting Rollback..."); 
				DBConnection.getDBConnection().rollback(); 
			} 
			
			catch (SQLException exception) {
				System.out.println("Rollback failed."); 
				exception.printStackTrace();
			} 
		} 
		
		// Irrespective of what happens above, AutoCommit should be turned back on. 
		finally {
			try {
				DBConnection.getDBConnection().setAutoCommit(true); 
			} 
			
			catch (SQLException e) {
				System.out.println("Error resetting AutoCommit after test."); 
				e.printStackTrace(); 
			} 
		} 
	} // end method runTest
	
	
	/**
	 * Performs a read from the database by querying a certificate's name. 
	 */ 
	private void readCertificateName() {
		try {
			ResultSet result = this.getName.executeQuery(); 
			ResultSetDisplayer.displayResults(result); 
		}
		
		catch (SQLException e) {
			e.printStackTrace(); 
		} 
	} // end method performToolInsert
	
	
	/**
	 * Performs an update on a row in the Certificate table. 
	 */ 
	private void updateCertificateName() {
		try {
			int rowsChanged = this.updateCertificate.executeUpdate(); 
			System.out.println("Changed " + rowsChanged + " in Certificate table."); 
		}
		
		catch (SQLException e) {
			e.printStackTrace(); 
		} 	
	} // end method updateCertificateName
	
	
	/**
	 * Pauses the program by waiting for an input from the user.
	 */ 
	private void pauseForInput() {
		System.out.println("Please open a new terminal and run either " + 
							"ReadCertificate or WriteCertificate."); 
		System.out.println("Please press enter to confirm and continue."); 
		Scanner input = new Scanner(System.in); 
		input.nextLine(); 		
	} // end method pauseForInput
} // end class ReadWriteCertificate