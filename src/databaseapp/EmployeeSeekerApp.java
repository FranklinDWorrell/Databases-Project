package databaseapp;

import controller.RequiredQueries;
import controller.PersonQueries;
import controller.JobCategoryQueries;
import controller.JobQueries;
import controller.CourseSectionQueries;
import model.Job;
import model.JobCategory;
import model.Person;
import model.CourseSection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.stage.Modality;
import javafx.stage.Stage;
import javafx.util.Callback;

/**
 * Implements hiring new employee application. Also allows for some
 * minimal additional functionality in terms of finding opening positions
 * in the company...
 * 
 * @author  Franklin D. Worrell
 * @version 29 April 2017
 */
public class EmployeeSeekerApp {
    private PersonQueries pQueries; 
    private JobQueries jQueries; 
    private CourseSectionQueries cSQueries; 
    private Stage primaryStage; 
    private String userCID; 
    private TextField IDGetter; 
    private String newHirePID;
    private String newHireJobCode; 
    
    /**
     * Creates a new instance of the application and initializes
     * all necessary GUI components. 
     * 
     * @param   primaryStage    the top-level GUI component
     */
    public EmployeeSeekerApp(Stage primaryStage) {
        // Reference to pass to buttons; 
        final EmployeeSeekerApp self = this; 
        
        this.pQueries = new PersonQueries(); 
        this.jQueries = new JobQueries(); 
        this.cSQueries = new CourseSectionQueries(); 
        
        this.primaryStage = primaryStage; 
        
        // Button that sets in motion process of hiring new employee. 
        Button hirePersonBtn = new Button(); 
        hirePersonBtn.setText("Hire a New Employee"); 
        hirePersonBtn.setOnAction(new EventHandler<ActionEvent>() {
           @Override
           public void handle(ActionEvent event) {
               self.hireNewEmployee(); 
           }
        });
        
        // Button that queries database for list of current employees.  
        Button currentEmployeesBtn = new Button();
        currentEmployeesBtn.setText("Get List of Current Employees");
        currentEmployeesBtn.setOnAction(new EventHandler<ActionEvent>() {
            @Override
            public void handle(ActionEvent event) {
                ResultSet results = pQueries.getCurrentEmployees(self.userCID); 
                self.displayResults(results);
            }
        });
        
        // Button that queries for list of current employees in a select category.  
        Button currentByCategoryBtn = new Button();
        currentByCategoryBtn.setText("See Current Employees in a Job Category");
        currentByCategoryBtn.setOnAction(new EventHandler<ActionEvent>() {
            @Override
            public void handle(ActionEvent event) {
                // Create a pop-up to get the desired job category. 
                final StringBuilder SOCDescription = new StringBuilder(); 
                Stage popUpSOC = new Stage(); 
               
                ComboBox SOCPullDown; 
                JobCategoryQueries jCQueries = new JobCategoryQueries(); 
                ArrayList<JobCategory> categories = jCQueries.getCompanyLeafNodes(
                    self.userCID); 
                ArrayList<String> SOCDescriptions = new ArrayList<String>(); 
                for (JobCategory category : categories) {
                    SOCDescriptions.add(category.getSOCDescription()); 
                }
                SOCPullDown = new ComboBox(); 
                SOCPullDown.getItems().addAll(SOCDescriptions); 
                SOCPullDown.setPromptText("Please select a Job Category: "); 
                SOCPullDown.valueProperty().addListener(new ChangeListener<String>() {
                    @Override 
                    public void changed(ObservableValue ov, String t, String t1) {                
                        SOCDescription.append(t1);  
                    } 
                }); 
                
                Button SOCSubmitBtn = new Button(); 
                SOCSubmitBtn.setText("Submit"); 
                SOCSubmitBtn.setOnAction(new EventHandler<ActionEvent>() {
                    @Override
                    public void handle(ActionEvent event) {
                        popUpSOC.hide();                 
                        // Query database and display results. 
                        ResultSet results = pQueries.getCurrentByCategory(
                                self.userCID, SOCDescription.toString()); 
                        self.displayResults(results);
                    }
                });
               
                VBox popUpSOCRoot = new VBox(); 
                popUpSOCRoot.getChildren().addAll(SOCPullDown, SOCSubmitBtn); 
                Scene popUpSOCScene = new Scene(popUpSOCRoot); 
                popUpSOC.setTitle("Company Tax ID Required"); 
                popUpSOC.setScene(popUpSOCScene); 
                popUpSOC.show(); 
            }
        });
        
        // Button that shows all open positions at company. 
        Button openPositionsBtn = new Button();
        openPositionsBtn.setText("See Your Company's Open Jobs");
        openPositionsBtn.setOnAction(new EventHandler<ActionEvent>() {
            @Override
            public void handle(ActionEvent event) {
                ResultSet results = jQueries.getOpenAtCompany(self.userCID); 
                self.displayResults(results);
            }
        });
       
        // Button that shows all open positions at company. 
        Button findQualifiedBtn = new Button();
        findQualifiedBtn.setText("See Fully Qualified Candidates");
        findQualifiedBtn.setOnAction(new EventHandler<ActionEvent>() {
            @Override
            public void handle(ActionEvent event) {
                self.getAndDisplayQualified(); 
            }
        });
        
        // Button that shows all open positions at company. 
        Button findQualifiedWithinThresholdBtn = new Button();
        findQualifiedWithinThresholdBtn.setText("See Partially Qualified Candidates");
        findQualifiedWithinThresholdBtn.setOnAction(new EventHandler<ActionEvent>() {
            @Override
            public void handle(ActionEvent event) {
                self.getAndDisplayPartiallyQualified(); 
            }
        });
        
        VBox root = new VBox(); 
        Label rootLabel = new Label("Please pick an action: "); 
        root.getChildren().addAll(rootLabel, hirePersonBtn, currentEmployeesBtn, 
                currentByCategoryBtn, openPositionsBtn, findQualifiedBtn,
                findQualifiedWithinThresholdBtn);  
        Scene scene = new Scene(root, 300, 300); 
        primaryStage.setTitle("Employer Application"); 
        primaryStage.setScene(scene); 
    } // end Constructor
    
    
    /**
     * Creates a <code>Stage</code> that collects the user's
     * person ID number for use in processing the queries that
     * will help that person find a job. After person ID is
     * submitted, the main application is started. 
     */
    public void runEMSApp() {
        // Create pop-up to get User's PID to process queries. 
        final Stage popForPID = new Stage(); 
        popForPID.initModality(Modality.WINDOW_MODAL);
        Label IDLabel = new Label("Please enter your company's FEIN: "); 
        this.IDGetter = new TextField(); 
        
        Button submitButton = new Button(); 
        submitButton.setText("Submit");
        submitButton.setOnAction(new EventHandler<ActionEvent>() {
            @Override
            public void handle(ActionEvent event) {
                userCID = IDGetter.getText(); 
                popForPID.hide();                 
                primaryStage.show(); 
            }
        });
        
        VBox popViewBox = new VBox(); 
        popViewBox.getChildren().addAll(IDLabel, this.IDGetter, submitButton); 
        Scene popViewScene = new Scene(popViewBox); 
        popForPID.setTitle("Company Tax ID Required"); 
        popForPID.setScene(popViewScene); 
        popForPID.show(); 
    } // end method runEMSApp 
    

