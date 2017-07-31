package controller;

/**
 * Contains Strings of SQL statements for use in constructing 
 * the <code>PreparedStatement</code> for each of them. These 
 * are the 28 required queries for the project. The text of 
 * each query as assigned is given as a multi-line comment 
 * above each String. 
 *
 * @author	Franklin D. Worrell
 * @version	4 May 2017
 */ 
public class RequiredQueries {
	
    /*
     * Query 1. List a company's workers by names. 
     */ 
    public static final String QUERY_1 = 
            "SELECT last_name, first_name, middle_name " + 
            "FROM Person NATURAL JOIN Works NATURAL JOIN " + 
                     "Job NATURAL JOIN Company " +
            "WHERE (company_name = ? AND end_date IS NULL)";  

    /*
     * Query 2. List a company's staff by salary in descending 
     * order. 
     */ 
    public static final String QUERY_2 = 
            "SELECT last_name, first_name, middle_name, pay_rate " + 
            "FROM Person NATURAL JOIN ( " +
                    "SELECT person_id, pay_rate " +
                    "FROM Works NATURAL JOIN Job NATURAL JOIN Company " + 
                    "WHERE company_name = ? AND pay_type = 'salary' AND " + 
                        "end_date IS NULL) " + 
            "ORDER BY pay_rate DESC, last_name ASC, first_name ASC, " + 
                            "middle_name ASC"; 

    /*
     * 3. 
     * List companies' labor cost (total salaries and wage rates by 
     * 1920 hours) in descending order.
     */ 
    public static final String QUERY_3 = 
            "SELECT company_name, SUM(salary) AS labor_cost " + 
            "FROM ( " + 
                    "SELECT company_name, person_id, ( " + 
                            "CASE " + 
                            "WHEN pay_type = 'salary' THEN pay_rate " + 
                            "ELSE pay_rate * 1920 " + 
                            "END) AS salary " + 
                    "FROM Works NATURAL JOIN Job NATURAL JOIN Company " + 
                    "WHERE end_date IS NULL ) " + 
            "GROUP BY company_name " + 
            "ORDER BY labor_cost DESC"; 

    /*
     * 4. 
     * Find all the jobs a person is currently holding and worked in 
     * the past.
     */ 
    public static final String QUERY_4 = 
            "SELECT job_code, job_title, start_date, end_date " + 
            "FROM Works NATURAL JOIN Job " + 
            "WHERE person_id = ? " + 
            "ORDER BY start_date DESC"; 

    /*
     * 5. Skills 
     * List a person's knowledge/skills in a readable format.
     */ 
    public static final String QUERY_5S = 
            "SELECT ks_title, ks_code " + 
            "FROM Has_Skill NATURAL JOIN Knowledge_Skill " + 
            "WHERE person_id = ?"; 

    /*
     * 5. Certificates
     * List a person's certificates in a readable format.
     */ 
    public static final String QUERY_5C = 
            "SELECT certificate_name, certificate_code " + 
            "FROM Has_Certificate NATURAL JOIN Certificate " + 
            "WHERE person_id = ?"; 

    /*
     * 6. Skills
     * List the skill gap of a worker between his/her job(s) and 
     * his/her skills.
     */ 
    public static final String QUERY_6S = 
            "SELECT ks_title, ks_code " + 
            "FROM Knowledge_Skill NATURAL JOIN (( " + 
                    "SELECT ks_code " + 
                    "FROM Works NATURAL JOIN Requires_Skill " + 
                    "WHERE person_id = ? AND end_date IS NULL) " + // CORRECTION!!!
                    "MINUS ( " + 
                    "SELECT ks_code " + 
                    "FROM Has_Skill " + 
                    "WHERE person_id = ?))"; 

    /*
     * 6. Certificates
     * List the certification gap of a worker between his/her job(s) 
     * and his/her certificates.
     */ 
    public static final String QUERY_6C = 
            "SELECT certificate_name, certificate_code " + 
            "FROM Certificate NATURAL JOIN (( " + 
                    "SELECT certificate_code " + 
                    "FROM Works NATURAL JOIN Requires_Certificate " + 
                    "WHERE person_id = ? AND end_date IS NULL) " + // CORRECTION!!! 
                    "MINUS ( " + 
                    "SELECT certificate_code " + 
                    "FROM Has_Certificate " + 
                    "WHERE person_id = ?))"; 

    /*
     * 7. A. Skills
     * List the required knowledge/skills of a job in a readable 
     * format. 
     */ 
    public static final String QUERY_7AS = 
            "SELECT ks_title, ks_code " + 
            "FROM Requires_Skill NATURAL JOIN Knowledge_Skill " + 
            "WHERE job_code = ?"; 

    /*
     * 7. A. Certificates
     * List the required certificates of a job in a readable 
     * format. 
     */ 
    public static final String QUERY_7AC = 
            "SELECT certificate_name, certificate_code " + 
            "FROM Requires_Certificate NATURAL JOIN Certificate " + 
            "WHERE job_code = ?"; 

    /*
     * 7. B. Skills
     * List the required knowledge/skills of a job category in a 
     * readable format. 
     */ 
    public static final String QUERY_7B = 
            "SELECT stks_description " + 
            "FROM Core_Job_Skills NATURAL JOIN Standard_Skill " + 
            "WHERE SOC_code = ?"; 

