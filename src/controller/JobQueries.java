package controller;

import model.Job;
import databaseapp.DBConnection;
import java.sql.*; 
import java.math.*; 
import oracle.jdbc.*; 
import java.util.ArrayList; 

/**
 *
 * @author  Franklin D. Worrell
 * @version 30 April 2017
 */
public class JobQueries {
    private PreparedStatement getAllJobs; 
    private PreparedStatement getOpenPositions; 
    private PreparedStatement getOpenAtCompany; 
    private PreparedStatement getOpenMatchingSkills; 
    private PreparedStatement getOpenAlmostSkills; 
    private PreparedStatement getIdealPositions; 
    
    /**
     * 
     */
    public JobQueries() {
        try {
            this.getAllJobs = DBConnection.getDBConnection().prepareStatement( 
                    "SELECT * FROM Job"); 
            
            this.getOpenPositions = DBConnection.getDBConnection().prepareStatement(
                "WITH Filled_Jobs (job_code) AS ( " + 
                    "SELECT job_code FROM Works WHERE end_date IS NULL) " + 
                "SELECT * " + 
                "FROM Job NATURAL JOIN (( " + 
                    "SELECT job_code FROM Job) MINUS ( " + 
                    "SELECT job_code FROM Filled_jobs)) "); 
      
            this.getOpenAtCompany = DBConnection.getDBConnection().prepareStatement(
                "WITH Filled_Jobs (job_code) AS ( " + 
                    "SELECT job_code FROM Works WHERE end_date IS NULL) " + 
                "SELECT * " + 
                "FROM Job NATURAL JOIN (( " + 
                    "SELECT job_code FROM Job) MINUS ( " + 
                    "SELECT job_code FROM Filled_jobs)) " + 
                "WHERE company_id = ?"); 
            
            this.getOpenMatchingSkills = DBConnection.getDBConnection().prepareStatement(
                "WITH " + 
		"Persons_Skills(ks_code) AS ( " + 
                    "SELECT DISTINCT ks_code " + 
                    "FROM Has_Skill " + 
                    "WHERE person_id = ?), " + 
                "Persons_Certificates(certificate_code) AS ( " + 
                    "SELECT certificate_code " + 
                    "FROM Has_Certificate " + 
                    "WHERE person_id = ?), " +
                "Filled_Jobs (job_code) AS ( " + 
                    "SELECT job_code FROM Works WHERE end_date IS NULL), " + 
                "Open_Jobs(job_code) AS ( " + 
                    "SELECT job_code " + 
                    "FROM (( " + 
                        "SELECT job_code FROM Job) MINUS ( " + 
                        "SELECT job_code FROM Filled_jobs))), " +  
		"Qualified_Open(job_code) AS ( " + 
		  "SELECT job_code " + 
		  "FROM Open_Jobs C " + 
		  "WHERE NOT EXISTS (( " + 
			"SELECT ks_code " + 
			"FROM Requires_Skill S " + 
			"WHERE C.job_code = S.job_code) " + 
			"MINUS ( " + 
			"SELECT ks_code " + 
			"FROM Persons_Skills)) AND " + 
                        "NOT EXISTS (( " + 
                        "SELECT certificate_code " + 
                        "FROM Requires_Certificate R " + 
                        "WHERE C.job_code = R.job_code) " + 
                        "MINUS ( " + 
                        "SELECT certificate_code " + 
                        "FROM Persons_Certificates))) " + 
		"SELECT job_title, job_description " + 
		"FROM Qualified_Open NATURAL JOIN Job");

            this.getOpenAlmostSkills = DBConnection.getDBConnection().prepareStatement(
                "WITH " + 
		"Persons_Skills(ks_code) AS ( " + 
                    "SELECT DISTINCT ks_code " + 
                    "FROM Has_Skill " + 
                    "WHERE person_id = ?), " + 
                "Persons_Certificates(certificate_code) AS ( " + 
                    "SELECT certificate_code " + 
                    "FROM Has_Certificate " + 
                    "WHERE person_id = ?), " +
                "Filled_Jobs (job_code) AS ( " + 
                    "SELECT job_code FROM Works WHERE end_date IS NULL), " + 
                "Open_Jobs(job_code) AS ( " + 
                    "SELECT job_code " + 
                    "FROM (( " + 
                        "SELECT job_code FROM Job) MINUS ( " + 
                        "SELECT job_code FROM Filled_jobs))), " +  
		"Qualified_Open(job_code) AS ( " + 
		  "SELECT job_code " + 
		  "FROM Open_Jobs C " + 
		  "WHERE NOT EXISTS (( " + 
			"SELECT ks_code " + 
			"FROM Requires_Skill S " + 
			"WHERE C.job_code = S.job_code) " + 
			"MINUS ( " + 
			"SELECT ks_code " + 
			"FROM Persons_Skills)) AND " + 
                        "NOT EXISTS (( " + 
                        "SELECT certificate_code " + 
                        "FROM Requires_Certificate R " + 
                        "WHERE C.job_code = R.job_code) " + 
                        "MINUS ( " + 
                        "SELECT certificate_code " + 
                        "FROM Persons_Certificates))) " + 
		"SELECT job_title, job_description " + 
		"FROM Qualified_Open NATURAL JOIN Job");
            
/*            "WITH " + 
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
            "WHERE no_ks_missing = 1";
*/
            this.getIdealPositions = DBConnection.getDBConnection().prepareStatement(
                "WITH " + 
		"Persons_Skills(ks_code) AS ( " + 
                    "SELECT DISTINCT ks_code " + 
                    "FROM Has_Skill " + 
                    "WHERE person_id = ?), " + 
                "Persons_Certificates(certificate_code) AS ( " + 
                    "SELECT certificate_code " + 
                    "FROM Has_Certificate " + 
                    "WHERE person_id = ?), " +
                "Filled_Jobs (job_code) AS ( " + 
                    "SELECT job_code FROM Works WHERE end_date IS NULL), " + 
                "Open_Jobs(job_code) AS ( " + 
                    "SELECT job_code " + 
                    "FROM (( " + 
                        "SELECT job_code FROM Job) MINUS ( " + 
                        "SELECT job_code FROM Filled_jobs))), " +  
		"Qualified_Open(job_code) AS ( " + 
		  "SELECT job_code " + 
		  "FROM Open_Jobs C " + 
		  "WHERE NOT EXISTS (( " + 
			"SELECT ks_code " + 
			"FROM Requires_Skill S " + 
			"WHERE C.job_code = S.job_code) " + 
			"MINUS ( " + 
			"SELECT ks_code " + 
			"FROM Persons_Skills)) AND " + 
                        "NOT EXISTS (( " + 
                        "SELECT certificate_code " + 
                        "FROM Requires_Certificate R " + 
                        "WHERE C.job_code = R.job_code) " + 
                        "MINUS ( " + 
                        "SELECT certificate_code " + 
                        "FROM Persons_Certificates))), " + 
                "Ideal_Open(job_code) AS ( " + 
                    "SELECT job_code " + 
                    "FROM Qualified_Open Q " + 
                    "WHERE EXISTS (( " + 
                        "SELECT ks_code " + 
                        "FROM Prefers_Skill P " + 
                        "WHERE Q.job_code = P.job_code) " + 
                        "INTERSECT ( " + 
                        "SELECT ks_code " + 
                        "FROM Persons_Skills)) OR " + 
                        "EXISTS (( " + 
                        "SELECT certificate_code " + 
                        "FROM Prefers_Certificate Z " + 
                        "WHERE Q.job_code = Z.job_code) " + 
                        "INTERSECT ( " + 
                        "SELECT certificate_code " + 
                        "FROM Persons_Certificates))) " + 
		"SELECT job_title, job_description " + 
		"FROM Ideal_Open NATURAL JOIN Job");
        } 
        
        catch (SQLException e) {
            e.printStackTrace(); 
        } 
    }
    
