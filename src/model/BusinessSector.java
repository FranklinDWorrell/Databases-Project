package model;

/**
 *
 * @author  Franklin D. Worrell
 * @version 24 April 2017
 */
public class BusinessSector {
    private String NAICSCode; 
    private String NAICSDescription; 

    public BusinessSector(String NAICSCode, String NAICSDescription) {
        this.NAICSCode = NAICSCode;
        this.NAICSDescription = NAICSDescription;
    }

    /**
     * @return the NAICSCode
     */
    public String getNAICSCode() {
        return NAICSCode;
    }

    /**
     * @param NAICSCode the NAICSCode to set
     */
    public void setNAICSCode(String NAICSCode) {
        this.NAICSCode = NAICSCode;
    }

    /**
     * @return the NAICSDescription
     */
    public String getNAICSDescription() {
        return NAICSDescription;
    }

    /**
     * @param NAICSDescription the NAICSDescription to set
     */
    public void setNAICSDescription(String NAICSDescription) {
        this.NAICSDescription = NAICSDescription;
    }
} // end class BusinessSector 
