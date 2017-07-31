import java.sql.*;

/**
 * A class with a static method allowing easy printing of a 
 * <code>ResultSet</code> to the terminal. 
 *
 * @author	Franklin D. Worrell
 * @version	20 April 2017
 */ 
public class ResultSetDisplayer {
	/**
	 * Prints the results of a query passed in as a 
	 * <code>ResultSet</code> to the terminal in a reasonable
	 * format. 
	 *
	 * @param	results	the <code>ResultSet</code> to display
	 */ 
	public static void displayResults(ResultSet results) {
		System.out.println(); 		// Skip a line--make it all pretty. 
		
		try {
			ResultSetMetaData rsmd = results.getMetaData(); 
			int numberOfColumns = rsmd.getColumnCount(); 
			
			// Print column names. 
			for (int i = 1; i <= numberOfColumns; i++) {
				System.out.print(rsmd.getColumnName(i)); 
				if (i < numberOfColumns) {
					System.out.print(", "); 
				}
			} 
			
			// Move to the next line. 
			System.out.println(); 
			
			// Print results row-by-row. 
			while (results.next()) {
				for (int i = 1; i <= numberOfColumns; i++) {
					System.out.print(results.getString(i)); 
					if (i < numberOfColumns) {
						System.out.print(", "); 
					} 
				} 
				System.out.println(); 	// Skip to the next line. 
			} 
			
			System.out.println(); 		// Skip an extra line. 
		}
		
		catch (SQLException e) {
			e.printStackTrace(); 
		} 
	} // end method displayResults 
} // end class ResultSetDisplayer