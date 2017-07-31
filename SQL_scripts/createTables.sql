--------------------------------------------------------------------------------
-- Creates all tables for 5125 Project, a program that facilitates job 
-- searching, candidate hunting, and education information for both
-- employers and job seekers. 
--------------------------------------------------------------------------------
-- Franklin D. Worrell ---------------------------------------------------------
-- 29 April 2017 ---------------------------------------------------------------
--------------------------------------------------------------------------------

CREATE TABLE Business_Sector (
	NAICS_code			CHAR(6)			PRIMARY KEY,
	NAICS_description	VARCHAR(150)); 
	
CREATE TABLE Parent_Sector (
	child_NAICS			CHAR(6)			PRIMARY KEY,
	parent_NAICS		CHAR(6),
	FOREIGN KEY (child_NAICS) REFERENCES Business_Sector(NAICS_code),
	FOREIGN KEY (parent_NAICS) REFERENCES Business_Sector(NAICS_code)); 

CREATE TABLE Company (
	company_id			CHAR(9)			PRIMARY KEY,
	company_name		VARCHAR(100),
	c_street_no			VARCHAR(5),
	c_street_name		VARCHAR(60),
	c_unit_no			VARCHAR(5),
	c_city				VARCHAR(30),
	c_state				CHAR(2),
	c_zip				CHAR(5),
	company_website		VARCHAR(2000),
	primary_sector		CHAR(6),
	FOREIGN KEY (primary_sector) REFERENCES Business_Sector(NAICS_code)); 
	
CREATE TABLE Specializes (
	company_id			CHAR(9),  
	NAICS_code			CHAR(6), 
	PRIMARY KEY (company_id, NAICS_code), 
	FOREIGN KEY (company_id) REFERENCES Company(company_id), 
	FOREIGN KEY (NAICS_code) REFERENCES Business_Sector(NAICS_code)); 
	
CREATE TABLE Job_Category (
	SOC_code			CHAR(6)			PRIMARY KEY,
	SOC_description		VARCHAR(100)); 
	
CREATE TABLE Parent_Category (
	child_SOC			CHAR(6)			PRIMARY KEY,
	parent_SOC			CHAR(6),
	FOREIGN KEY (child_SOC) REFERENCES Job_Category(SOC_code),
	FOREIGN KEY (parent_SOC) REFERENCES Job_Category(SOC_code)); 
	
CREATE TABLE Skill_Tier (
	tier_number			NUMERIC(1, 0)	PRIMARY KEY, 
	tier_description	VARCHAR(150)); 

CREATE TABLE Skill_Cluster (
	cluster_code		CHAR(2)			PRIMARY KEY, 
	NWCET_standard		VARCHAR(45),
	NWCET_description	VARCHAR(3000)); 
	
CREATE TABLE Standard_Skill (
	stks_code			CHAR(3)			PRIMARY KEY, 
	tier_number			NUMERIC(1, 0), 
	stks_description	VARCHAR(150),
	FOREIGN KEY (tier_number) REFERENCES Skill_Tier(tier_number)); 
	
CREATE TABLE Groups_Skill (
	stks_code			CHAR(3), 
	cluster_code		CHAR(2),
	PRIMARY KEY (stks_code, cluster_code), 
	FOREIGN KEY (stks_code) REFERENCES Standard_Skill(stks_code),
	FOREIGN KEY (cluster_code) REFERENCES Skill_Cluster(cluster_code)); 

CREATE TABLE Core_Job_Skills (
	SOC_code			CHAR(6),
	stks_code			CHAR(3),
	PRIMARY KEY (SOC_code, stks_code),
	FOREIGN KEY (SOC_code) REFERENCES Job_Category(SOC_code),
	FOREIGN KEY (stks_code) REFERENCES Standard_Skill(stks_code)); 
	
CREATE TABLE Job (
	job_code			CHAR(5)			PRIMARY KEY,
	company_id			CHAR(9),
	emp_mode			CHAR(9), 
	pay_type			VARCHAR(6), 
	job_title			VARCHAR(150),
	job_description		VARCHAR(3000),
	FOREIGN KEY (company_id) REFERENCES company(company_id)); 

CREATE TABLE Categorizes_Job (
	job_code			CHAR(5), 
	SOC_code			CHAR(6), 
	PRIMARY KEY (job_code, SOC_code), 
	FOREIGN KEY (job_code) REFERENCES job(job_code),
	FOREIGN KEY	(SOC_code) REFERENCES job_category(SOC_code)); 

CREATE TABLE Knowledge_Skill (
	ks_code				CHAR(3)			PRIMARY KEY, 
	ks_title			VARCHAR(140),
	stks_code			CHAR(3), 
	FOREIGN KEY (stks_code) REFERENCES Standard_Skill(stks_code)); 
	
CREATE TABLE Requires_Skill (
	job_code			CHAR(5), 
	ks_code				CHAR(3),
	PRIMARY KEY (job_code, ks_code),
	FOREIGN KEY (job_code) REFERENCES Job(job_code),
	FOREIGN KEY (ks_code) REFERENCES Knowledge_Skill(ks_code)); 
	
CREATE TABLE Prefers_Skill (
	job_code			CHAR(5), 
	ks_code				CHAR(3),
	PRIMARY KEY (job_code, ks_code),
	FOREIGN KEY (job_code) REFERENCES Job(job_code),
	FOREIGN KEY (ks_code) REFERENCES Knowledge_Skill(ks_code)); 
	
