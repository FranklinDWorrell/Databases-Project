package databaseapp;

import controller.BusinessSectorQueries;
import controller.RequiredQueries;
import controller.PersonQueries;
import controller.CompanyQueries;
import controller.JobCategoryQueries;
import controller.JobQueries;
import model.Job;
import model.JobCategory;
import model.Person;
import model.BusinessSector;
import model.Company;
import java.util.ArrayList; 
import java.sql.*; 
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections; 
import javafx.collections.ObservableList; 
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.scene.Scene;
import javafx.scene.control.ComboBox;
import javafx.scene.control.TableView;
import javafx.scene.control.TableColumn;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.RadioButton;
import javafx.scene.control.TableColumn.CellDataFeatures;
import javafx.scene.control.TextField;
import javafx.scene.control.ToggleGroup;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.stage.Modality;
import javafx.stage.Stage;
import javafx.util.Callback;

/**
 * Application that allows user to run the 28 queries required 
 * for the project. 
 * 
 * @author  Franklin D. Worrell
 * @version 4 May 2017
 */
public class RequiredQueryApp {
    // Query and IN variables to prepare. 
    private String whichQuery = ""; 
    private String PID = ""; 
    private String companyName = ""; 
    private String SOCCode = ""; 
    private String jobCode = ""; 
    private String NAICSCode = ""; 
    
    // GUI components stored in class space for ease of access by methods. 
    private Stage primaryStage; 
    private ComboBox queryPullDown; 
    private ComboBox PIDPullDown; 
    private ComboBox CNPullDown; 
    private ComboBox SOCPullDown; 
    private ComboBox JobPullDown; 
    private ComboBox NAICSPullDown; 
    private HBox missingKBox; 
    private TextField missingKField; 
    private HBox skillOrCert; 
    private RadioButton wantsSkills; 
    private RadioButton wantsCertificates; 
    private HBox jobOrCategory; 
    private RadioButton wantsJobCode; 
    private RadioButton wantsSOCCode; 
    private HBox numberOrPayroll; 
    private RadioButton wantsNumber; 
    private RadioButton wantsPayroll; 
    private HBox ratioOrRate; 
    private RadioButton wantsRatio; 
    private RadioButton wantsRate; 
    private Button submitButton; 
    