    /**
     * Creates a pop-up window that allows a user to add a new
     * person to the database. User has the option of adding 
     * that person as working a particular job. 
     */
    private void hireNewEmployee() {
        final EmployeeSeekerApp self = this; 
        final Stage popForAddEmployee = new Stage(); 
        popForAddEmployee.initModality(Modality.WINDOW_MODAL);
        
        /* ComboBox to select person ID of new hire. */ 
        // Get list of person IDs for ComboBox. 
        ArrayList<Person> allPersons = pQueries.getAllPersons(); 
        ArrayList<String> allPIDs = new ArrayList<String>(); 
        for (Person person : allPersons) {
            allPIDs.add(person.getPersonID()); 
        }
        // Build the ComboBox
        ComboBox selectPID = new ComboBox(); 
        selectPID.getItems().addAll(allPIDs); 
        selectPID.setPromptText("Please select the new hire's SSN"); 
        selectPID.valueProperty().addListener(new ChangeListener<String>() {
            @Override 
            public void changed(ObservableValue ov, String t, String t1) {                
                self.newHirePID = t1;  
            } 
        }); 
        
        /* ComboBox to select job code for new hire. */
        // Get list of job codes for ComboBox. 
        ArrayList<Job> allJobs = jQueries.getListOfOpenAtCompany(this.userCID); 
        ArrayList<String> allJobCodes = new ArrayList<String>(); 
        for (Job job : allJobs) {
            allJobCodes.add(job.getJobCode()); 
        }
        // Build the ComboBox
        ComboBox selectJobCode = new ComboBox(); 
        selectJobCode.getItems().addAll(allJobCodes); 
        selectJobCode.setPromptText("Please select the job code for the hire"); 
        selectJobCode.valueProperty().addListener(new ChangeListener<String>() {
            @Override 
            public void changed(ObservableValue ov, String t, String t1) {                
                self.newHireJobCode = t1;  
            } 
        }); 
        
        /* Button to confirm selection of person ID and job code. */ 
        Button confirmBtn = new Button(); 
        confirmBtn.setText("Select"); 
        confirmBtn.setOnAction(new EventHandler<ActionEvent>() {
            @Override
            public void handle(ActionEvent event) {
                popForAddEmployee.hide(); 
                self.inputNewHireCoursesAndGetTrainingPlan(); 
            }
        });
        
        VBox selectRoot = new VBox(); 
        selectRoot.getChildren().addAll(selectPID, selectJobCode, confirmBtn); 
        Scene selectPIDAndJCScene = new Scene(selectRoot, 300, 300); 
        popForAddEmployee.setTitle("Please select Person and Job"); 
        popForAddEmployee.setScene(selectPIDAndJCScene); 
        popForAddEmployee.show(); 
    } // end method hireNewEmployee
    
    
    /**
     * Allows the user to input the courses a new hire has taken 
     * (presumably, the user has a transcript in front of them) and
     * then creates and displays a training plan for that person. 
     */
    private void inputNewHireCoursesAndGetTrainingPlan() {
        final EmployeeSeekerApp self = this; 
        final Stage popForAddHireCourses = new Stage(); 
        popForAddHireCourses.initModality(Modality.WINDOW_MODAL);
        VBox selectRoot = new VBox(); 
        final StringBuilder courseCode = new StringBuilder(); 
        final StringBuilder sectionNo = new StringBuilder(); 
        final StringBuilder year = new StringBuilder(); 
        final StringBuilder grade = new StringBuilder(); 
        
        /* ComboBox for selecting section number. */
        final ComboBox selectSectionNo = new ComboBox(); 
        selectSectionNo.setPromptText("Please select section number: "); 
        selectSectionNo.valueProperty().addListener(new ChangeListener<String>() {
            @Override
            public void changed(ObservableValue ov, String t, String t1) {
                sectionNo.append(t1);
            }
        });

        /* ComboBox for selecting section year. */
        final ComboBox selectYear = new ComboBox(); 
        selectYear.setPromptText("Please select section year: "); 
        selectYear.valueProperty().addListener(new ChangeListener<String>() {
            @Override
            public void changed(ObservableValue ov, String t, String t1) {
                year.append(t1);
                ArrayList<CourseSection> sectsByYear = self.cSQueries.getSectionsOfCourseByYear(
                        courseCode.toString(), t1); 
                ArrayList<String> sectionNos = new ArrayList<String>(); 
                for (CourseSection section : sectsByYear) {
                    sectionNos.add(section.getSectionNo()); 
                }
                
                selectSectionNo.getItems().addAll(sectionNos); 
            }
        });
        
        /* ComboBox to select person ID of new hire. */ 
        // Get list of person IDs for ComboBox. 
        ArrayList<CourseSection> allTaughtCourses = cSQueries.getAllTaughtCourses(); 
        Set<String> setOfAllTaughtCourseCodes = new HashSet<String>(); 
        for (CourseSection section : allTaughtCourses) {
            setOfAllTaughtCourseCodes.add(section.getCourseCode()); 
        }
        // Build the ComboBox
        ComboBox selectCCode = new ComboBox(); 
        selectCCode.getItems().addAll(setOfAllTaughtCourseCodes); 
        selectCCode.setPromptText("Please select a course code: "); 
        selectCCode.valueProperty().addListener(new ChangeListener<String>() {
            @Override 
            public void changed(ObservableValue ov, String t, String t1) {                
                courseCode.append(t1); 
                ArrayList<String> yearsByCourse = self.cSQueries.getYearListForCourse(
                        courseCode.toString()); 

                selectYear.getItems().addAll(yearsByCourse); 
            } 
        }); 
        
        /* TextField for entering grade. */ 
        HBox gradeGetter = new HBox(); 
        Label gradePrompt = new Label("Please enter grade: "); 
        final TextField gradeField = new TextField(); 
        gradeGetter.getChildren().addAll(gradePrompt, gradeField); 
        
        /* Button to confirm selection of course section and continue process. */ 
        Button confirmAndContinueBtn = new Button(); 
        confirmAndContinueBtn.setText("Update and Add Another Course"); 
        confirmAndContinueBtn.setOnAction(new EventHandler<ActionEvent>() {
            @Override
            public void handle(ActionEvent event) {
                grade.append(gradeField.getText()); 
                popForAddHireCourses.hide(); 
                // For Debugging: 
                System.out.println(
                self.cSQueries.insertIntoTakes(self.newHirePID, courseCode.toString(), 
                        sectionNo.toString(), year.toString(), grade.toString()));
                self.inputNewHireCoursesAndGetTrainingPlan(); 
            }
        });
        
        /* Button to confirm selection of course section and complete. */ 
        Button confirmBtn = new Button(); 
        confirmBtn.setText("Update and See Training Options"); 
        confirmBtn.setOnAction(new EventHandler<ActionEvent>() {
            @Override
            public void handle(ActionEvent event) {
                grade.append(gradeField.getText()); 
                popForAddHireCourses.hide(); 
                self.cSQueries.insertIntoTakes(self.newHirePID, courseCode.toString(), 
                        sectionNo.toString(), year.toString(), grade.toString());
                self.getAndDisplayTrainingPlan(self.newHirePID, self.newHireJobCode); 
            }
        });

        selectRoot.getChildren().addAll(selectCCode, selectYear, 
                selectSectionNo, gradeGetter, confirmAndContinueBtn, confirmBtn); 
        Scene selectPIDAndJCScene = new Scene(selectRoot, 300, 300); 
        popForAddHireCourses.setTitle("Please select relevant section data"); 
        popForAddHireCourses.setScene(selectPIDAndJCScene); 
        popForAddHireCourses.show(); 
    } // end method inputCoursesTaken


