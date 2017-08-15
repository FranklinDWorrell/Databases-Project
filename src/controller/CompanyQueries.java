package controller;

import model.Company;
import databaseapp.DBConnection;
import java.sql.*; 
import java.math.*; 
import oracle.jdbc.*; 
import java.util.ArrayList; 

/**
 * Manages database queries concerning <code>Company</code>
 * objects. 
 * 
 * @author  Franklin D. Worrell
 * @version 23 April 2017
 */
public class CompanyQueries {
    private PreparedStatement getAllCompanies; 
    
    public CompanyQueries() {
        try {
            this.getAllCompanies = DBConnection.getDBConnection().prepareStatement( 
                    "SELECT * FROM Company"); 
        } 
        
        catch (SQLException e) {
            e.printStackTrace(); 
        } 
    }
    
    public ArrayList<Company> getAllCompanies() {
        ArrayList<Company> allCompanies = new ArrayList<Company>(); 
        
        // Execute query and process results into ArrayList. 
        try (ResultSet queryResults = this.getAllCompanies.executeQuery()) {
            while (queryResults.next()) {
                allCompanies.add(new Company(
                    queryResults.getString("company_id"), 
                    queryResults.getString("company_name"), 
                    queryResults.getString("c_street_no"), 
                    queryResults.getString("c_street_name"), 
                    queryResults.getString("c_unit_no"), 
                    queryResults.getString("c_city"), 
                    queryResults.getString("c_state"), 
                    queryResults.getString("c_zip"), 
                    queryResults.getString("company_website"), 
                    queryResults.getString("primary_sector"))); 
            }
        }
        
        catch (SQLException e) {
            e.printStackTrace(); 
        }
        
        return allCompanies; 
    } // end method getAllCompanies
} // end class CompanyQueries
