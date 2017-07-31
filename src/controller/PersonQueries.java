package controller;

import Model.Person;
import databaseapp.DBConnection;
import java.sql.*; 
import java.math.*; 
import oracle.jdbc.*; 
import java.util.ArrayList; 

/**
 * Manages database queries concerning <code>Person</code> 
 * objects. 
 * 
 * @author  Franklin D. Worrell
 * @version 23 April 2017
 */
public class PersonQueries {
    private PreparedStatement getAllPersons; 
    private PreparedStatement getCurrentEmployees; 
    private PreparedStatement getCurrentByCategory; 
    private PreparedStatement insertNewPerson; 
    private PreparedStatement getQualified; 
    private PreparedStatement getQualifiedWithinThreshold; 
    
    public PersonQueries() {
        try {
            this.getAllPersons = DBConnection.getDBConnection().prepareStatement( 
                "SELECT * FROM Person"); 
            this.getCurrentEmployees  = DBConnection.getDBConnection().prepareStatement(
                "SELECT person_id, last_name, first_name, job_title, job_code " + 
                "FROM Person NATURAL JOIN Works NATURAL JOIN Job " + 
                "WHERE company_id = ? AND end_date IS NULL"); 
            this.getCurrentByCategory = DBConnection.getDBConnection().prepareStatement(
                "SELECT person_id, last_name, first_name, job_title, SOC_description " + 
                "FROM Person NATURAL JOIN Works NATURAL JOIN " + 
                    "Job NATURAL JOIN Categorizes_Job NATURAL JOIN Job_Category " + 
                "WHERE company_id = ? AND SOC_description = ? AND end_date IS NULL"); 
            this.insertNewPerson = DBConnection.getDBConnection().prepareStatement(
                "INSERT INTO Person (person_id, first_name, middle_name, " + 
                "last_name, p_street_no, p_street_name, p_unit_no, p_city, " + 
                "p_state, p_zip, email, gender) VALUES (?, ?, ?, ?, ?, ?, " + 
                "?, ?, ?, ?, ?, ?) "); 
            this.getQualified = DBConnection.getDBConnection().prepareStatement(
                RequiredQueries.QUERY_15);  
            this.getQualifiedWithinThreshold = DBConnection.getDBConnection().prepareStatement(
                "WITH " + 
                "Job_Requires(ks_code) AS ( " + 
                        "SELECT ks_code " + 
                        "FROM Requires_Skill " + 
                        "WHERE job_code = ?), " + 
                "All_With_All_Required(person_id, ks_code) AS ( " + 
                        "SELECT person_id, ks_code " + 
                        "FROM Job_Requires, (SELECT person_id FROM Person)), " + 
                "Lacks_Skill(person_id, ks_code) AS (	" + 
                        "SELECT person_id, ks_code " + 
                        "FROM (( " + 
                                "SELECT person_id, ks_code " + 
                                "FROM All_With_All_Required) " + 
                                "MINUS ( " + 
                                "SELECT person_id, ks_code " + 
                                "FROM Has_Skill))) " + 
                "SELECT person_id, last_name, first_name, middle_name, email " + 
                "FROM Person NATURAL JOIN ( " + 
                        "SELECT person_id, COUNT(ks_code) AS no_ks_missing " + 
                        "FROM Lacks_Skill " + 
                        "GROUP BY person_id) " + 
                "WHERE no_ks_missing <= ?"); 
        } // end try block 
        
        catch (SQLException e) {
            e.printStackTrace(); 
        } 
    } // end Constructor
    
