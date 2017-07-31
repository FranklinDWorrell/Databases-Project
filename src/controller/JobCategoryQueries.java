package controller;

import Model.JobCategory;
import databaseapp.DBConnection;
import java.sql.*; 
import java.math.*; 
import oracle.jdbc.*; 
import java.util.ArrayList; 

/**
 *
 * @author  Franklin D. Worrell
 * @version 23 April 2017 
 */
public class JobCategoryQueries {
    private PreparedStatement getAllCategories; 
    private PreparedStatement getAllLeafNodeCategories; 
    private PreparedStatement getCompanyLeafNodes; 
    
    public JobCategoryQueries() {
        try {
            this.getAllCategories = DBConnection.getDBConnection().prepareStatement( 
                "SELECT * FROM Job_Category"); 
            this.getAllLeafNodeCategories = DBConnection.getDBConnection().prepareStatement(
                "SELECT * " + 
                "FROM Job_Category NATURAL JOIN (( " + 
                    "SELECT SOC_code " + 
                    "FROM Job_Category) " + 
                    "MINUS ( " + 
                    "SELECT DISTINCT parent_SOC " + 
                    "FROM Parent_Category))"); 
            this.getCompanyLeafNodes = DBConnection.getDBConnection().prepareStatement(
                "WITH Leaf_Node_Category (SOC_code, SOC_description) AS ( " + 
                    "SELECT * FROM Job_Category NATURAL JOIN (( " + 
                        "SELECT SOC_code " + 
                        "FROM Job_Category) " + 
                        "MINUS ( " + 
                        "SELECT DISTINCT parent_SOC " + 
                        "FROM Parent_Category))) " + 
                "SELECT DISTINCT SOC_code, SOC_description " + 
                "FROM Leaf_Node_Category NATURAL JOIN Job NATURAL JOIN " + 
                        "Categorizes_Job " + 
                "WHERE company_id = ?"); 
        } 
        
        catch (SQLException e) {
            e.printStackTrace(); 
        } 
    }
    
    public ArrayList<JobCategory> getAllCategories() {
        ArrayList<JobCategory> allCategories = new ArrayList<JobCategory>(); 
        
        // Execute query and process results into ArrayList. 
        try (ResultSet queryResults = this.getAllCategories.executeQuery()) {
            while (queryResults.next()) {
                allCategories.add(new JobCategory(
                    queryResults.getString("SOC_code"), 
                    queryResults.getString("SOC_description"))); 
            }
        }
        
        catch (SQLException e) {
            e.printStackTrace(); 
        }
        
        return allCategories; 
    } // end method getAllCategories
    
    
    /**
     * 
     * @return 
     */
    public ArrayList<JobCategory> getCompanyLeafNodes(String companyID) {
        ArrayList<JobCategory> allCategories = new ArrayList<JobCategory>(); 
        ResultSet queryResults = null; 
        // Execute query and process results into ArrayList. 
        try {
            this.getCompanyLeafNodes.setString(1, companyID); 
            queryResults = this.getCompanyLeafNodes.executeQuery();
            while (queryResults.next()) {
                allCategories.add(new JobCategory(
                    queryResults.getString("SOC_code"), 
                    queryResults.getString("SOC_description"))); 
            }
        }
        
        catch (SQLException e) {
            e.printStackTrace(); 
        }
        
        return allCategories; 
    } // end method getCompanyLeafNodes
} // end class JobCategoryQueries