    /**
     * Builds all the GUI components for this application, populates
     * them with any needed data from the database, and adds them to
     * the application's primary stage. 
     * 
     * @param   primaryStage    the Stage for displaying the application
     */
    public RequiredQueryApp(Stage primaryStage) {
        this.primaryStage = primaryStage; 
        
        // Create all UI components
        final RequiredQueryApp self = this; 
        
        // Pulldown for Query Selection. 
        this.queryPullDown = new ComboBox(); 
        this.queryPullDown.getItems().addAll(
            "1", "2", "3", "4", "5", "6", "7", 
            "8", "9", "10", "11", "12", "13", "14", 
            "15", "16", "17", "18", "19", "20", "21", 
            "22", "23", "24", "25", "26", "27", "28"); 
        this.queryPullDown.setPromptText("Please pick a query to execute: "); 
        this.queryPullDown.valueProperty().addListener(new ChangeListener<String>() {
            @Override 
            public void changed(ObservableValue ov, String t, String t1) { 
                self.restoreDefaults(); 
                self.whichQuery = t1;
                self.enableRelevantFields(t1); 
            }    
        });
        
        // Pulldown for Person ID Selection. 
        PersonQueries pQueries = new PersonQueries(); 
        ArrayList<Person> people = pQueries.getAllPersons(); 
        ArrayList<String> personIDs = new ArrayList<String>(); 
        for (Person person : people) {
            personIDs.add(person.getPersonID()); 
        }
        this.PIDPullDown = new ComboBox(); 
        this.PIDPullDown.getItems().addAll(personIDs); 
        this.PIDPullDown.setPromptText("Please select a Person's ID: "); 
        this.PIDPullDown.valueProperty().addListener(new ChangeListener<String>() {
            @Override 
            public void changed(ObservableValue ov, String t, String t1) {                
                self.PID = t1;  
            } 
        }); 
        
        // Pulldown for Company name selection. 
        CompanyQueries cQueries = new CompanyQueries(); 
        ArrayList<Company> companies = cQueries.getAllCompanies(); 
        ArrayList<String> companyNames = new ArrayList<String>(); 
        for (Company company : companies) {
            companyNames.add(company.getCompanyName()); 
        }
        this.CNPullDown = new ComboBox(); 
        this.CNPullDown.getItems().addAll(companyNames); 
        this.CNPullDown.setPromptText("Please select a Company: "); 
        this.CNPullDown.valueProperty().addListener(new ChangeListener<String>() {
            @Override 
            public void changed(ObservableValue ov, String t, String t1) {                
                self.companyName = t1;  
            } 
        }); 
        
        // Pulldown for Job Category selection. 
        JobCategoryQueries jCQueries = new JobCategoryQueries(); 
        ArrayList<JobCategory> categories = jCQueries.getAllCategories(); 
        ArrayList<String> SOCCodes = new ArrayList<String>(); 
        for (JobCategory category : categories) {
            SOCCodes.add(category.getSOCCode()); 
        }
        this.SOCPullDown = new ComboBox(); 
        this.SOCPullDown.getItems().addAll(SOCCodes); 
        this.SOCPullDown.setPromptText("Please select a Job Category: "); 
        this.SOCPullDown.valueProperty().addListener(new ChangeListener<String>() {
            @Override 
            public void changed(ObservableValue ov, String t, String t1) {                
                self.SOCCode = t1;  
            } 
        }); 
        
        // Pulldown for job code selection. 
        JobQueries jQueries = new JobQueries(); 
        ArrayList<Job> jobs = jQueries.getAllJobs(); 
        ArrayList<String> jobCodes = new ArrayList<String>(); 
        for (Job job : jobs) {
            jobCodes.add(job.getJobCode()); 
        }
        this.JobPullDown = new ComboBox(); 
        this.JobPullDown.getItems().addAll(jobCodes); 
        this.JobPullDown.setPromptText("Please select a Job: "); 
        this.JobPullDown.valueProperty().addListener(new ChangeListener<String>() {
            @Override 
            public void changed(ObservableValue ov, String t, String t1) {                
                self.jobCode = t1;  
            } 
        }); 
        
        // Pull Down for Business Sector selection. 
        BusinessSectorQueries bsQueries = new BusinessSectorQueries(); 
        ArrayList<BusinessSector> sectors = bsQueries.getAllSectors(); 
        ArrayList<String> NAICSCodes = new ArrayList<String>(); 
        for (BusinessSector sector : sectors) {
            NAICSCodes.add(sector.getNAICSCode()); 
        }
        this.NAICSPullDown = new ComboBox(); 
        this.NAICSPullDown.getItems().addAll(NAICSCodes); 
        this.NAICSPullDown.setPromptText("Please select a Sector code: "); 
        this.NAICSPullDown.valueProperty().addListener(new ChangeListener<String>() {
            @Override
            public void changed(ObservableValue ov, String t, String t1) {
                self.NAICSCode = t1; 
            }
        }); 
        
        // Text field for missing-k queries. 
        this.missingKBox = new HBox(); 
        Label kLabel = new Label("Tolerable Number of Missing Skills: "); 
        this.missingKField = new TextField(); 
        this.missingKBox.getChildren().addAll(kLabel, missingKField); 
        
        // Radio buttons for whether or not skills or certificates desired. 
        ToggleGroup group = new ToggleGroup(); 
        this.wantsSkills = new RadioButton("Skills"); 
        this.wantsSkills.setToggleGroup(group); 
        this.wantsSkills.setSelected(true); 
        this.wantsCertificates = new RadioButton("Certificates"); 
        this.wantsCertificates.setToggleGroup(group); 
        
        // Radio buttons for whether job or job category is desired. 
        ToggleGroup group2 = new ToggleGroup(); 
        this.wantsJobCode = new RadioButton("Specific Job"); 
        this.wantsJobCode.setToggleGroup(group2); 
        this.wantsJobCode.setSelected(true); 
        this.wantsSOCCode = new RadioButton("Job Category"); 
        this.wantsSOCCode.setToggleGroup(group2); 
        
        // Radio buttons for querying in terms of number or employees or payroll. 
        ToggleGroup group3 = new ToggleGroup(); 
        this.wantsNumber = new RadioButton("By Total Employees"); 
        this.wantsNumber.setToggleGroup(group3); 
        this.wantsNumber.setSelected(true); 
        this.wantsPayroll = new RadioButton("By Total Payroll"); 
        this.wantsPayroll.setToggleGroup(group3); 
        
        // Radio buttons for querying ratio of increasing wages or rate of increase.
        ToggleGroup group4 = new ToggleGroup(); 
        this.wantsRatio = new RadioButton("By Ratio of Number Increasing");  
        this.wantsRatio.setToggleGroup(group4); 
        this.wantsRatio.setSelected(true); 
        this.wantsRate = new RadioButton("By Rate of Earning Improvement"); 
        this.wantsRate.setToggleGroup(group4); 
        
        // Button that causes query execution based on UI choices. 
        this.submitButton = new Button(); 
        submitButton.setText("Run Query!");
        submitButton.setOnAction(new EventHandler<ActionEvent>() {
            @Override
            public void handle(ActionEvent event) {
                PreparedStatement stmt = self.prepQuery(); 
                try {
                    ResultSet result = stmt.executeQuery(); 
                    self.displayResults(result); 
                } 
                catch (SQLException e) {
                    e.printStackTrace(); 
                }
           }
        });
        

        // Build high-level container and populate. 
        VBox root = new VBox();
        root.getChildren().add(queryPullDown);
        root.getChildren().add(CNPullDown); 
        root.getChildren().add(PIDPullDown); 
        root.getChildren().add(SOCPullDown); 
        root.getChildren().add(JobPullDown); 
        root.getChildren().add(NAICSPullDown); 
        root.getChildren().add(missingKBox); 
        this.skillOrCert = new HBox(); 
        this.skillOrCert.getChildren().add(wantsSkills); 
        this.skillOrCert.getChildren().add(wantsCertificates); 
        root.getChildren().add(skillOrCert); 
        this.jobOrCategory = new HBox(); 
        this.jobOrCategory.getChildren().add(wantsJobCode); 
        this.jobOrCategory.getChildren().add(wantsSOCCode); 
        root.getChildren().add(jobOrCategory); 
        this.numberOrPayroll = new HBox(); 
        this.numberOrPayroll.getChildren().add(wantsNumber); 
        this.numberOrPayroll.getChildren().add(wantsPayroll); 
        root.getChildren().add(numberOrPayroll); 
        this.ratioOrRate = new HBox(); 
        this.ratioOrRate.getChildren().add(wantsRatio); 
        this.ratioOrRate.getChildren().add(wantsRate); 
        root.getChildren().add(ratioOrRate); 
        root.getChildren().add(submitButton); 
        Scene scene = new Scene(root, 450, 300);
        primaryStage.setTitle("Run Required Queries");
        primaryStage.setScene(scene);
        
        // Disable all ComboBoxes for IN variable selection. 
        this.CNPullDown.setDisable(true); 
        this.PIDPullDown.setDisable(true); 
        this.SOCPullDown.setDisable(true); 
        this.JobPullDown.setDisable(true); 
        this.NAICSPullDown.setDisable(true); 
        this.missingKBox.setDisable(true); 
        this.skillOrCert.setDisable(true); 
        this.jobOrCategory.setDisable(true); 
        this.numberOrPayroll.setDisable(true); 
        this.ratioOrRate.setDisable(true); 
        this.submitButton.setDisable(true); 
    } // end constructor
    
    
    /**
     * Displays the <code>Stage</code> as assembled in
     * the constructor. 
     */
    public void runRQApp() {
        primaryStage.show();
    } // end method runRQApp
    
    
    /**
     * Parses initial query selection. 
     * 
     * @param   picked  the String option picked from ComboBox
     */
    private PreparedStatement prepQuery() {
        PreparedStatement stmt = null; 
        switch (this.whichQuery) {
            // Queries with only a company name IN variable. 
            case "1":
            case "2":
                stmt = prepCompanyNameINQuery(); 
                break; 
            
            // Queries with no IN variables. 
            case "3": 
            case "23":
            case "24": 
            case "25": 
            case "26": 
            case "27":
                stmt = prepNoINQuery(); 
                break; 
                
            // Queries with only a person ID IN variable. 
            case "4":
            case "5": 
            case "6":
            case "13": 
            case "14": 
                stmt = prepPIDINQuery(); 
                break; 
                
            // Query 7 has too many moving parts--treat it by itself. 
            case "7":
                stmt = prepSeventhQuery(); 
                break; 
                
            // Queries requiring both a person ID and a job code IN variable. 
            case "8":
            case "9": 
            case "10":
            case "11": 
            case "12": 
                stmt = prepJobAndPIDINQuery(); 
                break; 
            
            // Queries requirind only a job code IN variable. 
            case "15":
            case "16":
            case "17":
            case "18":
                stmt = prepJobINQuery(); 
                break; 

            // Queries with only a SOC code IN variable. 
            case "19":
            case "20": 
            case "21": 
            case "22": 
            case "28": 
                stmt = prepSOCINQuery(); 
                break; 
        }
        return stmt; 
    } // end method setupQueryPrep
    
    
    /**
     * Prepares any query that requires the name of a company
     * as an IN variable. 
     * 
     * @return  the PreparedStatement for a query
     */
    private PreparedStatement prepCompanyNameINQuery() {
        PreparedStatement stmt = null; 
        try {
            switch (this.whichQuery) {
                case "1": 
                    stmt = DBConnection.getDBConnection().prepareStatement(
                            RequiredQueries.QUERY_1); 
                    break; 
                case "2": 
                    stmt = DBConnection.getDBConnection().prepareStatement(
                            RequiredQueries.QUERY_2); 
                    break; 
            } // end switch block
            
            stmt.setString(1, this.companyName);
        } // end try block 
        
        catch (SQLException e){
            e.printStackTrace(); 
        }
        
        return stmt; 
    } // end method prepCompanyNameINQuery
    
    
    /**
     * Preps all required queries that mostly do not require any IN 
     * variables to be resolved(numbers 3, 23-27). Creates and 
     * returns a <code>PreparedStatement</code> for that query. 
     * 
     * @param   picked  a String that is the query number
     */ 
    private PreparedStatement prepNoINQuery() {
        PreparedStatement stmt = null; 
        try {
            switch (this.whichQuery) {
                case "3": 
                    stmt = DBConnection.getDBConnection().prepareStatement(
                            RequiredQueries.QUERY_3); 
                    break; 
                case "23":
                    if (this.wantsNumber.isSelected()) {
                        stmt = DBConnection.getDBConnection().prepareStatement(
                            RequiredQueries.QUERY_23A); 
                    }
                    else {
                        stmt = DBConnection.getDBConnection().prepareStatement(
                            RequiredQueries.QUERY_23B); 
                    }
                    break; 
                case "24": 
                    if (this.wantsNumber.isSelected()) {
                        stmt = DBConnection.getDBConnection().prepareStatement(
                            RequiredQueries.QUERY_24A); 
                    }
                    else {
                        stmt = DBConnection.getDBConnection().prepareStatement(
                            RequiredQueries.QUERY_24B); 
                    }
                    break; 
                case "25": 
                    if (this.wantsRate.isSelected()) {
                        stmt = DBConnection.getDBConnection().prepareStatement(
                            RequiredQueries.QUERY_25B); 
                        stmt.setString(1, this.NAICSCode); 
                    } 
                    else {
                        stmt = DBConnection.getDBConnection().prepareStatement(
                            RequiredQueries.QUERY_25A); 
                    }
                    break; 
                case "26": 
                    stmt = DBConnection.getDBConnection().prepareStatement(
                            RequiredQueries.QUERY_26); 
                    break; 
                case "27": 
                    stmt = DBConnection.getDBConnection().prepareStatement(
                            RequiredQueries.QUERY_27); 
                    break; 
                default: 
                    System.out.println("Unexpected fall through seen.");
                    System.out.println("RequiredQueryApp.prepNoINQuery()"); 
                    break; 
            } // end switch block
        } // end try block 
        
        catch (SQLException e) {
            e.printStackTrace(); 
        }
        
        return stmt; 
    } // end method prepNoINQuery 
    
    
    /**
     * Preps all required queries that require only a person's 
     * ID number as an IN variable (numbers 4-6, 13, 14). Creates and returns
     * a <code>PreparedStatement</code> for that query. 
     * 
     * @param   picked  a String of the selected query's number
     * @return  selected query as a PreparedStatement
     */
    private PreparedStatement prepPIDINQuery() {
        PreparedStatement stmt = null; 
        try {
            switch (this.whichQuery) {
                case "4": 
                    stmt = DBConnection.getDBConnection().prepareStatement(
                            RequiredQueries.QUERY_4); 
                    break; 
                case "5": 
                    if (this.wantsSkills.isSelected()){
                        stmt = DBConnection.getDBConnection().prepareStatement(
                            RequiredQueries.QUERY_5S); 
                    } 
                    else {
                        stmt = DBConnection.getDBConnection().prepareStatement(
                            RequiredQueries.QUERY_5C); 
                    }
                    break; 
                case "6": 
                    if (this.wantsSkills.isSelected()) {
                        stmt = DBConnection.getDBConnection().prepareStatement(
                            RequiredQueries.QUERY_6S); 
                    }
                    else {
                        stmt = DBConnection.getDBConnection().prepareStatement(
                            RequiredQueries.QUERY_6C); 
                    }
                    break; 
                case "13": 
                    stmt = DBConnection.getDBConnection().prepareStatement(
                            RequiredQueries.QUERY_13); 
                    break; 
                case "14": 
                    stmt = DBConnection.getDBConnection().prepareStatement(
                            RequiredQueries.QUERY_14); 
                    break; 
                default: 
                    System.out.println("Unexpected fall through detected."); 
                    System.out.println("RequiredQueryApp.prepPIDINQuery()"); 
                    break; 
            } // end switch block
            
            stmt.setString(1, this.PID);
            
            if (this.whichQuery.equals("6")) {
                stmt.setString(2, this.PID);  
            }
        } // end try block 
        
        catch (SQLException e){
            e.printStackTrace(); 
        }
        
        return stmt; 
    } // end method prepPIDINQuery
    
    
    /**
     * Creates a <code>PreparedStatement</code> for required query
     * number 7--it has enough options associated with it to merit
     * unique treatment. 
     * 
     * @return  a PreparedStatement for the seventh required query 
     */
    private PreparedStatement prepSeventhQuery() {
        PreparedStatement stmt = null; 
        try {
            if (this.wantsJobCode.isSelected()) {
                if (this.wantsSkills.isSelected()) {
                    stmt = DBConnection.getDBConnection().prepareStatement(
                            RequiredQueries.QUERY_7AS); 
                }
                
                else {
                    stmt = DBConnection.getDBConnection().prepareStatement(
                            RequiredQueries.QUERY_7AC); 
                }
                stmt.setString(1, this.jobCode); 
            }
            
            else {
                stmt = DBConnection.getDBConnection().prepareStatement(
                        RequiredQueries.QUERY_7B); 
                stmt.setString(1, this.SOCCode); 
            }
        } // end try block 
        
        catch (SQLException e){
            e.printStackTrace(); 
        }
        
        return stmt; 
    } // end method prepSeventhQuery
    
    
    /**
     * Creates <code>PreparedStatment</code> for any query that
     * requires both a job code and a PID (numbers 8-12). 
     * 
     * @return  a PreparedStatement for the required query 
     */
    private PreparedStatement prepJobAndPIDINQuery() {
        PreparedStatement stmt = null; 
        try {
            switch (this.whichQuery) {
                case "8":
                    if (this.wantsSkills.isSelected()) {
                        stmt = DBConnection.getDBConnection().prepareStatement(
                            RequiredQueries.QUERY_8S); 
                    }
                    else {
                        stmt = DBConnection.getDBConnection().prepareStatement(
                            RequiredQueries.QUERY_8C); 
                    }
                    break; 
                case "9":
                    stmt = DBConnection.getDBConnection().prepareStatement(
                            RequiredQueries.QUERY_9); 
                    break; 
                case "10":
                    stmt = DBConnection.getDBConnection().prepareStatement(
                            RequiredQueries.QUERY_10); 
                    break; 
                case "11":
                    stmt = DBConnection.getDBConnection().prepareStatement(
                            RequiredQueries.QUERY_11); 
                    break; 
                case "12":
                    stmt = DBConnection.getDBConnection().prepareStatement(
                            RequiredQueries.QUERY_12); 
                    break; 
                default: 
                    System.out.println("Unexpected fall through detected."); 
                    System.out.println("RequiredQueryApp.prepJobAndPIDINQuery()"); 
                    break; 
            } // end switch block 
            
            stmt.setString(1, this.jobCode); 
            stmt.setString(2, this.PID); 
        } // end try block
        
        catch (SQLException e) {
            e.printStackTrace(); 
        }
        
        return stmt; 
    } // end method prepJobAndPIDINQuery 


