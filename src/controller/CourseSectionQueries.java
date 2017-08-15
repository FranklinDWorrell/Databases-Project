package controller;

import model.CourseSection;
import databaseapp.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

/**
 * Class for use in querying database regarding sections of 
 * courses. 
 * 
 * @author  Franklin D. Worrell
 * @version 29 April 2017
 */
public class CourseSectionQueries {
    private PreparedStatement getAllTaughtCourses; 
    private PreparedStatement getAllSectionsOfCourse; 
    private PreparedStatement getSectionsOfCourseByYear; 
    private PreparedStatement insertIntoTakes; 
    private PreparedStatement getTrainingPlan; 
    
    
    /**
     * Initializes the <code>PreparedStatements</code> used by this. 
     */
    public CourseSectionQueries() {
        try {
            this.getAllTaughtCourses = DBConnection.getDBConnection().prepareStatement(
                "SELECT * " + 
                "FROM Course_Section "); 
            this.getAllSectionsOfCourse = DBConnection.getDBConnection().prepareStatement(
                "SELECT * " + 
                "FROM Course_Section " + 
                "WHERE course_code = ? "); 
            this.getSectionsOfCourseByYear = DBConnection.getDBConnection().prepareStatement(
                "SELECT * " + 
                "FROM Course_Section " + 
                "WHERE course_code = ? AND section_year = ? "); 
            this.insertIntoTakes = DBConnection.getDBConnection().prepareStatement(
                "INSERT INTO Takes (person_id, course_code, section_no, " + 
                "section_year, grade) VALUES (?, ?, ?, ?, ?)"); 
        }
        
        catch (SQLException e) {
            e.printStackTrace(); 
        }
    } // end Constructor
    
    /**
     * Returns a list of information about every section of 
     * all courses that have ever been taught. 
     * 
     * @return list of all sections ever taught
     */
    public ArrayList<CourseSection> getAllTaughtCourses() {
        ArrayList<CourseSection> courseSections = new ArrayList<CourseSection>(); 
        // Execute query and process results into ArrayList. 
        try (ResultSet queryResults = this.getAllTaughtCourses.executeQuery()) {
            while (queryResults.next()) {
                courseSections.add(new CourseSection(
                    queryResults.getString("course_code"), 
                    queryResults.getString("section_no"), 
                    queryResults.getString("section_year"), 
                    queryResults.getDate("completion_date").toString(), 
                    queryResults.getString("offered_by"), 
                    queryResults.getString("section_format"), 
                    queryResults.getDouble("section_price"))); 
            }
        }
        
        catch (SQLException e) {
            e.printStackTrace(); 
        }
        
        return courseSections; 
    } // end method getAllTaughtCourses
    
    
    /**
     * Returns an <code>ArrayList</code> of sections taught of 
     * a particular course passed in as argument. 
     * 
     * @param   cCode   the course whose sections are desired
     * @return a list of the sections taught of cCode
     */
    public ArrayList<CourseSection> getAllSectionsOfCourse(String cCode) {
        ArrayList<CourseSection> courseSections = new ArrayList<CourseSection>(); 
        
        // Execute query and process results into ArrayList. 
        try {
            this.getAllSectionsOfCourse.setString(1, cCode);
            ResultSet queryResults = this.getAllSectionsOfCourse.executeQuery(); 
            while (queryResults.next()) {
                courseSections.add(new CourseSection(
                    queryResults.getString("course_code"), 
                    queryResults.getString("section_no"), 
                    queryResults.getString("section_year"), 
                    queryResults.getDate("completion_date").toString(), 
                    queryResults.getString("offered_by"), 
                    queryResults.getString("section_format"), 
                    queryResults.getDouble("section_price"))); 
            }
        }
        
        catch (SQLException e) {
            e.printStackTrace(); 
        }
        
        return courseSections; 
    } // end method getAllSectionsOfCourse 
    
    
    /**
     * Returns an <code>ArrayList</code> of String that are the
     * years in which sections of a particular course were taught. 
     * 
     * @param   cCode   the course being inquired about 
     * @return a list of years in which course was taught as Strings
     */
    public ArrayList<String> getYearListForCourse(String cCode) {
        ArrayList<CourseSection> allSections = this.getAllSectionsOfCourse(cCode); 
        Set<String> allYears = new HashSet<String>(); 
        for (CourseSection section : allSections) {
            allYears.add(section.getSectionYear()); 
        }
        ArrayList<String> courseYears = new ArrayList<String>(allYears); 
        return courseYears; 
    } // end method getYearListForCourse 


    /**
     * Returns an <code>ArrayList</code> of <code>CourseSection</code>
     * objects that are the sections of a given course that were 
     * taught in a given year. 
     * 
     * @param   cCode   the course in question 
     * @param   year    the year in which the course was taught 
     * @return  a list of sections that were taught in the given year 
     */
    public ArrayList<CourseSection> getSectionsOfCourseByYear(String cCode, 
            String year) {
        ArrayList<CourseSection> courseSections = new ArrayList<CourseSection>(); 
        
        // Execute query and process results into ArrayList. 
        try {
            this.getSectionsOfCourseByYear.setString(1, cCode);
            this.getSectionsOfCourseByYear.setString(2, year); 
            ResultSet queryResults = this.getSectionsOfCourseByYear.executeQuery(); 
            while (queryResults.next()) {
                courseSections.add(new CourseSection(
                    queryResults.getString("course_code"), 
                    queryResults.getString("section_no"), 
                    queryResults.getString("section_year"), 
                    queryResults.getDate("completion_date").toString(), 
                    queryResults.getString("offered_by"), 
                    queryResults.getString("section_format"), 
                    queryResults.getDouble("section_price"))); 
            }
        }
        
        catch (SQLException e) {
            e.printStackTrace(); 
        }
        
        return courseSections; 
    } // end method getSectionsOfCourseByYear
    
    /**
     * Inserts a row into the Takes table with the attribute values 
     * passed in as parameters. 
     * 
     * @param   personID    the student's SSN
     * @param   courseCode  the course they took 
     * @param   sectionNo   the section number
     * @param   sectionYear the year the section was taught 
     * @param   grade       the grade the student received 
     * @return  the number of rows inserted into Takes table 
     */
    public int insertIntoTakes(String personID, String courseCode, String sectionNo, 
            String sectionYear, String grade) {
        int rowsInserted = 0; 
        try {
            this.insertIntoTakes.setString(1, personID); 
            this.insertIntoTakes.setString(2, courseCode); 
            this.insertIntoTakes.setString(3, sectionNo); 
            this.insertIntoTakes.setString(4, sectionYear); 
            this.insertIntoTakes.setString(5, grade);
            rowsInserted = this.insertIntoTakes.executeUpdate(); 
        }
        
        catch (SQLException e) {
            e.printStackTrace(); 
        }
        
        return rowsInserted; 
    } // end method insertIntoTakes
} // end class CourseSectionQueries