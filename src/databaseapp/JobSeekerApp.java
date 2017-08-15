package databaseapp;

import controller.JobQueries;
import model.Job;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
import javafx.scene.control.RadioButton;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.ToggleGroup;
import javafx.scene.layout.VBox;
import javafx.stage.Modality;
import javafx.stage.Stage;
import javafx.util.Callback;

/**
 * An application that allows the user to explore open jobs and 
 * find a job that matches their qualifications. 
 * 
 * @author  Franklin D. Worrell
 * @version 30 April 2017
 */
public class JobSeekerApp {
    private Stage primaryStage; 
    private String userPID; 
    private TextField IDGetter; 
    private JobQueries jQueries; 
    
    /**
     * Creates a new instance of the application and initializes
     * all necessary GUI components. 
     * 
     * @param   primaryStage    the top-level GUI component
     */
    public JobSeekerApp(Stage primaryStage) {
        this.primaryStage = primaryStage; 
        this.jQueries = new JobQueries(); 
        final JobSeekerApp self = this; 
        
        // Button that shows all open positions. 
        Button exploreOpenPositionsBtn = new Button(); 
        exploreOpenPositionsBtn.setText("Explore Open Positions");
        exploreOpenPositionsBtn.setOnAction(new EventHandler<ActionEvent>() {
            @Override
            public void handle(ActionEvent event) {
                self.exploreOpenPositions(); 
            }
        }); 
        
        Button viewWorkHistoryBtn = new Button(); 
        viewWorkHistoryBtn.setText("View Your Work History"); 
        viewWorkHistoryBtn.setOnAction(new EventHandler<ActionEvent>() {
           @Override
           public void handle(ActionEvent event) {
               self.getAndDisplayWorkHistory(); 
           }
        });
        
        // Button that shows all open positions for which the user is qualified.
        Button findQualifiedBtn = new Button(); 
        findQualifiedBtn.setText("Show Open Jobs Matching Your Qualifications"); 
        findQualifiedBtn.setOnAction(new EventHandler<ActionEvent>() {
           @Override
           public void handle(ActionEvent event) {
               self.getAndDisplayQualifiedPositions(); 
           }
        });
        
        // Button that shows all open positions for which user lacks one skill. 
        Button findAlmostQualifiedBtn = new Button(); 
        
        // Button that shows all open positions for user has one of preferred skills or certs. 
        Button findIdeallyQualifiedBtn = new Button();
        findIdeallyQualifiedBtn.setText("Show Open Jobs You're Ideal For"); 
        findIdeallyQualifiedBtn.setOnAction(new EventHandler<ActionEvent>() {
           @Override
           public void handle(ActionEvent event) {
               self.getAndDisplayIdealPositions(); 
           }
        });
        
        VBox root = new VBox(); 
        Label rootLabel = new Label("Please pick an action: "); 
        root.getChildren().addAll(rootLabel, viewWorkHistoryBtn, exploreOpenPositionsBtn, 
                findQualifiedBtn, //findAlmostQualifiedBtn, 
                findIdeallyQualifiedBtn);  
        Scene scene = new Scene(root, 300, 300); 
        primaryStage.setTitle("Job Hunting Application"); 
        primaryStage.setScene(scene); 
    } // end Constructor
    
    
    /**
     * Creates a <code>Stage</code> that collects the user's
     * person ID number for use in processing the queries that
     * will help that person find a job. After person ID is
     * submitted, the main application is started. 
     */
    public void runJSApp() {
        // Create pop-up to get User's PID to process queries. 
        final Stage popForPID = new Stage(); 
        popForPID.initModality(Modality.WINDOW_MODAL);
        Label IDLabel = new Label("Please enter your SSN: "); 
        this.IDGetter = new TextField(); 
        
        Button submitButton = new Button(); 
        submitButton.setText("Submit");
        submitButton.setOnAction(new EventHandler<ActionEvent>() {
            @Override
            public void handle(ActionEvent event) {
                userPID = IDGetter.getText(); 
                popForPID.hide();                 
                primaryStage.show(); 
            }
        });
        
        VBox popViewBox = new VBox(); 
        popViewBox.getChildren().addAll(IDLabel, this.IDGetter, submitButton); 
        Scene popViewScene = new Scene(popViewBox); 
        popForPID.setTitle("User's SSN Required"); 
        popForPID.setScene(popViewScene); 
        popForPID.show(); 
    } // end method runJSApp 
    