    /**
     * Creates <code>PreparedStatement</code> for each query that
     * requires on a job code IN variable (numbers 15-18). 
     * 
     * @return  a PreparedStatement for the required query 
     */
    private PreparedStatement prepJobINQuery() {
        PreparedStatement stmt = null; 
        try {
            switch (this.whichQuery) {
                case "15":
                    stmt = DBConnection.getDBConnection().prepareStatement(
                            RequiredQueries.QUERY_15); 
					stmt.setString(2, this.jobCode); 
                    break; 
                case "16":
                    stmt = DBConnection.getDBConnection().prepareStatement(
                            RequiredQueries.QUERY_16); 
                    break; 
                case "17":
                    stmt = DBConnection.getDBConnection().prepareStatement(
                            RequiredQueries.QUERY_17); 
                    break; 
                case "18":
                    stmt = DBConnection.getDBConnection().prepareStatement(
                            RequiredQueries.QUERY_18); 
                    break; 
                default: 
                    System.out.println("Unexpected fall through detected."); 
                    System.out.println("RequiredQueryApp.prepJobINQuery()"); 
                    break; 
            } // end switch block 
            
            stmt.setString(1, this.jobCode); 
        } // end try block
        
        catch (SQLException e) {
            e.printStackTrace(); 
        }
        
        return stmt; 
    } // end method prepJobINQuery
    