    /**
     * 
     * @return 
     */
    public ArrayList<Job> getAllJobs() {
        ArrayList<Job> allJobs = new ArrayList<Job>(); 
        
        // Execute query and process results into ArrayList. 
        try (ResultSet queryResults = this.getAllJobs.executeQuery()) {
            while (queryResults.next()) {
                allJobs.add(new Job(
                    queryResults.getString("job_code"), 
                    queryResults.getString("company_id"), 
                    queryResults.getString("emp_mode"), 
                    queryResults.getString("pay_type"), 
                    queryResults.getString("job_title"), 
                    queryResults.getString("job_description"))); 
            }
        }
        
        catch (SQLException e) {
            e.printStackTrace(); 
        }
        
        return allJobs; 
    } // end method getAllJobs


    /**
     * 
     * @return 
     */
    public ArrayList<Job> getOpenPositions() {
        ArrayList<Job> allJobs = new ArrayList<Job>(); 
        
        // Execute query and process results into ArrayList. 
        try (ResultSet queryResults = this.getOpenPositions.executeQuery()) {
            while (queryResults.next()) {
                allJobs.add(new Job(
                    queryResults.getString("job_code"), 
                    queryResults.getString("company_id"), 
                    queryResults.getString("emp_mode"), 
                    queryResults.getString("pay_type"), 
                    queryResults.getString("job_title"), 
                    queryResults.getString("job_description"))); 
            }
        }
        
        catch (SQLException e) {
            e.printStackTrace(); 
        }
        
        return allJobs; 
    } // end method getOpenPositions