    /**
     * Retrieves a person's work history and displays it in a pop-up
     * <code>TableView</code> window. 
     */
    private void getAndDisplayWorkHistory() {
        final JobSeekerApp self = this; 
        try {
            PreparedStatement stmt = DBConnection.getDBConnection().prepareStatement(
                "SELECT job_title, start_date, end_date, job_description " + 
                "FROM Works NATURAL JOIN Job " + 
                "WHERE person_id = ?"); 
            stmt.setString(1, self.userPID); 
            ResultSet results = stmt.executeQuery(); 
            self.displayResults(results); 
        }
        
        catch (SQLException e) {
            e.printStackTrace(); 
        }
    } // end method getAndDisplayWorkHistory
    
    
    private void getAndDisplayQualifiedPositions() {
        this.displayResults(this.jQueries.getOpenMatchingSkills(this.userPID));
    } // end method getAndDisplayQualifiedPositions
    
    
    private void getAndDisplayIdealPositions() {
        this.displayResults(this.jQueries.getIdealPositions(this.userPID)); 
    } // end method getAndDisplayIdealPositions 
    
    
    /**
     * Creates a pop up of options allowing a user to see various
     * features of a posting for an open job position. 
     */
    private void exploreOpenPositions() {
        final JobSeekerApp self = this; 
        final Stage popForExploreOpen = new Stage(); 
        popForExploreOpen.initModality(Modality.WINDOW_MODAL);
        final StringBuilder openJobCode = new StringBuilder(); 
        
        /* ComboBox to select person ID of new hire. */ 
        // Get list of person IDs for ComboBox. 
        ArrayList<Job> allPositions = jQueries.getOpenPositions(); 
        ArrayList<String> allPosDescr = new ArrayList<String>(); 
        for (Job job : allPositions) {
            allPosDescr.add(job.getJobCode() + " " + job.getJobTitle()); 
        }
        // Build the ComboBox
        ComboBox selectJob = new ComboBox(); 
        selectJob.getItems().addAll(allPosDescr); 
        selectJob.setPromptText("Please select a job to explore: "); 
        selectJob.valueProperty().addListener(new ChangeListener<String>() {
            @Override 
            public void changed(ObservableValue ov, String t, String t1) { 
                openJobCode.delete(0, openJobCode.length());
                openJobCode.append(t1.substring(0, 5));  
            } 
        }); 
        
        /* Set of RadioButtons that determine what aspect of job user wants to see. */ 
        ToggleGroup queryOptions = new ToggleGroup(); 
        RadioButton seeTitleAndDescription = new RadioButton("See Description"); 
        seeTitleAndDescription.setToggleGroup(queryOptions);
        seeTitleAndDescription.setSelected(true); 
        RadioButton seeRequiredSkills = new RadioButton("See Required Skills"); 
        seeRequiredSkills.setToggleGroup(queryOptions); 
        RadioButton seeRequiredCertificates = new RadioButton(
                "See Required Certificates"); 
        seeRequiredCertificates.setToggleGroup(queryOptions); 
        RadioButton seePreferredSkills = new RadioButton("See Preferred Skills"); 
        seePreferredSkills.setToggleGroup(queryOptions); 
        RadioButton seePreferredCertificates = new RadioButton(
                "See Preferred Certificates"); 
        seePreferredCertificates.setToggleGroup(queryOptions); 

        /* Button to confirm selection of person ID and job code. */ 
        Button confirmBtn = new Button(); 
        confirmBtn.setText("Get Info!"); 
        confirmBtn.setOnAction(new EventHandler<ActionEvent>() {
            @Override
            public void handle(ActionEvent event) {
                if (seeTitleAndDescription.isSelected()) {
                    self.displayResults(jQueries.getTitleAndDescription(
                        openJobCode.toString())); 
                }

                else if (seeRequiredSkills.isSelected()) {
                    self.displayResults(jQueries.getRequiredSkills(
                        openJobCode.toString())); 
                }

                else if (seeRequiredCertificates.isSelected()) {
                    self.displayResults(jQueries.getRequiredCertificates(
                        openJobCode.toString())); 
                } 

                else if (seePreferredSkills.isSelected()) {
                    self.displayResults(jQueries.getPreferredSkills(
                        openJobCode.toString())); 
                } 

                else {
                    self.displayResults(jQueries.getPreferredCertificates(
                        openJobCode.toString())); 
                }
            }
        });
        
        VBox selectRoot = new VBox(); 
        selectRoot.getChildren().addAll(selectJob, seeTitleAndDescription, 
                seeRequiredSkills, seeRequiredCertificates, seePreferredSkills,
                seePreferredCertificates, confirmBtn); 
        Scene selectJobAndOptionsScene = new Scene(selectRoot, 300, 300); 
        popForExploreOpen.setTitle("Please select Job and Options"); 
        popForExploreOpen.setScene(selectJobAndOptionsScene); 
        popForExploreOpen.show(); 
    } // end method exploreOpenPositions
    
    
    /**
     * Displays the <code>ResultSet</code> passed in as parameter
     * in a JavaFX <code>TableView</code>.
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
                column.setCellValueFactory(
                    new Callback<TableColumn.CellDataFeatures<ObservableList<String>, String>, 
                    ObservableValue<String>>() {
                    @Override
                    public ObservableValue<String> call(
                        TableColumn.CellDataFeatures<ObservableList<String>, String> p) {
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
} // end class JobSeekerApp