    /**
     * Creates a <code>PreparedStatement</code> for each query that
     * requires a SOC code or a SOC code and a missing-k threshold of
     * a SOC code and a person ID (numbers 19-22 and 28). 
     * 
     * @return  a PreparedStatement for the query 
     */
    private PreparedStatement prepSOCINQuery() {
        PreparedStatement stmt = null; 
        try {
            switch (this.whichQuery) {
                case "19":
                    stmt = DBConnection.getDBConnection().prepareStatement(
                            RequiredQueries.QUERY_19); 
                    stmt.setInt(2, Integer.parseInt(this.missingKField.getText()));
                    break; 
                case "20":
                    stmt = DBConnection.getDBConnection().prepareStatement(
                            RequiredQueries.QUERY_20); 
                    stmt.setInt(2, Integer.parseInt(this.missingKField.getText()));
                    break; 
                case "21": 
                    stmt = DBConnection.getDBConnection().prepareStatement(
                            RequiredQueries.QUERY_21); 
                    break; 
                case "22": 
                    stmt = DBConnection.getDBConnection().prepareStatement(
                            RequiredQueries.QUERY_22); 
                    break; 
                case "28":
                    stmt = DBConnection.getDBConnection().prepareStatement(
                            RequiredQueries.QUERY_28); 
                    stmt.setString(2, this.PID);
                    stmt.setString(3, this.PID); 
                    break; 
                default: 
                    System.out.println("Unexpected fall through detected."); 
                    System.out.println("RequiredQueryApp.prepSOCINQuery()"); 
                    break; 
            } // end switch block
            
            stmt.setString(1, this.SOCCode);
        } // end try block 
        
        catch (SQLException e){
            e.printStackTrace(); 
        }
        
        return stmt; 
    } // end method prepSOCINQuery 
    
    
    /**
     * Displays the results of the query being run by the user. 
     * 
     * @param   results     the ResultSet to display
     */
    private void displayResults(ResultSet results) {
        TableView<ObservableList<String>> resultView = new TableView(); // The view to show to user. 
        ObservableList<ObservableList<String>> extractedData = FXCollections.observableArrayList(); 
        
        try {
            // Get the column names for the TableView
            for (int i = 0; i < results.getMetaData().getColumnCount(); i++) {
                final int count = i; 
                TableColumn column = new TableColumn(results.getMetaData().getColumnName(i+1));
                column.setCellValueFactory(new Callback<CellDataFeatures<ObservableList<String>, String>, ObservableValue<String>>() {
                    @Override
                    public ObservableValue<String> call(CellDataFeatures<ObservableList<String>, String> p) {
                        ObservableList<String> stuff = p.getValue(); 
                        return new SimpleStringProperty(stuff.get(count)); 
                    }
                });
                resultView.getColumns().add(column); 
            }
            
            // Get the data to populate the TableView. 
            while (results.next()) {
                ObservableList<String> row = FXCollections.observableArrayList();
                for (int i = 1; i <= results.getMetaData().getColumnCount(); i++) {
                    row.add(results.getString(i)); 
                }
                extractedData.add(row); 
            } 
            resultView.setItems(extractedData); 
        }
        
        catch (SQLException e) {
            e.printStackTrace(); 
        }
        
        final Stage popView = new Stage(); 
        popView.initModality(Modality.WINDOW_MODAL);
        
        VBox popViewBox = new VBox(); 
        popViewBox.getChildren().add(resultView); 
        Scene popViewScene = new Scene(popViewBox); 
        popView.setTitle("Query Results: "); 
        popView.setScene(popViewScene); 
        popView.show(); 
    } // end method displayResults
    
    
    /**
     * Used for debugging purposes only. Prints the results of a 
     * query to the terminal. 
     * 
     * @param   results     the query results to display in GUI
     */
    private void printResultsToCL(ResultSet results) {
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
            System.out.println();       // Skip an extra line. 
        } // end try block 