    /**
     * Given the courses a person has taken and the job they are being
     * hired for, returns a training plan to cover any missing 
     * required skills. 
     * 
     * @param   PID     the id of the person being hired 
     * @param   JC      the job_code of the position being filled 
     */
    private void getAndDisplayTrainingPlan(String PID, String JC) {
        try {
            PreparedStatement stmt = DBConnection.getDBConnection().prepareStatement(
                RequiredQueries.QUERY_12); 
            stmt.setString(1, JC); 
            stmt.setString(2, PID); 
            displayResults(stmt.executeQuery()); 
        }
        
        catch (SQLException e) {
            e.printStackTrace(); 
        }
    } // end method getAndDisplayTrainingPlan 
    
    
    /**
     * Queries the database for a list of people who are qualified 
     * for a position at the company. Displays results as a pop-up. 
     */
    private void getAndDisplayQualified() {
        final EmployeeSeekerApp self = this; 
        final Stage popForQualified = new Stage(); 
        popForQualified.initModality(Modality.WINDOW_MODAL);
        VBox selectRoot = new VBox(); 
        final StringBuilder jobCode = new StringBuilder(); 
        
        /* ComboBox for selecting job code for open position. */
        // Get ArrayList of this company's open positions. 
        ArrayList<Job> allJobs = jQueries.getListOfOpenAtCompany(this.userCID); 
        ArrayList<String> allJobCodes = new ArrayList<String>(); 
        for (Job job : allJobs) {
            allJobCodes.add(job.getJobCode()); 
        }
        // Build ComboBox to select open position job code. 
        final ComboBox selectOpenPosition = new ComboBox(); 
        selectOpenPosition.setPromptText("Please select section number: "); 
        selectOpenPosition.getItems().addAll(allJobCodes); 
        selectOpenPosition.valueProperty().addListener(new ChangeListener<String>() {
            @Override
            public void changed(ObservableValue ov, String t, String t1) {
                jobCode.append(t1);
            }
        });

        /* Button to confirm selection of course section and complete. */ 
        Button confirmBtn = new Button(); 
        confirmBtn.setText("See Qualified Candidates"); 
        confirmBtn.setOnAction(new EventHandler<ActionEvent>() {
            @Override
            public void handle(ActionEvent event) {
                popForQualified.hide(); 
                self.displayResults(self.pQueries.getQualified(
                    jobCode.toString()));
            }
        });

        selectRoot.getChildren().addAll(selectOpenPosition, confirmBtn); 
        Scene selectJCScene = new Scene(selectRoot, 300, 300); 
        popForQualified.setTitle("Please select relevant section data"); 
        popForQualified.setScene(selectJCScene); 
        popForQualified.show(); 
    } // end method getAndDisplayQualified
    
    
    /**
     * Queries the database for a list of people who are partially
     * qualified for a selected job with a certain threshold of 
     * missing skills. Displays results in a pop-up. 
     */
    private void getAndDisplayPartiallyQualified() {
        final EmployeeSeekerApp self = this; 
        final Stage popForPartiallyQualified = new Stage(); 
        popForPartiallyQualified.initModality(Modality.WINDOW_MODAL);
        VBox selectRoot = new VBox(); 
        final StringBuilder jobCode = new StringBuilder(); 
        
        /* ComboBox for selecting job code for open position. */
        ArrayList<Job> allJobs = jQueries.getListOfOpenAtCompany(this.userCID); 
        ArrayList<String> allJobCodes = new ArrayList<String>(); 
        for (Job job : allJobs) {
            allJobCodes.add(job.getJobCode()); 
        }
        
        final ComboBox selectOpenPosition = new ComboBox(); 
        selectOpenPosition.setPromptText("Please select section number: "); 
        selectOpenPosition.getItems().addAll(allJobCodes); 
        selectOpenPosition.valueProperty().addListener(new ChangeListener<String>() {
            @Override
            public void changed(ObservableValue ov, String t, String t1) {
                jobCode.append(t1);
            }
        });

        /* TextField for entering grade. */ 
        VBox thresholdGetter = new VBox(); 
        Label thresholdPrompt = new Label("Tolerable number of missing skills: "); 
        final TextField thresholdField = new TextField(); 
        thresholdGetter.getChildren().addAll(thresholdPrompt, thresholdField); 
        
        /* Button to confirm selection of course section and complete. */ 
        Button confirmBtn = new Button(); 
        confirmBtn.setText("See Partially Qualified Candidates"); 
        confirmBtn.setOnAction(new EventHandler<ActionEvent>() {
            @Override
            public void handle(ActionEvent event) {
                popForPartiallyQualified.hide(); 
                self.displayResults(self.pQueries.getQualifiedWithinThreshold(
                    jobCode.toString(), Integer.parseInt(thresholdField.getText())));
            }
        });

        selectRoot.getChildren().addAll(selectOpenPosition, thresholdGetter, 
                confirmBtn); 
        Scene selectJCAndKScene = new Scene(selectRoot, 300, 300); 
        popForPartiallyQualified.setTitle("Please select relevant section data"); 
        popForPartiallyQualified.setScene(selectJCAndKScene); 
        popForPartiallyQualified.show(); 
    } // end method getAndDisplayPartiallyQualified
    
    
    /**
     * Given a ResultSet, creates a pop-up window displaying the contents
     * of the ResultSet with the appropriate column headings. 
     * 
     * @param   results     the ResultSet to format and display in pop-up
     */
    private void displayResults(ResultSet results) {
        TableView<ObservableList<String>> resultView = new TableView(); // The view to show to user. 
        ObservableList<ObservableList<String>> extractedData = FXCollections.observableArrayList(); 
        
        try {
            // Get the column names for the TableView
            for (int i = 0; i < results.getMetaData().getColumnCount(); i++) {
                final int count = i; 
                TableColumn column = new TableColumn(results.getMetaData().getColumnName(i+1));
                // Tell columns what type of values to expect and how to process them. 
                column.setCellValueFactory(new Callback<TableColumn.CellDataFeatures<ObservableList<String>, String>, ObservableValue<String>>() {
                    @Override
                    public ObservableValue<String> call(TableColumn.CellDataFeatures<ObservableList<String>, String> p) {
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
} // end class EmployeeSeekerApp
