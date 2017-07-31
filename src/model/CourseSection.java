package model;

/**
 *
 * @author  Franklin D. Worrell
 * @version 29 April 2017
 */
public class CourseSection {
    private String courseCode; 
    private String sectionNo; 
    private String sectionYear; 
    private String completionDate; 
    private String offeredBy; 
    private String sectionFormat; 
    private double sectionPrice; 

    public CourseSection(String courseCode, String sectionNo, String sectionYear, 
            String completionDate, String offeredBy, String sectionFormat, 
            double sectionPrice) {
        this.courseCode = courseCode;
        this.sectionNo = sectionNo;
        this.sectionYear = sectionYear;
        this.completionDate = completionDate;
        this.offeredBy = offeredBy;
        this.sectionFormat = sectionFormat;
        this.sectionPrice = sectionPrice;
    } // enc Constructor

    /**
     * @return the courseCode
     */
    public String getCourseCode() {
        return courseCode;
    }

    /**
     * @param courseCode the courseCode to set
     */
    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }

    /**
     * @return the sectionNo
     */
    public String getSectionNo() {
        return sectionNo;
    }

    /**
     * @param sectionNo the sectionNo to set
     */
    public void setSectionNo(String sectionNo) {
        this.sectionNo = sectionNo;
    }

    /**
     * @return the sectionYear
     */
    public String getSectionYear() {
        return sectionYear;
    }

    /**
     * @param sectionYear the sectionYear to set
     */
    public void setSectionYear(String sectionYear) {
        this.sectionYear = sectionYear;
    }

    /**
     * @return the completionDate
     */
    public String getCompletionDate() {
        return completionDate;
    }

    /**
     * @param completionDate the completionDate to set
     */
    public void setCompletionDate(String completionDate) {
        this.completionDate = completionDate;
    }

    /**
     * @return the offeredBy
     */
    public String getOfferedBy() {
        return offeredBy;
    }

    /**
     * @param offeredBy the offeredBy to set
     */
    public void setOfferedBy(String offeredBy) {
        this.offeredBy = offeredBy;
    }

    /**
     * @return the sectionFormat
     */
    public String getSectionFormat() {
        return sectionFormat;
    }

    /**
     * @param sectionFormat the sectionFormat to set
     */
    public void setSectionFormat(String sectionFormat) {
        this.sectionFormat = sectionFormat;
    }

    /**
     * @return the sectionPrice
     */
    public double getSectionPrice() {
        return sectionPrice;
    }

    /**
     * @param sectionPrice the sectionPrice to set
     */
    public void setSectionPrice(double sectionPrice) {
        this.sectionPrice = sectionPrice;
    }
} // end class CourseSection