    /**
     * 
     * @param   companyID
     * @return 
     */
    public ResultSet getOpenAtCompany(String companyID) {
        ResultSet queryResults = null; 
        
        // Execute query and process results into ArrayList. 
        try { 
            this.getOpenAtCompany.setString(1, companyID);
            queryResults = this.getOpenAtCompany.executeQuery();
        }
        
        catch (SQLException e) {
            e.printStackTrace(); 
        }
        
        return queryResults;  
    } // end method getOpenAtCompany
    
    
    /**
     * 
     * @param PID
     * @return 
     */
    public ResultSet getOpenMatchingSkills(String PID) {
        ResultSet results = null; 
        try {
            this.getOpenMatchingSkills.setString(1, PID);
            this.getOpenMatchingSkills.setString(2, PID);
            results = this.getOpenMatchingSkills.executeQuery(); 
        }
        
        catch (SQLException e) {
            e.printStackTrace(); 
        }
        
        return results;
    } // end method getOpenMatchingSkills
    
    
    /**
     * 
     * @param PID
     * @return 
     */
    public ResultSet getIdealPositions(String PID) {
        ResultSet results = null; 
        
        try {
            this.getIdealPositions.setString(1, PID); 
            this.getIdealPositions.setString(2, PID); 
            results = this.getIdealPositions.executeQuery(); 
        }
        
        catch (SQLException e) {
            e.printStackTrace(); 
        }
        
        return results; 
    } // end method getIdealPositions 
    
    
    /**
     * 
     * @param   jobCode
     * @return 
     */
    public ResultSet getTitleAndDescription(String jobCode) {
        ResultSet results = null; 
        
        try {
            PreparedStatement stmt = DBConnection.getDBConnection().prepareStatement(
                "SELECT job_title, job_description " + 
                "FROM Job WHERE job_code = ?"); 
            stmt.setString(1, jobCode); 
            results = stmt.executeQuery(); 
        }
        
        catch (SQLException e) {
            e.printStackTrace(); 
        }
        
        return results; 
    } // end method getTitleAndDescription 
    
    
    /**
     * 
     * @param   jobCode
     * @return 
     */
    public ResultSet getRequiredSkills(String jobCode) {
        ResultSet results = null; 
        
        try {
            PreparedStatement stmt = DBConnection.getDBConnection().prepareStatement(
                "SELECT ks_title " + 
                "FROM Requires_Skill NATURAL JOIN Knowledge_Skill " + 
                "WHERE job_code = ?"); 
            stmt.setString(1, jobCode);
            results = stmt.executeQuery(); 
        }
        
        catch (SQLException e) {
            e.printStackTrace(); 
        }
        
        return results; 
    } // end method getRequiredSkills