    /*
     * 8. Skills
     * List a person's missing knowledge/skills for a specific 
     * job in a readable format.
     */ 
    public static final String QUERY_8S = 
            "SELECT ks_title, ks_code " + 
            "FROM Knowledge_Skill NATURAL JOIN (( " + 
                    "SELECT ks_code " + 
                    "FROM Requires_Skill " + 
                    "WHERE job_code = ?) " + 
                    "MINUS ( " + 
                    "SELECT ks_code " + 
                    "FROM Has_Skill " + 
                    "WHERE person_id = ?))"; 

    /*
     * 8. Certificates 
     * List a person's missing certificates for a specific 
     * job in a readable format.	 
     */ 
    public static final String QUERY_8C = 
            "SELECT certificate_name, certificate_code " + 
            "FROM Certificate NATURAL JOIN (( " + 
                    "SELECT certificate_code " + 
                    "FROM Requires_Certificate " + 
                    "WHERE job_code = ?) " + 
                    "MINUS ( " + 
                    "SELECT certificate_code " + 
                    "FROM Has_Certificate " + 
                    "WHERE person_id = ?))"; 

    /*
     * 9. 
     * List the courses (course id and title) that each alone 
     * teaches all the missing knowledge/skills for a person to 
     * pursue a specific job.
     */ 
    public static final String QUERY_9 = 
            "WITH " + 
            "Missing_Skills(ks_code) AS (( " + 
                    "SELECT ks_code " + 
                    "FROM Requires_Skill " + 
                    "WHERE job_code = ?) " + 
                    "MINUS ( " +
                    "SELECT ks_code " + 
                    "FROM Has_Skill " + 
                    "WHERE person_id = ?)) " + 
            "SELECT course_code, course_title " + 
            "FROM Course C " + 
            "WHERE NOT EXISTS (( " + 
                    "SELECT ks_code " + 
                    "FROM Missing_Skills) " + 
                    "MINUS ( " + 
                    "SELECT ks_code " + 
                    "FROM Teaches_Skill T " + 
                    "WHERE C.course_code = T.course_code))"; 

    /*
     * 10. 
     * Suppose the skill gap of a worker and the requirement of 
     * a desired job can be covered by one course.  Find the 
     * "quickest" solution for this worker.  Show the course, 
     * section information and the completion date.
     */ 
    public static final String QUERY_10 = 
            "WITH " + 
            "Missing_Skills(ks_code) AS (( " + 
                    "SELECT ks_code " + 
                    "FROM Requires_Skill " + 
                    "WHERE job_code = ?) " + 
                    "MINUS ( " + 
                    "SELECT ks_code " + 
                    "FROM Has_Skill " + 
                    "WHERE person_id = ?)), " + 
            "Covering_Courses(course_code, course_title) AS ( " + 
                    "SELECT course_code, course_title " + 
                    "FROM Course C " + 
                    "WHERE NOT EXISTS (( " + 
                            "SELECT ks_code " + 
                            "FROM Missing_Skills) " + 
                            "MINUS ( " + 
                            "SELECT ks_code " + 
                            "FROM Teaches_Skill T " + 
                            "WHERE C.course_code = T.course_code))), " + 
            "Eligible_Sections(course_code, course_title, section_no, " + 
                                              "section_year, completion_date) AS ( " + 
                    "SELECT course_code, course_title, section_no, " + 
                               "section_year, completion_date " + 
                    "FROM Course_Section NATURAL JOIN Covering_Courses " + 
                    "WHERE completion_date > CURRENT_DATE) " + 
            "SELECT course_code, course_title, section_no, section_year, " + 
                       "completion_date " + 
            "FROM Eligible_Sections " + 
            "WHERE completion_date = ( " + 
                    "SELECT MIN(completion_date) " + 
                    "FROM Eligible_Sections)"; 

    /*
     * 11. 
     * Find the cheapest course to make up one's skill gap by 
     * showing the course to take and the cost (of the section price). 
     */ 
    public static final String QUERY_11 = 
            "WITH " + 
            "Missing_Skills(ks_code) AS (( " + 
                    "SELECT ks_code " + 
                    "FROM Requires_Skill " + 
                    "WHERE job_code = ?) " + 
                    "MINUS ( " + 
                    "SELECT ks_code " + 
                    "FROM Has_Skill " + 
                    "WHERE person_id = ?)), " + 
            "Covering_Courses(course_code, course_title) AS ( " +
                    "SELECT course_code, course_title " + 
                    "FROM Course C " + 
                    "WHERE NOT EXISTS (( " + 
                            "SELECT ks_code " + 
                            "FROM Missing_Skills) " + 
                            "MINUS ( " + 
                            "SELECT ks_code " + 
                            "FROM Teaches_Skill T " + 
                            "WHERE C.course_code = T.course_code))), " + 
            "Eligible_Sections(course_code, course_title, section_no, " + 
                                              "section_year, section_price) AS ( " + 
                    "SELECT course_code, course_title, section_no, " + 
                               "section_year, section_price " + 
                    "FROM Course_Section NATURAL JOIN Covering_Courses " + 
                    "WHERE completion_date > CURRENT_DATE) " + 
            "SELECT course_code, course_title, section_no, section_year, " + 
                       "section_price " + 
            "FROM Eligible_Sections " + 
            "WHERE section_price = ( " + 
                    "SELECT MIN(section_price) " + 
                    "FROM Eligible_Sections)"; 

