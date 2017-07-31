package controller;

import Model.BusinessSector;
import databaseapp.DBConnection;
import java.sql.*; 
import java.math.*; 
import oracle.jdbc.*; 
import java.util.ArrayList; 

/**
 *
 * @author  Franklin D. Worrell
 * @version 24 April 2017
 */
public class BusinessSectorQueries {
    private PreparedStatement getAllSectors; 
    
    public BusinessSectorQueries() {
        try {
            this.getAllSectors = DBConnection.getDBConnection().prepareStatement( 
                    "SELECT * FROM Business_Sector"); 
        } 
        
        catch (SQLException e) {
            e.printStackTrace(); 
        } 
    }
    
    public ArrayList<BusinessSector> getAllSectors() {
        ArrayList<BusinessSector> allSectors = new ArrayList<BusinessSector>(); 
        
        // Execute query and process results into ArrayList. 
        try (ResultSet queryResults = this.getAllSectors.executeQuery()) {
            while (queryResults.next()) {
                allSectors.add(new BusinessSector(
                    queryResults.getString("NAICS_code"), 
                    queryResults.getString("NAICS_description"))); 
            }
        }
        
        catch (SQLException e) {
            e.printStackTrace(); 
        }
        
        return allSectors; 
    } // end method getAllSectors
} // end class BusinessSectorQueries