    public ArrayList<Person> getAllPersons() {
        ArrayList<Person> everyone = new ArrayList<Person>(); 
        
        // Execute query and process results into ArrayList. 
        try (ResultSet queryResults = this.getAllPersons.executeQuery()) {
            while (queryResults.next()) {
                everyone.add(new Person(
                    queryResults.getString("person_id"), 
                    queryResults.getString("first_name"), 
                    queryResults.getString("middle_name"), 
                    queryResults.getString("last_name"), 
                    queryResults.getString("p_street_no"), 
                    queryResults.getString("p_street_name"), 
                    queryResults.getString("p_unit_no"), 
                    queryResults.getString("p_city"), 
                    queryResults.getString("p_state"), 
                    queryResults.getString("p_zip"), 
                    queryResults.getString("email"), 
                    queryResults.getString("gender"))); 
            }
        }
        
        catch (SQLException e) {
            e.printStackTrace(); 
        }
        
        return everyone; 
    } // end method getAllPersons 
    
    
    /**
     * Returns the current employees of a company with information
     * about the people and about their jobs.
     * 
     * @param   companyID   the ID of the company whose employees are sought
     * @return  the results of the query as a ResultSet
     */
    public ResultSet getCurrentEmployees(String companyID) {
        ResultSet results = null; 
        try {
            this.getCurrentEmployees.setString(1, companyID); 
            results = this.getCurrentEmployees.executeQuery(); 
        } 
        
        catch (SQLException e) {
            e.printStackTrace(); 
        }
        
        return results; 
    } // end method getCurrentEmployees
    
    
    /**
     * Returns the current employees of a company with information
     * about the people and about their jobs.
     * 
     * @param   companyID   the ID of the company whose employees are sought
     * @return  the results of the query as a ResultSet
     */
    public ResultSet getCurrentByCategory(String companyID, String SOCDescription) {
        ResultSet results = null; 
        try {
            this.getCurrentByCategory.setString(1, companyID); 
            this.getCurrentByCategory.setString(2, SOCDescription); 
            results = this.getCurrentByCategory.executeQuery(); 
        } 
        
        catch (SQLException e) {
            e.printStackTrace(); 
        }
        
        return results; 
    } // end method getCurrentEmployees


    /**
     *  Adds a new person into the database. 
     * 
     * @param   personID 
     * 
     */
    public int addPerson(String personID,  
                         String firstName, 
                         String middleName, 
                         String lastName, 
                         String pStreetNo, 
                         String pStreetName, 
                         String pUnitNo,
                         String pCity, 
                         String pState, 
                         String pZip, 
                         String email, 
                         String gender) {
        int numberInserted = 0; 
        
        try {
            this.insertNewPerson.setString(1, personID);
            this.insertNewPerson.setString(2, firstName);
            this.insertNewPerson.setString(3, middleName);
            this.insertNewPerson.setString(4, lastName);
            this.insertNewPerson.setString(5, pStreetNo);
            this.insertNewPerson.setString(6, pStreetName);
            this.insertNewPerson.setString(7, pUnitNo);
            this.insertNewPerson.setString(8, pCity);
            this.insertNewPerson.setString(9, pState);
            this.insertNewPerson.setString(10, pZip);
            this.insertNewPerson.setString(11, email);
            this.insertNewPerson.setString(12, gender);

            numberInserted = this.insertNewPerson.executeUpdate(); 
        }
        
        catch (SQLException e) {
            e.printStackTrace(); 
        }
        
        return numberInserted; 
    } // end method addPerson
    
    
    /**
     * 
     * @param   JC
     * @return  the ResultSet returned by the query 
     */
    public ResultSet getQualified(String JC) {
        ResultSet results = null; 
        
        try {
            this.getQualified.setString(1, JC);
            this.getQualified.setString(2, JC);
            results = this.getQualified.executeQuery(); 
        } 
        
        catch (SQLException e) {
            e.printStackTrace(); 
        }
        
        return results; 
    } // end method getQualified
    
    
    /**
     * 
     * @param   JC
     * @param   k
     * @return  the ResultSet returned by the query 
     */
    public ResultSet getQualifiedWithinThreshold(String JC, int k) {
        ResultSet results = null; 
        
        try {
            this.getQualifiedWithinThreshold.setString(1, JC); 
            this.getQualifiedWithinThreshold.setInt(2, k); 
            results = this.getQualifiedWithinThreshold.executeQuery(); 
        }
        
        catch (SQLException e) {
            e.printStackTrace(); 
        }
        
        return results; 
    } // end method getQualifiedWithinThreshold
} // end class PersonQueries 