    /*
     * 12. 
     * If query #9 returns nothing, then find the course sets that 
     * their combination covers all the missing knowledge/skills for 
     * a person to pursue a specific job.  The considered course sets 
     * will not include more than three courses.  If multiple course 
     * sets are found, list the course sets (with their course IDs) in 
     * the order of the ascending order of the course sets' total costs. 
     */  
    public static final String QUERY_12 = 
		"WITH " + 
		"All_Course_Triples (code_A, code_B, code_C) AS ( " + 
			"SELECT course_code as code_A, null as code_B , null as code_C " + 
			"FROM Course " + 
			"UNION " + 
			"SELECT A.course_code as code_A, B.course_code as code_B, null as code_C " + 
			"FROM Course A, Course B " + 
			"WHERE A.course_code > B.course_code " + 
			"UNION " + 
			"SELECT A.course_code as code_A, B.course_code as code_B, C.course_code as code_C " + 
			"FROM Course A, Course B, Course C " + 
			"WHERE A.course_code > B.course_code AND " + 
					"B.course_code > C.course_code), " + 
		"Required_Skills (ks_code) AS ( " + 
			"SELECT ks_code " + 
			"FROM Requires_Skill " + 
			"WHERE job_code = ?), " + 
		"Missing_Skills (ks_code) AS (( " + 
			"SELECT ks_code " + 
			"FROM Required_Skills) " + 
			"MINUS ( " + 
			"SELECT ks_code " + 
			"FROM Has_Skill " + 
			"WHERE person_ID = ?)), " + 
		"Satisfying_Sets (code_A, code_B, code_C) AS ( " + 
			"SELECT code_A, code_B, code_C " + 
			"FROM All_Course_Triples " + 
			"WHERE NOT EXISTS (( " + 
				"SELECT ks_code  " + 
				"FROM Missing_Skills) " + 
				"MINUS ( " + 
					"SELECT ks_code " + 
					"FROM Teaches_Skill " + 
					"WHERE course_code = code_A " + 
					"UNION " + 
					"SELECT ks_code " + 
					"FROM Teaches_Skill " + 
					"WHERE course_code = code_B " + 
					"UNION " + 
					"SELECT ks_code " + 
					"FROM Teaches_Skill " + 
					"WHERE course_code = code_C))), " + 
		"Satisfying_Sets_With_Counts (code_A, code_B, code_C, num_courses) AS ( " + 
			"SELECT code_A, code_B, code_C, ( " + 
				"CASE " + 
				"WHEN code_B IS NULL THEN 1 " + 
				"WHEN code_C IS NULL THEN 2 " + 
				"ELSE 3 " + 
				"END) AS num_courses " + 
			"FROM Satisfying_Sets " + 
			"ORDER BY num_courses), " + 
		"Minimal_Satisfying_Sets (code_A, code_B, code_C) AS ( " + 
			"SELECT code_A, code_B, code_C " + 
			"FROM Satisfying_Sets_With_Counts " + 
			"WHERE num_courses = (SELECT MIN(num_courses) FROM Satisfying_Sets_With_Counts)), " + 
		"Minimal_Sets_With_Cost (code_A, code_B, code_C, total_retail) AS ( " + 
			"SELECT code_A, code_B, code_C, ( " + 
				"(SELECT retail_price FROM Course WHERE course_code = code_A) + ( " + 
					"CASE " + 
					"WHEN code_B IS NULL THEN 0 " + 
					"ELSE (SELECT retail_price FROM Course WHERE course_code = code_B) " + 
					"END) + ( " + 
					"CASE " + 
					"WHEN code_C IS NULL THEN 0 " + 
					"ELSE (SELECT retail_price FROM Course WHERE course_code = code_C) " + 
					"END)) AS total_retail " + 
			"FROM Minimal_Satisfying_Sets " + 
			"ORDER BY total_retail ASC) " + 
		"SELECT code_A, code_B, code_C, total_retail " + 
		"FROM Minimal_Sets_With_Cost ";
			

    /*
     * 13. 
     * List all the job categories that a person is qualified for. 
     */ 
    public static final String QUERY_13 = 
		"WITH " + 
		"Persons_Core_Skills(stks_code) AS ( " + 
			"SELECT DISTINCT stks_code " + 
			"FROM Has_Skill NATURAL JOIN Knowledge_Skill " + 
			"WHERE person_id = ?), " + 
		"Qualified_Categories(SOC_code) AS ( " + 
		  "SELECT DISTINCT SOC_code " + 
		  "FROM Core_Job_Skills C " + 
		  "WHERE NOT EXISTS (( " + 
			"SELECT stks_code " + 
			"FROM Core_Job_Skills S " + 
			"WHERE C.SOC_code = S.SOC_code) " + 
			"MINUS ( " + 
			"SELECT stks_code " + 
			"FROM Persons_Core_Skills))) " + 
		"SELECT SOC_description, SOC_code " + 
		"FROM Qualified_Categories NATURAL JOIN Job_Category"; 

    /*
     * 14. 
     * Find the job with the highest pay rate for a person 
     * according to his/her skill qualification.
     */ 
    public static final String QUERY_14 = 
            "WITH " + 
            "Qualifies_For(job_code) AS ( " + 
                    "SELECT job_code " + 
                    "FROM Job J " + 
                    "WHERE NOT EXISTS (( " + 
                            "SELECT ks_code " + 
                            "FROM Requires_Skill R " + 
                            "WHERE J.job_code = R.job_code) " + 
                            "MINUS ( " + 
                            "SELECT ks_code " + 
                            "FROM Has_Skill " + 
                            "WHERE person_id = ?))), " + 
            "Has_Qualified_Salary(job_code, salary) AS ( " + 
                    "SELECT job_code, ( " + 
                            "CASE " + 
                            "WHEN pay_type = 'salary' THEN pay_rate " + 
                            "ELSE pay_rate * 1920 " + 
                            "END) AS salary " + 
                    "FROM Qualifies_For NATURAL JOIN Job NATURAL JOIN Works) " + 
            "SELECT job_title, job_description, salary " + 
            "FROM Job NATURAL JOIN Has_Qualified_Salary " + 
            "WHERE salary = ( " + 
                    "SELECT MAX(salary) " + 
                    "FROM Has_Qualified_Salary)"; 