    /**
     * 
     * @param   jobCode
     * @return 
     */
    public ResultSet getRequiredCertificates(String jobCode) {
        ResultSet results = null; 
        
        try {
            PreparedStatement stmt = DBConnection.getDBConnection().prepareStatement(
                "SELECT certificate_name, educator_website " + 
                "FROM Requires_Certificate NATURAL JOIN " + 
                    "Certificate JOIN Educator ON issued_by = institution_id " + 
                "WHERE job_code = ?"); 
            stmt.setString(1, jobCode);
            results = stmt.executeQuery(); 
        }
        
        catch (SQLException e) {
            e.printStackTrace(); 
        }
        
        return results; 
    } // end method getRequiredCertificatess


    /**
     * 
     * @param   jobCode
     * @return 
     */
    public ResultSet getPreferredSkills(String jobCode) {
        ResultSet results = null; 
        
        try {
            PreparedStatement stmt = DBConnection.getDBConnection().prepareStatement(
                "SELECT ks_title " + 
                "FROM Prefers_Skill NATURAL JOIN Knowledge_Skill " + 
                "WHERE job_code = ?"); 
            stmt.setString(1, jobCode);
            results = stmt.executeQuery(); 
        }
        
        catch (SQLException e) {
            e.printStackTrace(); 
        }
        
        return results; 
    } // end method getPreferredSkills


    /**
     * 
     * @param   jobCode
     * @return 
     */
    public ResultSet getPreferredCertificates(String jobCode) {
        ResultSet results = null; 
        
        try {
            PreparedStatement stmt = DBConnection.getDBConnection().prepareStatement(
                "SELECT certificate_name, educator_website " + 
                "FROM Prefers_Certificate NATURAL JOIN " + 
                    "Certificate JOIN Educator ON issued_by = institution_id " + 
                "WHERE job_code = ?"); 
            stmt.setString(1, jobCode);
            results = stmt.executeQuery(); 
        }
        
        catch (SQLException e) {
            e.printStackTrace(); 
        }
        
        return results; 
    } // end method getPreferredCertificates


   /**
    * 
    * @param    companyID
    * @return 
    */
    public ArrayList<Job> getListOfOpenAtCompany(String companyID) {
        return parseResultsIntoJobList(this.getOpenAtCompany(companyID));  
    } // end method getOpenAtCompany
    
    
    /**
     * 
     * @param   jobCode
     * @param   personID
     * @return 
     */
/*    public ResultSet getCoveringCourses(String jobCode, String personID) {
        return null; 
    }
*/    
    
    /**
     * 
     * @param   queryResults
     * @return 
     */
    private ArrayList<Job> parseResultsIntoJobList(ResultSet queryResults) {
        ArrayList<Job> allJobs = new ArrayList<Job>(); 
        try {
            while (queryResults.next()) {
                allJobs.add(new Job(
                    queryResults.getString("job_code"), 
                    queryResults.getString("company_id"), 
                    queryResults.getString("emp_mode"), 
                    queryResults.getString("pay_type"), 
                    queryResults.getString("job_title"), 
                    queryResults.getString("job_description"))); 
            }
        } 
        
        catch (SQLException e) {
            e.printStackTrace(); 
        }
        
        return allJobs; 
    } // end method parseResultsIntoJobList 
} // end class JobQueries
