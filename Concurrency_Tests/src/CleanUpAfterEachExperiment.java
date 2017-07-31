import java.sql.*; 

/**
 * Used to clean up the database after running the all of the experiments
 * in concurrency control.
 *
 * @author	Franklin D. Worrell
 * @version	30 April 2017
 */ 
public class CleanUpAfterEachExperiment {
	/**
	 * Calls the method that does the actual database clean up. 
	 */
	public static void main(String[] args) {
		cleanUp(); 
	} // end method main

	/**
	 * Cleans up the database after experiment. Undoes all updates and deletes
	 * all inserts. 
	 */ 
	private static void cleanUp() {
		try {
			DBConnection.getDBConnection().setAutoCommit(true); 
			PreparedStatement undoUpdateCertificate = DBConnection.getDBConnection(
				).prepareStatement(
					"UPDATE Certificate " + 
					"SET certificate_name = 'Microsoft Certified Solutions " + 
						"Associate: SQL Server 2012/2014' " + 
					"WHERE certificate_code = '110005'"); 
					
			undoUpdateCertificate.executeUpdate(); 
		} 
		
		catch (SQLException e) {
			e.printStackTrace(); 
		} 
	} // end method cleanUp
} // end class CleanUpAfterEachExperiment