    /*
     * 15. 
     * List all the names along with the emails of the persons 
     * who are qualified for a job. 
     */ 
    public static final String QUERY_15 = 
            "SELECT last_name, first_name, middle_name, email " + 
            "FROM Person P " + 
            "WHERE NOT EXISTS (( " + 
                    "SELECT ks_code " + 
                    "FROM Requires_Skill " + 
                    "WHERE job_code = ?) " + 
                    "MINUS ( " + 
                    "SELECT ks_code " + 
                    "FROM Has_Skill H " + 
                    "WHERE P.person_id = H.person_id)) " + 
                    "AND NOT EXISTS (( " + 
                    "SELECT certificate_code " + 
                    "FROM Requires_Certificate " + 
                    "WHERE job_code = ?) " + 
                    "MINUS ( " + 
                    "SELECT certificate_code " + 
                    "FROM Has_Certificate C " + 
                    "WHERE P.person_id = C.person_id)) "; 

    /*
     * 16. 
     * When a company cannot find any qualified person for a 
     * job, a secondary solution is to find a person who is 
     * almost qualified to the job.  Make a "missing-one" list 
     * that lists people who miss only one skill for a specified job. 
     */ 
    public static final String QUERY_16 = 
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
            "WHERE no_ks_missing = 1";

    /*
     * 17. 
     * List the skillID and the number of people in the missing-one 
     * list for a given job code in the ascending order of the people 
     * counts. 
     */ 
    public static final String QUERY_17 = 
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
                            "FROM Has_Skill))), " + 
            "Missing_One(person_id) AS ( " + 
                    "SELECT person_id " + 
                    "FROM ( " + 
                            "SELECT person_id, COUNT(ks_code) AS no_ks_missing " + 
                            "FROM Lacks_Skill " + 
                            "GROUP BY person_id) " + 
                    "WHERE no_ks_missing = 1) " + 
            "SELECT ks_code, COUNT(person_id) as no_without " + 
            "FROM Lacks_Skill NATURAL JOIN Missing_One " + 
            "GROUP BY ks_code " + 
            "ORDER BY no_without ASC"; 

    /*
     * 18. 
     * Suppose there is a new job that has nobody qualified.  List 
     * the persons who miss the least number of skills and report 
     * the "least number". 
     */ 
    public static final String QUERY_18 = 
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
                            "FROM Has_Skill))), " + 
            "Lacks_Num_Skills(person_id, no_ks_missing) AS ( " + 
                    "SELECT person_id, COUNT(ks_code) AS no_ks_missing " + 
                    "FROM Lacks_Skill " + 
                    "GROUP BY person_id) " + 
            "SELECT person_id, no_ks_missing, last_name, first_name, email " + 
            "FROM Lacks_Num_Skills NATURAL JOIN Person " + 
            "WHERE no_ks_missing = ( " + 
                    "SELECT MIN(no_ks_missing) " + 
                    "FROM Lacks_Num_Skills)"; 

    /*
     * 19. 
     * For a specified job category and a given small number k, 
     * make a "missing-k" list that lists the people's IDs and 
     * the number of missing skills for the people who miss only 
     * up to k skills in the ascending order of missing skills.
     */ 
    public static final String QUERY_19 = 
        "WITH " + 
        "Job_Cat_Requires(stks_code) AS ( " + 
        "   SELECT stks_code " + 
        "   FROM Core_Job_Skills " + 
        "   WHERE SOC_code = ?),  " + 
        "All_With_All_Required(person_id, stks_code) AS ( " + 
        "   SELECT person_id, stks_code " + 
        "   FROM Job_Cat_Requires, (SELECT person_id FROM Person)), " + 
        "Has_Standard_Skill (person_id, stks_code) AS ( " + 
        "   SELECT person_id, stks_code " + 
        "   FROM Has_Skill NATURAL JOIN Knowledge_Skill), " + 
        "Lacks_Skill(person_id, stks_code) AS ( " + 
        "   SELECT person_id, stks_code " + 
        "   FROM All_With_All_Required " + 
        "   MINUS SELECT person_id, stks_code " + 
        "   FROM Has_Standard_Skill) " + 
        "SELECT person_id, COUNT(stks_code) AS no_stks_missing " + 
        "FROM Lacks_Skill " + 
        "GROUP BY person_id " + 
        "HAVING COUNT(stks_code) <= ? " +  
        "ORDER BY COUNT(stks_code) ASC ";
    