        catch (SQLException e) {
            e.printStackTrace(); 
        } 
    } // end method printResultsToCL 


    /**
     * Enables the appropriate ComboBoxes in the UI when a 
     * query is selected. The submit button is always enabled. 
     * 
     * @param   queryNumber   the selected query
     */
    private void enableRelevantFields(String queryNumber) {
        switch (queryNumber) {
            case "1": 
            case "2": 
                this.CNPullDown.setDisable(false); 
                break; 
                
            case "5": 
            case "6": 
                this.skillOrCert.setDisable(false); 
            case "4":
            case "13": 
            case "14": 
                this.PIDPullDown.setDisable(false); 
                break; 
                
            case "7": 
                this.skillOrCert.setDisable(false); 
                this.jobOrCategory.setDisable(false); 
                this.JobPullDown.setDisable(false); 
                this.SOCPullDown.setDisable(false); 
                break; 
                
            case "8": 
                this.skillOrCert.setDisable(false); 
            case "9": 
            case "10": 
            case "11":
            case "12": 
                this.PIDPullDown.setDisable(false); 
            case "15":
            case "16": 
            case "17": 
            case "18": 
                this.JobPullDown.setDisable(false); 
                break; 
                
            case "19":
            case "20": 
                this.missingKBox.setDisable(false); 
            case "21":
            case "22": 
                this.SOCPullDown.setDisable(false); 
                break; 
                
            case "23": 
            case "24":
                this.numberOrPayroll.setDisable(false); 
                break; 
                
            case "25":
                this.ratioOrRate.setDisable(false); 
                this.NAICSPullDown.setDisable(false); 
                break; 
                
            case "28": 
                this.SOCPullDown.setDisable(false); 
                this.PIDPullDown.setDisable(false); 
                break; 
            
            default:    // 3, 26, and 27 are the only ones that should default. 
                break; 
        } // end switch block
        
        // Submit button must be activated irrespective of query. 
        this.submitButton.setDisable(false); 
    } // end method enableRelevantFields
    
    
    /**
     * Resets options in UI for fresh query selection. 
     */
    private void restoreDefaults() {
        this.PIDPullDown.setDisable(true); 
        this.CNPullDown.setDisable(true); 
        this.SOCPullDown.setDisable(true); 
        this.JobPullDown.setDisable(true); 
        this.NAICSPullDown.setDisable(true); 
        this.missingKBox.setDisable(true); 
        this.skillOrCert.setDisable(true);
        this.jobOrCategory.setDisable(true); 
        this.numberOrPayroll.setDisable(true); 
        this.ratioOrRate.setDisable(true); 
        this.submitButton.setDisable(true); 
    } // end method restoreDefaults 
} // end class RequiredQueryApp 