CREATE TABLE Person (
	person_id		CHAR(9)				PRIMARY KEY,
	first_name		VARCHAR(20),
	middle_name		VARCHAR(20),
	last_name		VARCHAR(20),
	p_street_no		VARCHAR(5),
	p_street_name	VARCHAR(60),
	p_unit_no		VARCHAR(5),
	p_city			VARCHAR(30),
	p_state			CHAR(2),
	p_zip			CHAR(5),
	email			VARCHAR(320),
	gender			CHAR(1)); 
	
CREATE TABLE Has_Skill (
	person_id		CHAR(9), 
	ks_code			CHAR(3), 
	PRIMARY KEY (person_id, ks_code), 
	FOREIGN KEY (person_id) REFERENCES Person(person_id),
	FOREIGN KEY (ks_code) REFERENCES Knowledge_Skill(ks_code)); 

CREATE TABLE Phone_Number (
	person_id			CHAR(9), 
	phone_no			NUMERIC(10, 0),
	phone_no_type		VARCHAR(4),
	PRIMARY KEY (person_id, phone_no),
	FOREIGN KEY (person_id) REFERENCES Person(person_id)); 

CREATE TABLE Works (
	person_id			CHAR(9),
	job_code			CHAR(5), 
	start_date			DATE, 
	end_date			DATE, 
	pay_rate			NUMERIC(8, 2), 
	PRIMARY KEY (person_id, job_code, start_date), 
	FOREIGN KEY (person_id) REFERENCES Person(person_id), 
	FOREIGN KEY (job_code) REFERENCES Job(job_code)); 
	
CREATE TABLE Course (
	course_code			CHAR(4)			PRIMARY KEY,
	course_title		VARCHAR(100), 
	course_level		CHAR(1), 
	course_description	VARCHAR(1000), 
	status				VARCHAR(7), 
	retail_price		NUMERIC(7, 2)); 
	
CREATE TABLE Teaches_Skill (
	course_code		CHAR(4),
	ks_code			CHAR(3),
	PRIMARY KEY (course_code, ks_code),
	FOREIGN KEY (course_code) REFERENCES Course(course_code),
	FOREIGN KEY (ks_code) REFERENCES Knowledge_Skill(ks_code)); 

CREATE TABLE Prerequisite (
	course_code		CHAR(4),
	prereq_code		CHAR(4), 
	PRIMARY KEY (course_code, prereq_code), 
	FOREIGN KEY (course_code) REFERENCES Course(course_code),
	FOREIGN KEY (prereq_code) REFERENCES Course(course_code)); 

CREATE TABLE Educator (
	institution_id		CHAR(9) 		PRIMARY KEY, 
	educator_name		VARCHAR(150),
	educator_website	VARCHAR(2000)); 

CREATE TABLE Course_Section (
	course_code			CHAR(4),
	section_no			CHAR(4), 
	section_year		CHAR(4), 
	completion_date		DATE, 
	offered_by			CHAR(9), 
	section_format		VARCHAR(16), 
	section_price		NUMERIC(7, 2),
	PRIMARY KEY (course_code, section_no, section_year), 
	FOREIGN KEY (course_code) REFERENCES Course(course_code), 
	FOREIGN KEY (offered_by) REFERENCES Educator(institution_id)); 
	
CREATE TABLE Takes (
	person_id			CHAR(9), 
	course_code			CHAR(4),
	section_no			CHAR(4),
	section_year		CHAR(4), 
	grade				CHAR(1), 
	PRIMARY KEY (person_id, course_code, section_no, section_year), 
	FOREIGN KEY (person_id) REFERENCES Person(person_id),
	FOREIGN KEY (course_code, section_no, section_year) 
    REFERENCES Course_Section(course_code, section_no, section_year)); 

CREATE TABLE Certificate (
	certificate_code		CHAR(6)		PRIMARY KEY, 
	certificate_name		VARCHAR(150),
	issued_by				CHAR(9), 
	certificate_description	VARCHAR(750),
	FOREIGN KEY (issued_by) REFERENCES Educator(institution_id)); 
	
CREATE TABLE Requires_Course (
	certificate_code		CHAR(6),
	course_code				CHAR(4),
	PRIMARY KEY (certificate_code, course_code), 
	FOREIGN KEY (certificate_code) REFERENCES Certificate(certificate_code),
	FOREIGN KEY (course_code) REFERENCES Course(course_code)); 
	
CREATE TABLE Tool (
	tool_code		CHAR(4)				PRIMARY KEY,
	tool_name		VARCHAR(75)); 

CREATE TABLE Binds_Tool (
	certificate_code	CHAR(6), 
	tool_code			CHAR(4),
	PRIMARY KEY (certificate_code, tool_code),
	FOREIGN KEY (certificate_code) REFERENCES Certificate(certificate_code),
	FOREIGN KEY (tool_code) REFERENCES Tool(tool_code)); 
	
CREATE TABLE Has_Certificate (
	person_id			CHAR(9),
	certificate_code	CHAR(6), 
	expiration_date		DATE,
	PRIMARY KEY (person_id, certificate_code), 
	FOREIGN KEY (person_id) REFERENCES Person(person_id),
	FOREIGN KEY (certificate_code) REFERENCES Certificate(certificate_code)); 
	
CREATE TABLE Requires_Certificate (
	job_code			CHAR(5), 
	certificate_code	CHAR(6),
	PRIMARY KEY (job_code, certificate_code),
	FOREIGN KEY (job_code) REFERENCES Job(job_code),
	FOREIGN KEY (certificate_code) REFERENCES Certificate(certificate_code)); 
	
CREATE TABLE Prefers_Certificate (
	job_code			CHAR(5), 
	certificate_code	CHAR(6),
	PRIMARY KEY (job_code, certificate_code),
	FOREIGN KEY (job_code) REFERENCES Job(job_code),
	FOREIGN KEY (certificate_code) REFERENCES Certificate(certificate_code));
	