    /*
     * 20. 
     * Given a job category code and its corresponding missing-k 
     * list specified in Question 19.  Find every skill that is 
     * needed by at least one person in the given missing-k list.  
     * List each skillID and the number of people who need it in 
     * the descending order of the people counts.
     */ 
    public static final String QUERY_20 = 
        "WITH " + 
        "Job_Cat_Requires(stks_code) AS ( " + 
        "   SELECT stks_code " + 
        "   FROM Core_Job_Skills " + 
        "   WHERE SOC_code = ?),  " + 
        "All_With_All_Required(person_id, stks_code) AS ( " + 
        "   SELECT person_id, stks_code " + 
        "   FROM Job_Cat_Requires, (SELECT person_id FROM Person)), " + 
        "Has_Standard_Skill (person_id, stks_code) AS ( " + 
        "   SELECT person_id, stks_code " + 
        "   FROM Has_Skill NATURAL JOIN Knowledge_Skill), " + 
        "Lacks_Skill(person_id, stks_code) AS ( " + 
        "   SELECT person_id, stks_code " + 
        "   FROM All_With_All_Required " + 
        "   MINUS SELECT person_id, stks_code " + 
        "   FROM Has_Standard_Skill), " + 
        "Lacks_Num_Skills(person_id, no_stks_missing) AS ( " + 
        "   SELECT person_id, COUNT(stks_code) AS no_stks_missing " + 
        "   FROM Lacks_Skill " + 
        "   GROUP BY person_id " + 
        "   HAVING COUNT(stks_code) <= ?) " + 
        "SELECT stks_code, COUNT(person_id) " + 
        "FROM Lacks_Num_Skills NATURAL JOIN Lacks_Skill " +
        "GROUP BY stks_code " + 
        "ORDER BY COUNT(person_id) ASC "; 

    /*
     * 21. 
     * In a local or national crisis, we need to find all the 
     * people who once held a job of the special job category 
     * identifier.
     */ 
    public static final String QUERY_21 = 
            "SELECT last_name, first_name, middle_name, email " + 
            "FROM Person NATURAL JOIN ( " + 
                "SELECT DISTINCT person_id " + 
                "FROM Works NATURAL JOIN Categorizes_Job " + 
                "WHERE SOC_code = ?)";

    /*
     * 22. 
     * Find all the unemployed people who once held a job of the 
     * given job identifier.
     */ 
    public static final String QUERY_22 = 
            "WITH " + 
            "Employed_IDs(person_id) AS ( " + 
                "SELECT person_id " +
                "FROM Works " + 
                "WHERE end_date IS NULL), " + 
            "Unemployed_IDs(person_id) AS ( " + 
                "SELECT person_id " + 
                "FROM Person " + 
                "MINUS ( " + 
                "SELECT person_id " + 
                "FROM Employed_IDs)) " + 
            "SELECT last_name, first_name, middle_name, email " + 
            "FROM Person NATURAL JOIN Unemployed_IDs NATURAL JOIN " + 
                     "Works NATURAL JOIN Categorizes_Job " + 
            "WHERE SOC_code = ?"; 

    /*
     * 23. A. In terms of number of employees
     * Find out the biggest employer in terms of number of 
     * employees.
     */ 
    public static final String QUERY_23A = 
            "WITH " + 
            "Currently_Works(person_id, job_code) AS ( " + 
                    "SELECT person_id, job_code " + 
                    "FROM Works " + 
                    "WHERE end_date IS NULL), " + 
            "Employs_Count(company_id, no_employees) AS ( " + 
                    "SELECT company_id, " + 
                               "COUNT(DISTINCT person_id) as no_employees " + 
                    "FROM Currently_Works NATURAL JOIN Job " + 
                    "GROUP BY company_id) " +
            "SELECT company_name, no_employees " + 
            "FROM Company NATURAL JOIN Employs_Count " + 
            "WHERE no_employees = ( " + 
                    "SELECT MAX(no_employees) " + 
                    "FROM Employs_Count)"; 

    /*
     * 23. B. In terms of the total salaries and wages
     * Find out the biggest employer in terms of the total 
     * amount of salaries and wages paid to employees.
     */ 
    public static final String QUERY_23B = 
            "WITH " + 
            "Currently_Works(person_id, job_code) AS ( " + 
                    "SELECT person_id, job_code " + 
                    "FROM Works " + 
                    "WHERE end_date IS NULL), " + 
            "Payroll(company_name, labor_cost) AS ( " + 
                    "SELECT company_name, SUM(salary) AS labor_cost " + 
                    "FROM ( " + 
                            "SELECT company_name, person_id, ( " + 
                                    "CASE " + 
                                    "WHEN pay_type = 'salary' THEN pay_rate " + 
                                    "ELSE pay_rate * 1920 " + 
                                    "END) AS salary " + 
                            "FROM Currently_Works NATURAL JOIN " + 
                                    "Works NATURAL JOIN Job NATURAL JOIN Company) " + 
                    "GROUP BY company_name) " + 
            "SELECT company_name, labor_cost " + 
            "FROM Payroll " + 
            "WHERE labor_cost = ( " + 
                    "SELECT MAX(labor_cost) " + 
                    "FROM Payroll)";

    /*
     * 24. A. In terms of number of employees. 
     * Find out the job distribution among business sectors; 
     * find out the biggest sector in terms of number of employees.
     */ 
    public static final String QUERY_24A = 
            "WITH " + 
            "Currently_Works(person_id, job_code) AS ( " + 
                    "SELECT person_id, job_code " + 
                    "FROM Works " + 
                    "WHERE end_date IS NULL), " + 
            "Employs_Count(company_id, no_employees) AS ( " + 
                    "SELECT company_id, " + 
                               "COUNT(DISTINCT person_id) AS no_employees " + 
                    "FROM Currently_Works NATURAL JOIN Job " + 
                    "GROUP BY company_id), " + 
            "Sector_Workers_Count(NAICS_code, no_sect_employees) AS ( " + 
                    "SELECT primary_sector AS NAICS_code, " + 
                               "SUM(no_employees) AS no_sect_employees " + 
                    "FROM Employs_Count NATURAL JOIN Company " + 
                    "GROUP BY primary_sector)	" + 
            "SELECT NAICS_code, NAICS_description, no_sect_employees " + 
            "FROM Business_Sector NATURAL JOIN Sector_Workers_Count " + 
            "WHERE no_sect_employees = ( " + 
                    "SELECT MAX(no_sect_employees) " + 
                    "FROM Sector_Workers_Count)"; 

