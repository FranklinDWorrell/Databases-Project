package databaseapp;

import java.sql.*; 
import java.math.*; 
import oracle.jdbc.*; 
import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.VBox;
import javafx.scene.text.Text; 
import javafx.scene.text.Font; 
import javafx.stage.Stage;

/**
 * The runner class for the entire database application. Allows
 * user to select a role and perform tasks specific to that role
 * by calling the relevant application. 
 * 
 * @author  Franklin D. Worrell
 * @version 23 April 2017
 */
public class DatabaseApp extends Application {
    
    /**
     * Creates three buttons that allow the user to select the
     * application they would like to launch an launches the
     * application the user selects. 
     * 
     * @param   primaryStage    the Application's primary stage
     */
    @Override
    public void start(Stage primaryStage) {
        // Launches part of app that helps company find potential hires. 
        Button careerBtn = new Button();
        careerBtn.setText("Hiring Company");
        careerBtn.setOnAction(new EventHandler<ActionEvent>() {

            @Override
            public void handle(ActionEvent event) {
                new EmployeeSeekerApp(primaryStage).runEMSApp(); 
            }
        });

        // Launches part of app to help someone find a job. 
        Button jobHuntBtn = new Button();
        jobHuntBtn.setText("Job Seeker");
        jobHuntBtn.setOnAction(new EventHandler<ActionEvent>() {

            @Override
            public void handle(ActionEvent event) {
                new JobSeekerApp(primaryStage).runJSApp(); 
            }
        });

        // Launches the part of the app dealing with the 28 required queries. 
        Button queryBtn = new Button();
        queryBtn.setText("Required Queries");
        queryBtn.setOnAction(new EventHandler<ActionEvent>() {

            @Override
            public void handle(ActionEvent event) {
                new RequiredQueryApp(primaryStage).runRQApp(); 
            }
        });

        // Buttons will be collected into center panel of a BorderPane. 
        VBox mainOptions = new VBox();
        mainOptions.getChildren().addAll(careerBtn, jobHuntBtn, queryBtn); 

        // Give use instructions for beginning program. 
        Text mainOptionsLabel = new Text("Please select a role:"); 
        mainOptionsLabel.setFont(new Font(18)); 

        // Create the BorderPane to display initial application contents. 
        BorderPane root = new BorderPane(); 
        root.setTop(mainOptionsLabel); 
        root.setCenter(mainOptions); 

        Scene scene = new Scene(root);

        primaryStage.setTitle("Explore Employees, Employers, or Education");
        primaryStage.setScene(scene);
        primaryStage.show();
    } // end method start 

    /**
     * Simply launches the application. 
     * 
     * @param   args    the command line arguments
     */
    public static void main(String[] args) {
        launch(args);
    } // end method main
} // end class DatabaseApp