    /* 
     * 24. B. In terms of the total salaries and wages
     * Find out the job distribution among business sectors; 
     * find out the biggest sector in terms of the total amount 
     * of salaries and wages paid to employees.
     */ 
    public static final String QUERY_24B = 
            "WITH " + 
            "Currently_Works(person_id, job_code) AS ( " + 
                    "SELECT person_id, job_code " + 
                    "FROM Works " + 
                    "WHERE end_date IS NULL), " + 
            "Sector_Payroll(NAICS_code, labor_cost) AS ( " + 
                    "SELECT primary_sector AS NAICS_code, " + 
                               "SUM(salary) AS labor_cost " + 
                    "FROM ( " + 
                            "SELECT primary_sector, person_id, ( " + 
                                    "CASE " + 
                                    "WHEN pay_type = 'salary' THEN pay_rate " + 
                                    "ELSE pay_rate * 1920 " + 
                                    "END) AS salary " + 
                            "FROM Currently_Works NATURAL JOIN " + 
                                     "Works NATURAL JOIN Job NATURAL JOIN Company) " + 
                    "GROUP BY primary_sector) " + 
            "SELECT NAICS_code, NAICS_description, labor_cost " + 
            "FROM Business_Sector NATURAL JOIN Sector_Payroll " + 
            "WHERE labor_cost = ( " + 
                    "SELECT MAX(labor_cost) " + 
                    "FROM Sector_Payroll)";

    /* 
     * 25. A. 
     * Find out the ratio between the people whose earnings 
     * increase and those whose earnings decrease.
     */ 
    public static final String QUERY_25A = 
            "WITH " + 
            "Salaries(person_id, start_date, salary) AS ( " + 
                    "SELECT person_id, start_date, ( " + 
                            "CASE " + 
                            "WHEN pay_type = 'salary' THEN pay_rate " + 
                            "ELSE pay_rate * 1920 " + 
                            "END) AS salary " + 
                    "FROM Works NATURAL JOIN Job " + 
                    "ORDER BY person_id, start_date ASC), " + 
            "First_And_Last(person_id, start_salary, end_salary) AS ( " + 
                    "SELECT person_id, ( " + 
                            "SELECT salary " + 
                            "FROM Salaries A " + 
                            "WHERE start_date = ( " + 
                                    "SELECT MIN(start_date) " + 
                                    "FROM Salaries L " + 
                                    "WHERE S.person_id = A.person_id AND " + 
                                            "A.person_id = L.person_id)) " + 
                            "AS start_salary, ( " + 
                            "SELECT salary " + 
                            "FROM Salaries B " + 
                            "WHERE start_date = ( " + 
                                    "SELECT MAX(start_date) " + 
                                    "FROM SALARIES R " + 
                                    "WHERE S.person_id = B.person_id AND " + 
                                            "B.person_id = R.person_id)) " + 
                            "AS end_salary " + 
                    "FROM Salaries S), " + 
            "Salary_Changes(person_id, difference) AS ( " + 
                    "SELECT person_id, " + 
                               "(end_salary - start_salary) AS difference " + 
                    "FROM First_And_Last) " + 
            "SELECT incr_count / decr_count " + 
            "FROM ( " + 
                    "SELECT COUNT(person_id) AS incr_count " + 
                    "FROM Salary_Changes " + 
                    "WHERE difference > 0), (" + 
                    "SELECT COUNT(person_id) AS decr_count " + 
                    "FROM Salary_Changes " + 
                    "WHERE difference < 0) "; 

    /* 
     * 25. B. 
     * Find the average rate of earning improvement for the 
     * workers in a specific business sector. 
     */ 
    public static final String QUERY_25B = 
            "WITH " + 
            "Salaries(person_id, job_code, start_date, salary) AS ( " + 
                    "SELECT person_id, job_code, start_date, ( " + 
                               "CASE " + 
                               "WHEN pay_type = 'salary' THEN pay_rate " + 
                               "ELSE pay_rate * 1920 " + 
                               "END) AS salary " + 
                    "FROM Works NATURAL JOIN Job NATURAL JOIN Company " + 
                    "WHERE primary_sector = ?), " + 
            "First_And_Last(person_id, first_date, first_salary, " + 
                                       "last_date, last_salary) AS ( " + 
                    "SELECT person_id, ( " + 
                            "SELECT MIN(start_date) " + 
                            "FROM Salaries Z " + 
                            "WHERE S.person_id = Z.person_id) AS first_date, ( " + 
                            "SELECT salary " + 
                            "FROM Salaries A " + 
                            "WHERE start_date = ( " + 
                                    "SELECT MIN(start_date) " + 
                                    "FROM Salaries L " + 
                                    "WHERE S.person_id = A.person_id AND " +
                                            "A.person_id = L.person_id)) " + 
                            "AS first_salary, ( " + 
                            "SELECT MAX(start_date) " + 
                            "FROM Salaries Z " + 
                            "WHERE S.person_id = Z.person_id) AS last_date, ( " + 
                            "SELECT salary " + 
                            "FROM Salaries B " + 
                            "WHERE start_date = ( " + 
                                    "SELECT MAX(start_date) " + 
                                    "FROM SALARIES R " + 
                                    "WHERE S.person_id = B.person_id AND " + 
                                            "B.person_id = R.person_id)) " + 
                            "AS last_salary " + 
                    "FROM Salaries S), " + 
            "Salary_Changes(person_id, salary_difference, time) AS ( " + 
                    "SELECT person_id, " + 
                               "(last_salary - first_salary) AS salary_difference, " + 
                               "(last_date - first_date) AS time " + 
                    "FROM First_And_Last) " + 
            "SELECT SUM(salary_difference) / SUM(time) " + 
            "FROM Salary_Changes";

    /*
     * 26. 
     * Find the leaf-node job categories that have the most 
     * openings due to lack of qualified workers.  If there 
     * are many opening jobs of a job category but at the 
     * same time there are many qualified jobless people,  
     * then training cannot help fill up this type of job.  
     * What we want to find is such a job category that has 
     * the largest difference between vacancies (the unfilled 
     * jobs of this category) and the number of jobless people 
     * who are qualified for the jobs of this category.
     */ 
    public static final String QUERY_26 = 
            "WITH " + 
            "Leaf_Node_Category(SOC_code) AS ( " + 
                    "SELECT SOC_code " + 
                    "FROM (( " + 
                            "SELECT DISTINCT SOC_code " + 
                            "FROM Job_Category) " + 
                            "MINUS ( " + 
                            "SELECT DISTINCT parent_SOC " + 
                            "FROM Parent_Category))), " + 
            "Filled_Jobs(job_code) AS ( " + 
                    "SELECT job_code " + 
                    "FROM Works " + 
                    "WHERE end_date IS NULL), " + 
            "Unfilled_Jobs(job_code) AS ( " + 
                    "SELECT job_code " + 
                    "FROM (( " + 
                            "SELECT job_code " + 
                            "FROM Job) " + 
                            "MINUS ( " + 
                            "SELECT job_code " + 
                            "FROM Filled_Jobs))), " + 
            "Employed_IDs(person_id) AS ( " + 
                    "SELECT person_id " + 
                    "FROM Works " + 
                    "WHERE end_date IS NULL), " + 
            "Unemployed_IDs(person_id) AS ( " + 
                    "SELECT person_id " + 
                    "FROM Person " + 
                    "WHERE person_id NOT IN ( " + 
                            "SELECT person_id " + 
                            "FROM Employed_IDs)), " + 
            "Vacancies_By_Category(SOC_code, no_vacancies) AS ( " + 
                    "SELECT SOC_code, COUNT(job_code) AS no_vacancies " + 
                    "FROM Unfilled_Jobs NATURAL JOIN " + 
                             "Categorizes_Job NATURAL JOIN " + 
                             "Leaf_Node_Category " + 
                    "GROUP BY SOC_code), " + 
            "Qualified_By_Category(SOC_code, no_qualified) AS ( " + 
                    "SELECT SOC_code, COUNT(person_id) AS no_qualified " + 
                    "FROM Unemployed_IDs U, Leaf_Node_Category L " + 
                    "WHERE NOT EXISTS(( " + 
                            "SELECT stks_code " + 
                            "FROM Leaf_Node_Category NATURAL JOIN " + 
                                     "Core_Job_Skills " + 
                            "WHERE L.SOC_code = SOC_code) " + 
                            "MINUS ( " +
                            "SELECT stks_code " + 
                            "FROM Unemployed_IDs NATURAL JOIN " + 
                                     "Has_Skill NATURAL JOIN Standard_Skill " + 
                            "WHERE U.person_id = person_id)) " + 
                    "GROUP BY SOC_code), " + 
            "Differences_By_Category(SOC_code, difference) AS ( " + 
                    "SELECT SOC_code, " + 
                               "(no_vacancies - no_qualified) AS difference " + 
                    "FROM Vacancies_By_Category NATURAL JOIN " + 
                             "Qualified_By_Category) " + 
            "SELECT SOC_code, SOC_description, no_vacancies " + 
            "FROM Job_Category NATURAL JOIN " + 
                "Differences_By_Category NATURAL JOIN Vacancies_By_Category " + 
            "WHERE difference = ( " + 
                    "SELECT MAX(difference) " + 
                    "FROM Differences_By_Category)";

    /*
     * 27. 
     * Find the courses that can help most jobless people find a 
     * job by training them toward the jobs of this category that 
     * have the most openings due to lack of qualified workers.
     */ 
    public static final String QUERY_27 = 
        "WITH " + 
        "Leaf_Node_Category(SOC_code) AS ( " +
        "	SELECT SOC_code " + 
        "	FROM (( " +
        "		SELECT DISTINCT SOC_code " +
        "		FROM Job_Category) " +
        "		MINUS ( " + 
        "		SELECT DISTINCT parent_SOC " + 
        "		FROM Parent_Category))), " +
        "Filled_Jobs(job_code) AS ( " + 
        "	SELECT job_code " +
        "	FROM Works " +
        "	WHERE end_date IS NULL), " +
        "Unfilled_Jobs(job_code) AS ( " + 
        "	SELECT job_code " + 
        "	FROM (( " + 
        "		SELECT job_code " + 
        "		FROM Job) " + 
        "		MINUS ( " + 
        "		SELECT job_code " + 
        "		FROM Filled_Jobs))), " + 
        "Employed_IDs(person_id) AS ( " + 
        "	SELECT person_id " + 
        "	FROM Works " + 
        "	WHERE end_date IS NULL), " + 
        "Unemployed_IDs(person_id) AS ( " +
        "	SELECT person_id " +  
        "	FROM Person " + 
        "	WHERE person_id NOT IN ( " + 
        "		SELECT person_id " + 
        "		FROM Employed_IDs)), " + 
        "Vacancies_By_Category(SOC_code, no_vacancies) AS ( " + 
        "	SELECT SOC_code, COUNT(job_code) AS no_vacancies " + 
        "	FROM Unfilled_Jobs NATURAL JOIN " + 
        "		 Categorizes_Job NATURAL JOIN " + 
        "		 Leaf_Node_Category " +  
        "	GROUP BY SOC_code), " +
        "Qualified_By_Category(SOC_code, no_qualified) AS ( " +
        "	SELECT SOC_code, COUNT(person_id) AS no_qualified " +
        "	FROM Unemployed_IDs U, Leaf_Node_Category L " + 
        "	WHERE NOT EXISTS(( " + 
        "		SELECT stks_code " + 
        "		FROM Leaf_Node_Category NATURAL JOIN " + 
        "			Core_Job_Skills " + 
        "		WHERE L.SOC_code = SOC_code) " +
        "		MINUS ( " + 
        "		SELECT stks_code " + 
        "		FROM Unemployed_IDs NATURAL JOIN " +
        "			Has_Skill NATURAL JOIN Standard_Skill " +
        "		WHERE U.person_id = person_id)) " +
        "		GROUP BY SOC_code), " +
        "Differences_By_Category(SOC_code, difference) AS ( " +
        "	SELECT SOC_code, " + 
        "		   (no_vacancies - no_qualified) AS difference " +
        "	FROM Vacancies_By_Category NATURAL JOIN " +
        "		Qualified_By_Category), " +
        "Most_Open_Category(SOC_code) AS ( " +
        "	SELECT SOC_code " +
        "	FROM Differences_By_Category " +
        "	WHERE difference = ( " +
        "		SELECT MAX(difference) " +
        "		FROM Differences_By_Category)), " + 
        "Skills_Most_Open(stks_code) AS ( " + 
        "	SELECT stks_code " + 
        "	FROM Core_Job_Skills NATURAL JOIN Most_Open_Category), " + 
        "Teaches_Core_Skill(course_code, stks_code) AS ( " + 
        "   SELECT course_code, stks_code " + 
        "   FROM Teaches_Skill NATURAL JOIN Knowledge_Skill) " + 
        "SELECT course_code " + 
        "FROM Course C " + 
        "WHERE NOT EXISTS (( " + 
        "   SELECT stks_code " + 
        "   FROM Skills_Most_Open) " + 
        "   MINUS ( " + 
        "   SELECT stks_code " + 
        "   FROM Teaches_Core_Skill T " + 
        "   WHERE C.course_code = T.course_code)) "; 

    /*
     * 28. 
     * List all the courses, directly or indirectly required, 
     * that a person has to take in order to be qualified for 
     * a job of the given category, according to his/her skills 
     * possessed and courses taken. (Required for graduate 
     * students only.)
     */ 
    public static final String QUERY_28 = 
        "WITH " + 
        "Required_Core_Skills(stks_code) AS ( " + 
        "   SELECT stks_code " + 
        "   FROM Core_Job_Skills " + 
        "   WHERE SOC_code = ?), " + 
        "Persons_Core_Skills(stks_code) AS ( " + 
        "   SELECT stks_code " + 
        "   FROM Has_Skill NATURAL JOIN Knowledge_Skill " + 
        "   WHERE person_id = ?), " + 
        "Persons_Missing_Core_Skills(stks_code) AS (( " + 
        "   SELECT stks_code " + 
        "   FROM Required_Core_Skills) " + 
        "   MINUS ( " + 
        "   SELECT stks_code " + 
        "   FROM Persons_Core_Skills)), "  + 
        "Course_Teaching_Missing(course_code) AS ( " + 
        "   SELECT course_code " + 
        "   FROM Course C " + 
        "   WHERE NOT EXISTS (( " + 
        "       SELECT stks_code " + 
        "       FROM Persons_Missing_Core_Skills) " + 
        "       MINUS ( " + 
        "       SELECT stks_code " + 
        "       FROM Teaches_Skill NATURAL JOIN Knowledge_Skill " + 
        "       WHERE course_code = C.course_code))), " + 
        "Rec_Prereq(course_code, prereq_code) AS ( " +
        "   SELECT course_code, prereq_code " + 
        "   FROM Prerequisite NATURAL JOIN Course_Teaching_Missing " + 
        "   UNION ALL " +
        "   SELECT Rec_Prereq.course_code, Prerequisite.prereq_code " + 
        "   FROM Rec_Prereq, Prerequisite " +
        "   WHERE Rec_Prereq.prereq_code = Prerequisite.course_code) " +
        "(SELECT course_code " + 
        "FROM Rec_Prereq " +
        "UNION " + 
        "SELECT prereq_code " +
        "FROM Rec_Prereq) " + 
        "MINUS " + 
        "SELECT course_code " + 
        "FROM Takes " + 
        "WHERE person_id = ? "; 
} // end class RequiredQueries