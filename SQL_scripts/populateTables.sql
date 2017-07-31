--------------------------------------------------------------------------------
-- Populates all tables for 5125 Project, a program that facilitates job 
-- searching, candidate hunting, and education information for both
-- employers and job seekers. This data is used to facilitate all assigned
-- queries and all aspects of the three applications. 
--------------------------------------------------------------------------------
-- Franklin D. Worrell ---------------------------------------------------------
-- 1 May 2017 ---------------------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Companies and their sectors -------------------------------------------------
--------------------------------------------------------------------------------
INSERT INTO Business_Sector (NAICS_code, NAICS_description) VALUES 
	('510000', 'Information');
INSERT INTO Business_Sector (NAICS_code, NAICS_description) VALUES 
  ('511000', 'Publishing Industries (except Internet)'); 
INSERT INTO Business_Sector (NAICS_code, NAICS_description) VALUES 
  ('511200', 'Software Publishers');
INSERT INTO Business_Sector (NAICS_code, NAICS_description) VALUES 
  ('511210', 'Software Publishers');
INSERT INTO Business_Sector (NAICS_code, NAICS_description) VALUES 
  ('518000', 'Data Processing, Hosting, and Related Services');
INSERT INTO Business_Sector (NAICS_code, NAICS_description) VALUES 
  ('518200', 'Data Processing, Hosting, and Related Services');
INSERT INTO Business_Sector (NAICS_code, NAICS_description) VALUES 
  ('518210', 'Data Processing, Hosting, and Related Services'); 
INSERT INTO Business_Sector (NAICS_code, NAICS_description) VALUES 
  ('540000', 'Professional, Scientific, and Technical Services'); 
INSERT INTO Business_Sector (NAICS_code, NAICS_description) VALUES 
  ('541000', 'Professional, Scientific, and Technical Services');
INSERT INTO Business_Sector (NAICS_code, NAICS_description) VALUES  
  ('541500', 'Computer Systems Design and Related Services');
INSERT INTO Business_Sector (NAICS_code, NAICS_description) VALUES 
  ('541510', 'Computer Systems Design and Related Services'); 
INSERT INTO Business_Sector (NAICS_code, NAICS_description) VALUES 
  ('541511', 'Custom Computer Programming Services'); 
INSERT INTO Business_Sector (NAICS_code, NAICS_description) VALUES 
  ('541512', 'Computer Systems Design Services'); 
INSERT INTO Business_Sector (NAICS_code, NAICS_description) VALUES 
  ('541513', 'Computer Facilities Management Services'); 
INSERT INTO Business_Sector (NAICS_code, NAICS_description) VALUES 
  ('541519', 'Other Computer Related Services'); 
INSERT INTO Business_Sector (NAICS_code, NAICS_description) VALUES 
  ('541700', 'Scientific Research and Development Services'); 
INSERT INTO Business_Sector (NAICS_code, NAICS_description) VALUES 
  ('541710', 'Research and Development in the Physical, Engineering, and Life Sciences'); 
INSERT INTO Business_Sector (NAICS_code, NAICS_description) VALUES 
  ('541715', 'Research and Development in the Physical, Engineering, and Life Sciences (except Nanotechnology and Biotechnology)'); 
INSERT INTO Business_Sector (NAICS_code, NAICS_description) VALUES 
  ('610000', 'Educational Services'); 
INSERT INTO Business_Sector (NAICS_code, NAICS_description) VALUES 
  ('611000', 'Educational Services'); 
INSERT INTO Business_Sector (NAICS_code, NAICS_description) VALUES 
  ('611100', 'Elementary and Secondary Schools'); 
INSERT INTO Business_Sector (NAICS_code, NAICS_description) VALUES 
  ('611110', 'Elementary and Secondary Schools'); 
INSERT INTO Business_Sector (NAICS_code, NAICS_description) VALUES 
  ('611300', 'Colleges, Universities, and Professional Schools'); 
INSERT INTO Business_Sector (NAICS_code, NAICS_description) VALUES 
  ('611310', 'Colleges, Universities, and Professional Schools'); 
INSERT INTO Business_Sector (NAICS_code, NAICS_description) VALUES 
  ('611400', 'Business Schools and Computer and Management Training'); 
INSERT INTO Business_Sector (NAICS_code, NAICS_description) VALUES 
  ('611420', 'Computer Training'); 
	
INSERT INTO Parent_Sector (child_NAICS, parent_NAICS) VALUES ('511000', '510000');
INSERT INTO Parent_Sector (child_NAICS, parent_NAICS) VALUES ('511200', '511000');
INSERT INTO Parent_Sector (child_NAICS, parent_NAICS) VALUES ('511210', '511200');
INSERT INTO Parent_Sector (child_NAICS, parent_NAICS) VALUES ('518000', '510000');
INSERT INTO Parent_Sector (child_NAICS, parent_NAICS) VALUES ('518200', '518000');
INSERT INTO Parent_Sector (child_NAICS, parent_NAICS) VALUES ('518210', '518200');
INSERT INTO Parent_Sector (child_NAICS, parent_NAICS) VALUES ('541000', '540000');
INSERT INTO Parent_Sector (child_NAICS, parent_NAICS) VALUES ('541500', '541000');
INSERT INTO Parent_Sector (child_NAICS, parent_NAICS) VALUES ('541510', '541500');
INSERT INTO Parent_Sector (child_NAICS, parent_NAICS) VALUES ('541511', '541510'); 
INSERT INTO Parent_Sector (child_NAICS, parent_NAICS) VALUES ('541512', '541510');
INSERT INTO Parent_Sector (child_NAICS, parent_NAICS) VALUES ('541513', '541510'); 
INSERT INTO Parent_Sector (child_NAICS, parent_NAICS) VALUES ('541519', '541510'); 
INSERT INTO Parent_Sector (child_NAICS, parent_NAICS) VALUES ('541700', '541000'); 
INSERT INTO Parent_Sector (child_NAICS, parent_NAICS) VALUES ('541710', '541700');
INSERT INTO Parent_Sector (child_NAICS, parent_NAICS) VALUES ('541715', '541710'); 
INSERT INTO Parent_Sector (child_NAICS, parent_NAICS) VALUES ('611000', '610000');
INSERT INTO Parent_Sector (child_NAICS, parent_NAICS) VALUES ('611100', '611000'); 
INSERT INTO Parent_Sector (child_NAICS, parent_NAICS) VALUES ('611110', '611100'); 
INSERT INTO Parent_Sector (child_NAICS, parent_NAICS) VALUES ('611300', '611000'); 
INSERT INTO Parent_Sector (child_NAICS, parent_NAICS) VALUES ('611310', '611300'); 
INSERT INTO Parent_Sector (child_NAICS, parent_NAICS) VALUES ('611400', '611000'); 
INSERT INTO Parent_Sector (child_NAICS, parent_NAICS) VALUES ('611420', '611400');

INSERT INTO Company(company_id, company_name, c_street_no, c_street_name, c_unit_no, c_city, c_state, c_zip, company_website, primary_sector) VALUES 
	('111111111', '24/7 In Touch', '8383', 'N. Reason Blvd.', 'N/A', 'Metairie', 'LA', '70002', 'yttp://www.247intouch.com/', '541512'); 
INSERT INTO Company(company_id, company_name, c_street_no, c_street_name, c_unit_no, c_city, c_state, c_zip, company_website, primary_sector) VALUES 
	('222111111', 'Elementary Academic Academy', '111', 'East St', 'N/A', 'River Ridge', 'LA', '70101', 'yttp://www.wearetotallynotafakeschool.edu', '611110'); 
INSERT INTO Company(company_id, company_name, c_street_no, c_street_name, c_unit_no, c_city, c_state, c_zip, company_website, primary_sector) VALUES 
	('333111111', 'Electronic Technologists', '2211', 'Rodham Rd', '3', 'New Orleans', 'LA', '70120', 'yttp://wemakewebsites.not', '541511'); 
INSERT INTO Company(company_id, company_name, c_street_no, c_street_name, c_unit_no, c_city, c_state, c_zip, company_website, primary_sector) VALUES 
	('444111111', 'Electrical Engineering Enthusiasts', '115', 'S. Derbigny St.', '6B', 'New Orleans', 'LA', '70180', 'yttp://eeenthusiasm.fake', '541513'); 
INSERT INTO Company(company_id, company_name, c_street_no, c_street_name, c_unit_no, c_city, c_state, c_zip, company_website, primary_sector) VALUES 
	('555111111', q'[How 'Bout Them Internets?]', '6061', 'Uptown Lane', 'N/A', 'New Orleans', 'LA', '70111', 'yttp://vvv.wemaketheweb.org', '541511');  
INSERT INTO Company(company_id, company_name, c_street_no, c_street_name, c_unit_no, c_city, c_state, c_zip, company_website, primary_sector) VALUES 
	('666111111', 'Based In Data', '362', 'Oracular Circle', 'N/A', 'Kenner', 'LA', '70139', 'yttp://vvv.allyourdatabasearebelongtous.org', '518210');  
INSERT INTO Company(company_id, company_name, c_street_no, c_street_name, c_unit_no, c_city, c_state, c_zip, company_website, primary_sector) VALUES 
	('999001111', 'Louisiana State University', '195', 'E. State St.', 'N/A', 'Baton Rouge', 'LA', '70803', 'www.lsu.edu', '611310');  
INSERT INTO Company(company_id, company_name, c_street_no, c_street_name, c_unit_no, c_city, c_state, c_zip, company_website, primary_sector) VALUES 
	('999002222', 'University of New Orleans', '2000', 'Lakeshore Dr.', 'N/A', 'New Orleans', 'LA', '70148', 'www.uno.edu', '611310');  

-- The Specializes Table isn't really need to test queries, hence currently not populated. 
--INSERT INTO Specializes (company_id, NAICS_code) VALUES (); 
	

--------------------------------------------------------------------------------
-- Job categories --------------------------------------------------------------
--------------------------------------------------------------------------------
INSERT INTO Job_Category (SOC_code, SOC_description) VALUES 
	('150000', 'Computer and Mathematical Occupations'); 
INSERT INTO Job_Category (SOC_code, SOC_description) VALUES 
	('151100', 'Computer Occupations'); 
INSERT INTO Job_Category (SOC_code, SOC_description) VALUES 
	('151110', 'Computer and Information Research Scientists'); 
INSERT INTO Job_Category (SOC_code, SOC_description) VALUES 
	('151111', 'Computer and Information Research Scientists'); 
INSERT INTO Job_Category (SOC_code, SOC_description) VALUES 
	('151120', 'Computer and Information Analysts'); 
INSERT INTO Job_Category (SOC_code, SOC_description) VALUES 
	('151121', 'Computer Systems Analysts'); 
INSERT INTO Job_Category (SOC_code, SOC_description) VALUES 
	('151122', 'Information Security Analysts'); 
INSERT INTO Job_Category (SOC_code, SOC_description) VALUES 
	('151130', 'Software Developers and Programmers'); 
INSERT INTO Job_Category (SOC_code, SOC_description) VALUES 
	('151131', 'Computer Programmers'); 
INSERT INTO Job_Category (SOC_code, SOC_description) VALUES 
	('151132', 'Software Developers, Applications'); 
INSERT INTO Job_Category (SOC_code, SOC_description) VALUES 
	('151133', 'Software Developers, Systems Software'); 
INSERT INTO Job_Category (SOC_code, SOC_description) VALUES 
	('151134', 'Web Developers'); 
INSERT INTO Job_Category (SOC_code, SOC_description) VALUES 
	('151140', 'Database and Systems Administrators and Network Architects'); 
INSERT INTO Job_Category (SOC_code, SOC_description) VALUES 
	('151141', 'Database Administrators'); 
INSERT INTO Job_Category (SOC_code, SOC_description) VALUES 
	('151142', 'Network and Computer Systems Administrators'); 
INSERT INTO Job_Category (SOC_code, SOC_description) VALUES 
	('151143', 'Computer Network Architects'); 
INSERT INTO Job_Category (SOC_code, SOC_description) VALUES 
	('151150', 'Computer Support Specialists'); 
INSERT INTO Job_Category (SOC_code, SOC_description) VALUES 
	('151151', 'Computer User Support Specialists'); 
INSERT INTO Job_Category (SOC_code, SOC_description) VALUES 
	('151152', 'Computer Network Support Specialists'); 
INSERT INTO Job_Category (SOC_code, SOC_description) VALUES 
	('151190', 'Miscellaneous Computer Occupations'); 
INSERT INTO Job_Category (SOC_code, SOC_description) VALUES 
	('151199', 'Computer Occupations, All Other'); 
INSERT INTO Job_Category (SOC_code, SOC_description) VALUES 
	('250000', 'Education, Training, and Library Occupations'); 
INSERT INTO Job_Category (SOC_code, SOC_description) VALUES 
	('251000', 'Postsecondary Teachers'); 
INSERT INTO Job_Category (SOC_code, SOC_description) VALUES 
	('251020', 'Math and Computer Teachers, Postsecondary'); 
INSERT INTO Job_Category (SOC_code, SOC_description) VALUES 
	('251021', 'Computer Science Teachers, Postsecondary'); 
	
INSERT INTO Parent_Category (child_SOC, parent_SOC) VALUES ('151100', '150000'); 
INSERT INTO Parent_Category (child_SOC, parent_SOC) VALUES ('151110', '151100'); 
INSERT INTO Parent_Category (child_SOC, parent_SOC) VALUES ('151120', '151100'); 
INSERT INTO Parent_Category (child_SOC, parent_SOC) VALUES ('151130', '151100'); 
INSERT INTO Parent_Category (child_SOC, parent_SOC) VALUES ('151140', '151100'); 
INSERT INTO Parent_Category (child_SOC, parent_SOC) VALUES ('151150', '151100'); 
INSERT INTO Parent_Category (child_SOC, parent_SOC) VALUES ('151190', '151100'); 
INSERT INTO Parent_Category (child_SOC, parent_SOC) VALUES ('151111', '151110'); 
INSERT INTO Parent_Category (child_SOC, parent_SOC) VALUES ('151121', '151120'); 
INSERT INTO Parent_Category (child_SOC, parent_SOC) VALUES ('151122', '151120'); 
INSERT INTO Parent_Category (child_SOC, parent_SOC) VALUES ('151131', '151130'); 
INSERT INTO Parent_Category (child_SOC, parent_SOC) VALUES ('151132', '151130'); 
INSERT INTO Parent_Category (child_SOC, parent_SOC) VALUES ('151133', '151130'); 
INSERT INTO Parent_Category (child_SOC, parent_SOC) VALUES ('151134', '151130'); 
INSERT INTO Parent_Category (child_SOC, parent_SOC) VALUES ('151141', '151140'); 
INSERT INTO Parent_Category (child_SOC, parent_SOC) VALUES ('151142', '151140'); 
INSERT INTO Parent_Category (child_SOC, parent_SOC) VALUES ('151143', '151140'); 
INSERT INTO Parent_Category (child_SOC, parent_SOC) VALUES ('151151', '151150'); 
INSERT INTO Parent_Category (child_SOC, parent_SOC) VALUES ('151152', '151150'); 
INSERT INTO Parent_Category (child_SOC, parent_SOC) VALUES ('151199', '151190'); 
INSERT INTO Parent_Category (child_SOC, parent_SOC) VALUES ('251000', '250000'); 
INSERT INTO Parent_Category (child_SOC, parent_SOC) VALUES ('251020', '251000'); 
INSERT INTO Parent_Category (child_SOC, parent_SOC) VALUES ('251021', '251020'); 


--------------------------------------------------------------------------------
-- Educators, tools, and certificates ------------------------------------------
--------------------------------------------------------------------------------
INSERT INTO Educator (institution_id, educator_name, educator_website) VALUES 
	('111111111', 'Microsoft', 'www.microsoft.com/en-us/learning/default.aspx'); 
INSERT INTO Educator (institution_id, educator_name, educator_website) VALUES 
	('111111222', 'Amazon Web Services', 'aws.amazon.com/certification/'); 
INSERT INTO Educator (institution_id, educator_name, educator_website) VALUES 
	('111111333', 'Red Hat', 'www.redhat.com/en/services/certification');
INSERT INTO Educator (institution_id, educator_name, educator_website) VALUES 
	('111111444', 'Oracle', 'education.oracle.com'); 
INSERT INTO Educator (institution_id, educator_name, educator_website) VALUES 
	('111111555', 'University of New Orleans', 'www.uno.edu'); 
INSERT INTO Educator (institution_id, educator_name, educator_website) VALUES 
	('111111666', 'Coursera', 'www.coursera.org'); 
	
INSERT INTO Tool (tool_code, tool_name) VALUES ('0001', 'SQL Server 2012/2014'); 
INSERT INTO Tool (tool_code, tool_name) VALUES ('0002', 'Amazon Web Services');
INSERT INTO Tool (tool_code, tool_name) VALUES ('0003', 'HTML5'); 
INSERT INTO Tool (tool_code, tool_name) VALUES ('0004', 'SQLite'); 
INSERT INTO Tool (tool_code, tool_name) VALUES ('0005', 'CSS3'); 
INSERT INTO Tool (tool_code, tool_name) VALUES ('0006', 'Javascript'); 
INSERT INTO Tool (tool_code, tool_name) VALUES ('0007', 'ASP.NET MVC'); 
INSERT INTO Tool (tool_code, tool_name) VALUES ('0008', 'C#'); 
INSERT INTO Tool (tool_code, tool_name) VALUES ('0009', 'Mobile Apps'); 
INSERT INTO Tool (tool_code, tool_name) VALUES ('0010', 'Visual Studio'); 
INSERT INTO Tool (tool_code, tool_name) VALUES ('0011', '.NET Framework 4.5'); 
INSERT INTO Tool (tool_code, tool_name) VALUES ('0012', 'Java Enterprise Edition');
INSERT INTO Tool (tool_code, tool_name) VALUES ('0013', 'JBoss Enterprise Application Platform'); 
INSERT INTO Tool (tool_code, tool_name) VALUES ('0014', 'Oracle Database 10g'); 
INSERT INTO Tool (tool_code, tool_name) VALUES ('0015', 'Oracle Database 11g'); 
INSERT INTO Tool (tool_code, tool_name) VALUES ('0016', 'Oracle Database 12c'); 
	
INSERT INTO Certificate (certificate_code, certificate_name, issued_by, certificate_description) VALUES 
	('110005', 'Microsoft Certified Solutions Associate: SQL Server 2012/2014', '111111111', q'[This certification demonstrates your skills and breakthrough insights in developing and maintaining the next wave of mission-critical environments.]'); 
INSERT INTO Certificate (certificate_code, certificate_name, issued_by, certificate_description) VALUES 
	('110006', 'Microsoft Certified Solutions Expert: Data Management and Analytics', '111111111', q'[Demonstrate your broad skill sets in SQL administration, building enterprise-scale data solutions, and leveraging business intelligence data both on-premises and in cloud environments.]'); 
INSERT INTO Certificate (certificate_code, certificate_name, issued_by, certificate_description) VALUES 
	('110007', 'AWS Certified Developer - Associate', '111111222', q'[The AWS Certified Developer Associate exam validates technical expertise in developing and maintaining applications on the AWS platform. Exam concepts you should understand for this exam include: Picking the right AWS services for the application; Leveraging AWS SDKs to interact with AWS services from your application; Writing code that optimizes performance of AWS services used by your application; Code-level application security (IAM roles, credentials, encryption, etc.)]'); 
INSERT INTO Certificate (certificate_code, certificate_name, issued_by, certificate_description) VALUES 
	('110008', 'AWS Certified DevOps Engineer - Professional', '111111222', q'[The AWS Certified DevOps Engineer – Professional exam validates technical expertise in provisioning, operating, and managing distributed application systems on the AWS platform. Exam concepts you should understand for this exam include the ability to: Implement and manage continuous delivery systems and methodologies on AWS; Understand, implement, and automate security controls, governance processes, and compliance validation; Define and deploy monitoring, metrics, and logging systems on AWS; Implement systems that are highly available, scalable, and self-healing on the AWS platform; Design, manage, and maintain tools to automate operational processes.]'); 
INSERT INTO Certificate (certificate_code, certificate_name, issued_by, certificate_description) VALUES 
	('110009', 'AWS Certified Solutions Architect - Associate', '111111222', q'[The AWS Certified Solutions Architect – Associate exam is intended for individuals with experience designing distributed applications and systems on the AWS platform. Exam concepts you should understand for this exam include: Designing and deploying scalable, highly available, and fault tolerant systems on AWS; Lift and shift of an existing on-premises application to AWS; Ingress and egress of data to and from AWS; Selecting the appropriate AWS service based on data, compute, database, or security requirements; Identifying appropriate use of AWS architectural best practices; Estimating AWS costs and identifying cost control mechanisms.]'); 
INSERT INTO Certificate (certificate_code, certificate_name, issued_by, certificate_description) VALUES 
	('110010', 'AWS Certified Solutions Architect - Professional', '111111222', q'[The AWS Certified Solutions Architect – Professional exam validates advanced technical skills and experience in designing distributed applications and systems on the AWS platform. Example concepts you should understand for this exam include: Designing and deploying dynamically scalable, highly available, fault tolerant, and reliable applications on AWS; Selecting appropriate AWS services to design and deploy an application based on given requirements; Migrating complex, multi-tier applications on AWS; Designing and deploying enterprise-wide scalable operations on AWS; Implementing cost control strategies.]'); 
INSERT INTO Certificate (certificate_code, certificate_name, issued_by, certificate_description) VALUES 
	('110011', 'AWS Certified SysOps Administrator - Associate', '111111222', q'[The AWS Certified SysOps Administrator – Associate exam validates technical expertise in deployment, management, and operations on the AWS platform. Exam concepts you should understand for this exam include: Deploying, managing, and operating scalable, highly available, and fault tolerant systems on AWS; Migrating an existing on-premises application to AWS; Implementing and controlling the flow of data to and from AWS; Selecting the appropriate AWS service based on compute, data, or security requirements; Identifying appropriate use of AWS operational best practices; Estimating AWS usage costs and identifying operational cost control mechanisms.]'); 
INSERT INTO Certificate (certificate_code, certificate_name, issued_by, certificate_description) VALUES 
	('110012', 'Microsoft Certified Solutions Associate: Universal Windows Platform', '111111111', q'[This certification demonstrates your expertise at implementing Universal Windows Platform apps that offer a compelling user experience across a wide range of Windows devices.]'); 
INSERT INTO Certificate (certificate_code, certificate_name, issued_by, certificate_description) VALUES 
	('110013', 'Microsoft Certified Solutions Associate: Web Applications', '111111111', q'[Demonstrate your expertise at implementing modern web apps.]'); 
INSERT INTO Certificate (certificate_code, certificate_name, issued_by, certificate_description) VALUES 
	('110014', 'Red Hat Certified JBoss Developer', '111111333', q'[The Red Hat Certified JBoss Developer (RHCJD) certification demonstrates an individual\'s ability to build Java Enterprise Edition (JEE) applications for deployment on the Red Hat JBoss Enterprise Application Platform or other JEE-compliant platforms. Employers can hire RHCJDs with confidence that they are qualified JEE developers who have proven their skills.]'); 
INSERT INTO Certificate (certificate_code, certificate_name, issued_by, certificate_description) VALUES 
	('110015', 'Oracle PL/SQL Developer Certified Associate', '111111444', q'[Oracle PL/SQL Developer Certified Associates have demonstrated expertise in building database-centric Internet applications for Oracle Database 10g, 11g and 12c.]'); 
INSERT INTO Certificate (certificate_code, certificate_name, issued_by, certificate_description) VALUES 
	('110016', 'Oracle Database SQL Expert', '111111444', q'[Oracle Database SQL Certified Experts demonstrate the complete set of skills required for working with the powerful SQL programming language and have mastered the key concepts of a relational database. SQL Experts understand how to use the advanced features of SQL in order to query and manipulate data within the database, control privileges at the object and system level, and use advanced querying and reporting techniques. They are able to manipulate large data sets and understand storing and retrieving dates according to different time zones. They are also knowledgeable about the concepts of controlling access and privileges for schema objects.]'); 

INSERT INTO Binds_Tool (certificate_code, tool_code) VALUES ('110005', '0001'); 
INSERT INTO Binds_Tool (certificate_code, tool_code) VALUES ('110006', '0001'); 
INSERT INTO Binds_Tool (certificate_code, tool_code) VALUES ('110007', '0002'); 
INSERT INTO Binds_Tool (certificate_code, tool_code) VALUES ('110008', '0002'); 
INSERT INTO Binds_Tool (certificate_code, tool_code) VALUES ('110009', '0002'); 
INSERT INTO Binds_Tool (certificate_code, tool_code) VALUES ('110010', '0002'); 
INSERT INTO Binds_Tool (certificate_code, tool_code) VALUES ('110011', '0002');
INSERT INTO Binds_Tool (certificate_code, tool_code) VALUES ('110012', '0003'); 
INSERT INTO Binds_Tool (certificate_code, tool_code) VALUES ('110012', '0004'); 
INSERT INTO Binds_Tool (certificate_code, tool_code) VALUES ('110012', '0005'); 
INSERT INTO Binds_Tool (certificate_code, tool_code) VALUES ('110012', '0006'); 
INSERT INTO Binds_Tool (certificate_code, tool_code) VALUES ('110012', '0007'); 
INSERT INTO Binds_Tool (certificate_code, tool_code) VALUES ('110013', '0008'); 
INSERT INTO Binds_Tool (certificate_code, tool_code) VALUES ('110013', '0009'); 
INSERT INTO Binds_Tool (certificate_code, tool_code) VALUES ('110013', '0010'); 
INSERT INTO Binds_Tool (certificate_code, tool_code) VALUES ('110013', '0011'); 
INSERT INTO Binds_Tool (certificate_code, tool_code) VALUES ('110014', '0012'); 
INSERT INTO Binds_Tool (certificate_code, tool_code) VALUES ('110014', '0013'); 
INSERT INTO Binds_Tool (certificate_code, tool_code) VALUES ('110015', '0014'); 
INSERT INTO Binds_Tool (certificate_code, tool_code) VALUES ('110015', '0015'); 
INSERT INTO Binds_Tool (certificate_code, tool_code) VALUES ('110015', '0016'); 
INSERT INTO Binds_Tool (certificate_code, tool_code) VALUES ('110016', '0014'); 
INSERT INTO Binds_Tool (certificate_code, tool_code) VALUES ('110016', '0015'); 
INSERT INTO Binds_Tool (certificate_code, tool_code) VALUES ('110016', '0016'); 


--------------------------------------------------------------------------------
-- Standardizations for skills and association with SOC categories -------------
--------------------------------------------------------------------------------	
INSERT INTO Skill_Tier (tier_number, tier_description) VALUES 
	(1, q'[The set of foundation skills (SCANS), knowledge, abilities, and personal qualities required of all workers to be successful in today's workplace.]'); 
INSERT INTO Skill_Tier (tier_number, tier_description) VALUES 
	(2, q'[Technical skills, knowledge, and abilities. Skills common to all jobs within a career cluster across all industries.]'); 
INSERT INTO Skill_Tier (tier_number, tier_description) VALUES 
	(3, q'[Industry-specific technical skills, knowledge, and abilities unique to individual industries or organizations.]'); 

INSERT INTO Skill_Cluster (cluster_code, NWCET_standard, NWCET_description) VALUES 
	('01', 'Project Management', q'[Basic skills that span other clusters.]');
INSERT INTO Skill_Cluster (cluster_code, NWCET_standard, NWCET_description) VALUES 
	('02', 'Task Management', q'[Basic skills that span other clusters.]'); 
INSERT INTO Skill_Cluster (cluster_code, NWCET_standard, NWCET_description) VALUES 
	('03', 'Problem-Solving / Troubleshooting', q'[Basic skills that span other clusters.]'); 
INSERT INTO Skill_Cluster (cluster_code, NWCET_standard, NWCET_description) VALUES 
	('11', 'Database Development and Administration', q'[As a database administrator, you will first gather data to determine user requirements. You may also gather the information to design reports, forms and application interfaces so users can create data queries and interpret the results. You will participate in the creation of corporate data models, as well as determining the enterprise’s data requirements. You may be involved with prototyping a database system, creating system models and simulating all aspects of the data system. You will take part in the selection of appropriate database design tools. You will be involved with decisions concerning the choice of platforms as well as the evaluation and selection of Database Management Systems (DBMS). You will participate in the conceptual and logical database design phases. You will have a major role in the physical database design phase and the physical implementation of database designs using a selected DBMS. You will oversee and monitor information exchange between database designers and application interface developers. You may be involved with data conversion operations and will load data into new or existing systems. You may determine needed changes either to new systems or existing systems as they grow. You will develop testing strategies and thoroughly test the entire data system before and after it is put into operation. To keep data secure and protected from catastrophic events, you will create security procedures and implement backup and recovery processes. You will be responsible for operational maintenance and fine tuning after a database system is in place and functional. You may be involved with training users at various levels. You will create documentation and other necessary materials. You will also need to keep abreast of hardware and software developments, associated costs and updates that may be available for existing software and hardware. You need to be creative in your approach to problems and willing to help everyone get the data they need while maintaining system security and reliability.]'); 
INSERT INTO Skill_Cluster (cluster_code, NWCET_standard, NWCET_description) VALUES 
	('12', 'Digital Media', q'[Information only has value when someone wants to read it. A riveting presentation is vital to getting your company’s message across whether you’re creating a hot web site, a training video or designing the latest computer game. As a digital media specialist you bring ideas to life through technology. During the initial stages of a project, you estimate the costs and the length of the job and determine what resources will be needed to bring the project to completion on time. You want the best tools to design and format your presentation, but the size of the project and budget sometimes put limits on how far you can go. When designing, you determine the look and feel, select colors and create a visually appealing layout. The tools you use change at an incredible pace, so you’re constantly learning about the latest developments, often through word of mouth, books, magazines, tutorials and classes. You get the latest software as it comes out and teach yourself new skills. “Mindshare,�? the attention customers pay to your company’s name and products, is often determined by the visions you create through your designs. Your visions need to create a compelling image of your company’s products, using multiple media types while adhering to copyright on each piece of media you use.]'); 
INSERT INTO Skill_Cluster (cluster_code, NWCET_standard, NWCET_description) VALUES 
	('13', 'Enterprise Systems Analysis and Integration', q'[As society increasingly depends on information technology for commerce, education, communication and entertainment, the smooth functioning and proper interaction of complex information technology systems become increasingly important. The increase in e-business and digital commerce will put even more emphasis on the interoperability, usability and security of separate systems. Enterprise systems analysts and integration specialists will often oversee the installation of necessary software, programming of databases and configuration of networks to allow efficient and secure transactions among computer systems. Professional opportunities exist for those with technical backgrounds plus business and/or management experience and education to perform high-level design and system integration functions either as a member of the enterprise team or as a consultant.]'); 
INSERT INTO Skill_Cluster (cluster_code, NWCET_standard, NWCET_description) VALUES 
	('14', 'Network Design and Administration', q'[Network designers are responsible for developing a plan that allows a business or organization to use a network to further its goals. This network may be a simple Local Area Network (LAN), or may be a complex, enterprise-grade Wide Area Network (WAN). Responsibilities include conducting a needs analysis and providing detailed reports concerning any proposed design. Network design technicians consult with responsible members of the organization, research the latest equipment and software developments and spend time troubleshooting the design once it is in place. A solid grounding in security concepts is also vital as it is likely network design technicians will be involved in providing network access to remote users. In the area of network administration, network technicians confirm that network hardware and software are operating properly so people in the organization get the information they need when they need it. A network technician is responsible for maintaining individual elements of the organization’s LAN, WAN or Intranet. A network technician thoroughly understands networking technology for LANs and for connecting to larger networks and the Internet. They must learn to quickly identify, document and solve problems. Because technicians work with users all the time, they understand their needs and can recommend improvements based on user input and technology advances. Technicians also spend time measuring network performance. This includes charting network usage and downtime to help plan for the future. Technicians document the network configuration and prepare backup plans and procedures. They are responsible for adding users and ensuring that they have access to the files and network-connected equipment they need to do their job, while maintaining security and confidentiality of other files and data. Finally, technicians install upgrades with a minimum of disruption.]'); 
INSERT INTO Skill_Cluster (cluster_code, NWCET_standard, NWCET_description) VALUES 
	('15', 'Programming / Software Engineering', q'[Computer programmers design, create and maintain software. You may analyze, design, develop, test and maintain computer and Internet-based applications. Possibly you’ll write specialized applications or make custom programs to satisfy a user’s particular needs. You’ll probably write software programs that interface with commercial offthe-shelf software or application systems that the organization has installed. You may be required to know more than one programming language and possibly more than one operating system. Not all programmers write code all day. You may evaluate the project requirements, participate in design meetings or determine the best solution to a problem or approach to a new feature. You may develop and refine detailed design specifications. You will use development tools and programming languages in creating and testing the software. You must also be proficient at documenting your work so others will know what you did and how. Finally, you must test your work with real users to make sure it is free of errors and meets user specifications. You will likely be required to analyze and fix software problems and errors on programs that were written by other programmers who may not be available at the time the correction is required.]'); 
INSERT INTO Skill_Cluster (cluster_code, NWCET_standard, NWCET_description) VALUES 
	('16', 'Technical Support', q'[As a technical support representative, you are a vital part of the contact between customers and your company. Educating users is part of your job, as well as solving hardware or software operation and application problems. Experience with the problems users face in daily operation is a valuable asset. When a problem occurs, you listen carefully, ask the appropriate questions to gather needed information and then take steps to solve it. Dealing directly with customer issues, you are one of the best sources of information on the product, and are consulted for information about what customers want and what gives them the most trouble. You may start out at the call center or help desk, walking users through the steps required to solve a problem over the telephone. As your experience and training increase, you may work with hardware and software installation, configuration and upgrading processes.]'); 
INSERT INTO Skill_Cluster (cluster_code, NWCET_standard, NWCET_description) VALUES 
	('17', 'Technical Writing', q'[As a technical writer, you make technical information accessible and easy to understand. Technical manuals, detailed specifications, online help, web content and training materials are just a few examples of the types of documents you create. You define the audience and purpose of your document; determine the technical level, tone and organization; and choose your document’s delivery method (print and/or electronic). You are accurate. You thoroughly research your subject by interviewing experts and users. You also test the product you’re writing about. You use page layout, word processing programs and online publishing tools to create your documents and design graphics. Your creativity, time management and communication skills and ability to understand and simplify complex material are valuable assets to your readers and to your future.]'); 
INSERT INTO Skill_Cluster (cluster_code, NWCET_standard, NWCET_description) VALUES 
	('18', 'Web Development and Administration', q'[You will play a vital role in your company's presence on the world wide web. You may use web page development software to create or change web pages, inserting text content, graphics and interactive modules that are often supplied by others in your organization. Before you start, you will probably talk to the many stakeholders in your company who depend on the organization’s web presence. You’ll also look at successful models and research software tools to help design the look, feel and navigation. In some organizations you may be responsible for making sure the web pages and updates get installed, and work with the servers associated with the web pages. As you gain experience, your web development activities may include working with legacy systems and understanding database technology, programming processes and application architecture.]'); 

INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('901', 1, q'[Critical thinking]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('902', 1, q'[Ability to work in a team]');
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('903', 1, q'[Ability to work with clients]');
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('904', 1, q'[Verbal communication]');
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('905', 1, q'[Written communication]');
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('906', 1, q'[Design skills]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('907', 1, q'[Self-motivation]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('908', 1, q'[Commitment to continued learning]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('909', 1, q'[Leadership ability]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('910', 2, q'[Teaching skills]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('001', 2, q'[.NET Programming]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('002', 2, q'[Ab Initio]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('003', 2, q'[Accounting Software]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('004', 2, q'[Activex Data Object (ADO)]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('005', 2, q'[Adobe Acrobat]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('006', 2, q'[Adobe ColdFusion]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('007', 2, q'[Adobe Creative Suite]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('008', 2, q'[Adobe Dreamweaver]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('009', 2, q'[Adobe Flex]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('010', 2, q'[Adobe Illustrator]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('011', 2, q'[Adobe Indesign]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('012', 2, q'[Adobe Photoshop]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('013', 2, q'[ADP Payroll]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('014', 2, q'[AJAX]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('015', 2, q'[Amazon Web Services (AWS)]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('016', 2, q'[Android]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('017', 2, q'[Android Software Development Kit (SDK)]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('018', 2, q'[AngularJS]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('019', 2, q'[AngularJS]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('020', 2, q'[Apache CXF]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('021', 2, q'[Apache Hadoop]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('022', 2, q'[Apache Hive]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('023', 2, q'[Apache Subversion (SVN)]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('024', 2, q'[Apache Webserver]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('025', 2, q'[ArcGIS]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('026', 2, q'[AS/400]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('027', 2, q'[ASP]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('028', 2, q'[Atlassian JIRA]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('029', 2, q'[AutoCAD]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('030', 2, q'[Autodesk]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('031', 2, q'[Backbone.js]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('032', 2, q'[Bash]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('033', 2, q'[Bugzilla]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('034', 2, q'[BusinessObjects]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('035', 2, q'[C++]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('036', 2, q'[Cacti]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('037', 2, q'[CADD]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('038', 2, q'[Cassandra]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('039', 2, q'[Chef]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('040', 2, q'[Cisco Routers]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('041', 2, q'[Citrix]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('042', 2, q'[Civil 3D]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('043', 2, q'[COBOL]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('044', 2, q'[Cognos Impromptu]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('045', 2, q'[Computer Aided Drafting/Design (CAD)]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('046', 2, q'[Crystal Reports]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('047', 2, q'[CSS]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('048', 2, q'[Customer Information Control System (CICS)]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('049', 2, q'[Customer Relationship Management (CRM)]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('050', 2, q'[Data Visualization]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('051', 2, q'[Database Software]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('052', 2, q'[Datastage]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('053', 2, q'[Delphi]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('054', 2, q'[Design Software]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('055', 2, q'[Django]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('056', 2, q'[Dojo Toolkit]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('057', 2, q'[Drupal]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('058', 2, q'[Dynamic HTML]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('059', 2, q'[Eclipse]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('060', 2, q'[Electronic Data Interchange]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('061', 2, q'[Enterprise JAVA Beans]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('062', 2, q'[Enterprise Resource Planning (ERP)]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('063', 2, q'[Epic Systems]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('064', 2, q'[ERwin]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('065', 2, q'[Ext JS]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('066', 2, q'[Extensible Markup Language (XML)]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('067', 2, q'[Extensible Stylesheet Language XSL]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('068', 2, q'[Facebook]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('069', 2, q'[FileMaker Pro]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('070', 2, q'[Fortran]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('071', 2, q'[FoxPro]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('072', 2, q'[Geographic Information System (GIS)]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('073', 2, q'[Geopak]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('074', 2, q'[Git]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('075', 2, q'[Google AdWords]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('076', 2, q'[Google Analytics]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('077', 2, q'[Google Web Toolkit]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('078', 2, q'[Graphical User Interface (GUI)]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('079', 2, q'[Great Plains Accounting Software]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('080', 2, q'[Greenplum]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('081', 2, q'[Groupwise]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('082', 2, q'[HAZOP]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('083', 2, q'[HCPCS Coding]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('084', 2, q'[Heroku]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('085', 2, q'[Hibernate]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('086', 2, q'[HP-UX]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('087', 2, q'[HRMS]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('088', 2, q'[HTML5]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('089', 2, q'[Hyperion]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('090', 2, q'[HyperText Markup Language]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('091', 2, q'[Hypertext Preprocessor (PHP)]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('092', 2, q'[Hyper-V]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('093', 2, q'[IBM WEBSPHERE]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('094', 2, q'[ICD-10]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('095', 2, q'[ICD-9-CM Coding]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('096', 2, q'[Informatica]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('097', 2, q'[Inroads]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('098', 2, q'[Integrated Development Environment (IDE)]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('099', 2, q'[iPhone Software Development Kit (SDK)]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('100', 2, q'[ISO 9000]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('101', 2, q'[J2EE]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('102', 2, q'[JAVA]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('103', 2, q'[Java Applets]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('104', 2, q'[Java Message Service (JMS)]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('105', 2, q'[Java Naming and Directory Interface (JNDI)]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('106', 2, q'[Java Server Pages (JSP)]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('107', 2, q'[Java Servlets]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('108', 2, q'[JavaBeans]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('109', 2, q'[JavaScript]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('110', 2, q'[JavaServer Faces]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('111', 2, q'[JBoss]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('112', 2, q'[JD Edwards]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('113', 2, q'[JDBC]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('114', 2, q'[Jenkins]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('115', 2, q'[Job Control Language (JCL)]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('116', 2, q'[jQuery]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('117', 2, q'[JRUN]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('118', 2, q'[JSON]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('119', 2, q'[JUnit]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('120', 2, q'[Korn Shell (KSH)]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('121', 2, q'[LexisNexis]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('122', 2, q'[LinkedIn]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('123', 2, q'[LINUX]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('124', 2, q'[Load Runner]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('125', 2, q'[Log4J]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('126', 2, q'[Lotus Applications]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('127', 2, q'[Lotus Domino]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('128', 2, q'[Lotus Notes]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('129', 2, q'[MacIntosh OS]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('130', 2, q'[Macromedia Fireworks]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('131', 2, q'[Macros]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('132', 2, q'[MapReduce]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('133', 2, q'[MAS 200]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('134', 2, q'[MAS 90]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('135', 2, q'[MATLAB]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('136', 2, q'[Maven]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('137', 2, q'[McAfee]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('138', 2, q'[Meditech]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('139', 2, q'[Microsoft Access]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('140', 2, q'[Microsoft C]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('141', 2, q'[Microsoft C#]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('142', 2, q'[Microsoft CRM]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('143', 2, q'[Microsoft Dynamics]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('144', 2, q'[Microsoft Excel]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('145', 2, q'[Microsoft Exchange]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('146', 2, q'[Microsoft Office]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('147', 2, q'[Microsoft Operating Systems]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('148', 2, q'[Microsoft Outlook]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('149', 2, q'[Microsoft Powerpoint]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('150', 2, q'[Microsoft PowerShell]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('151', 2, q'[Microsoft Project]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('152', 2, q'[Microsoft Publisher]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('153', 2, q'[Microsoft Sharepoint]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('154', 2, q'[Microsoft SQL]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('155', 2, q'[Microsoft Sql Server Integration Services (SSIS)]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('156', 2, q'[Microsoft Visio]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('157', 2, q'[Microsoft Vista]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('158', 2, q'[Microsoft Windows]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('159', 2, q'[Microsoft Word]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('160', 2, q'[Microstation]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('161', 2, q'[Microstrategy]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('162', 2, q'[Middleware]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('163', 2, q'[Minitab]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('164', 2, q'[Mobile Application Design]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('165', 2, q'[Model-View-Controller (MVC)]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('166', 2, q'[MongoDB]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('167', 2, q'[MQSeries]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('168', 2, q'[MySQL]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('169', 2, q'[Nagios]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('170', 2, q'[Netcool]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('171', 2, q'[Node.js]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('172', 2, q'[NoSQL]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('173', 2, q'[Novell NetWare]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('174', 2, q'[Objective C]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('175', 2, q'[Object-Oriented Programming]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('176', 2, q'[Open Database Connectivity (ODBC)]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('177', 2, q'[Oracle]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('178', 2, q'[Oracle Business Intelligence Enterprise Edition (OBIEE)]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('179', 2, q'[Oracle PL/SQL]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('180', 2, q'[Palm OS]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('181', 2, q'[Peoplesoft]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('182', 2, q'[PeopleSoft Financials]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('183', 2, q'[PeopleSoft HRMS]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('184', 2, q'[Peopletools]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('185', 2, q'[Perforce]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('186', 2, q'[PERL]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('187', 2, q'[PIG]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('188', 2, q'[Platform as a Service (PaaS)]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('189', 2, q'[PostgreSQL]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('190', 2, q'[Primavera]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('191', 2, q'[Pro*C]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('192', 2, q'[Puppet]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('193', 2, q'[Python]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('194', 2, q'[Qlikview]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('195', 2, q'[Quick Test Professional (QTP)]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('196', 2, q'[Quickbooks]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('197', 2, q'[R]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('198', 2, q'[Raiser's Edge]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('199', 2, q'[Rational Rose]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('200', 2, q'[Red Hat Linux]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('201', 2, q'[Relational DataBase Management System (RDBMS)]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('202', 2, q'[Revit]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('203', 2, q'[RIAK]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('204', 2, q'[Ruby]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('205', 2, q'[Ruby on Rails]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('206', 2, q'[Salesforce]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('207', 2, q'[SAP]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('208', 2, q'[Sap Basis]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('209', 2, q'[SAP HR]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('210', 2, q'[SAP Netweaver]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('211', 2, q'[SAS]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('212', 2, q'[Selenium]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('213', 2, q'[Service-Oriented Architecture (SOA)]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('214', 2, q'[Sharepoint Portal Server]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('215', 2, q'[Shell Scripting]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('216', 2, q'[SOAP]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('217', 2, q'[Social Media Platforms]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('218', 2, q'[Software as a Service (SaaS)]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('219', 2, q'[Solaris]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('220', 2, q'[SOLR]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('221', 2, q'[Splunk]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('222', 2, q'[Spring Framework]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('223', 2, q'[SPSS]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('224', 2, q'[SQL]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('225', 2, q'[SQL Server]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('226', 2, q'[SQL Server Analysis Services (SSAS)]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('227', 2, q'[SQL Server Reporting Services (SSRS)]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('228', 2, q'[SQL*Loader]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('229', 2, q'[SQLite]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('230', 2, q'[Sqoop]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('231', 2, q'[STATA]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('232', 2, q'[Structured Query Reporter (SQR)]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('233', 2, q'[Struts]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('234', 2, q'[Subversion]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('235', 2, q'[Swift]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('236', 2, q'[Sybase]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('237', 2, q'[Symantec Packages]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('238', 2, q'[Tableau]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('239', 2, q'[Teradata]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('240', 2, q'[Tivoli]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('241', 2, q'[Tomcat]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('242', 2, q'[Transact-SQL]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('243', 2, q'[Ubuntu]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('244', 2, q'[Unified Modeling Language (UML)]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('245', 2, q'[UNIX]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('246', 2, q'[UNIX Shell]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('247', 2, q'[Usability Testing]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('248', 2, q'[User Interface (UI) Design]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('249', 2, q'[VBScript]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('250', 2, q'[Veritas NetBackup]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('251', 2, q'[Virtual Private Networking (VPN)]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('252', 2, q'[Visual Basic]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('253', 2, q'[Visual Basic for Applications (VBA)]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('254', 2, q'[Visual Design]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('255', 2, q'[Visual Studio]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('256', 2, q'[VMware]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('257', 2, q'[VMware ESXi]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('258', 2, q'[Voice over IP (VoIP)]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('259', 2, q'[web authoring tools]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('260', 2, q'[WebLogic]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('261', 2, q'[Windows NT]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('262', 2, q'[Windows Server]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('263', 2, q'[Wireshark]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('264', 2, q'[Wonderware]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('265', 2, q'[Word Processing]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('266', 2, q'[WordPerfect]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('267', 2, q'[WordPress]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('268', 2, q'[XHTML]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('269', 2, q'[Yardi Software]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('270', 2, q'[Youtube]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('271', 2, q'[Penetration Testing]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('272', 2, q'[File System Architecture]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('273', 2, q'[Reverse Engineering]'); 
INSERT INTO Standard_Skill (stks_code, tier_number, stks_description) VALUES ('501', 3, q'[Agile/Scrum Development]'); 

-- The Groups_Skill table not needed for query testing; hence currently not populated. 
--INSERT INTO Groups_Skill (stks_code, cluster_code) VALUES ('', ''); 

-- Computer and Information Research Scientists
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151111', '050'); 
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151111', '905'); 
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151111', '908'); 
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151111', '904'); 
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151111', '901'); 
-- Computer Systems Analysts 
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151121', '904'); 
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151121', '905'); 
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151121', '272'); 
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151121', '246'); 
-- Information Security Analysts 
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151122', '904'); 
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151122', '905'); 
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151122', '246'); 
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151122', '271'); 
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151122', '272'); 
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151122', '273'); 
-- Computer Programers
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151131', '098'); 
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151131', '175'); 
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151131', '158'); 
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151131', '123'); 
-- Software Developers, Applications
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151132', '098'); 
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151132', '175'); 
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151132', '158'); 
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151132', '123'); 
-- Softward Developers, Systems Software
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151133', '246'); 
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151133', '175'); 
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151133', '158'); 
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151133', '123'); 
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151133', '035'); 
-- Web Developers 
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151134', '047'); 
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151134', '175'); 
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151134', '158'); 
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151134', '123'); 
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151134', '109'); 
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151134', '088'); 
-- Database Administrators 
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151141', '201'); 
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151141', '224'); 
-- Network and Computer Systems Administrators
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151142', '902'); 
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151142', '909'); 
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151142', '224'); 
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151142', '123'); 
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151142', '158'); 
-- Computer Network Architects
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151143', '902'); 
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151143', '909'); 
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151143', '224'); 
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151143', '123'); 
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151143', '158'); 
-- Computer User Support Specialists
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151151', '904'); 
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151151', '123'); 
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151151', '158'); 
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151151', '129'); 
-- Computer Network Support Specialists
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151152', '904'); 
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151152', '224'); 
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151152', '123'); 
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('151152', '158'); 
-- College Instructors
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('251021', '910'); 
INSERT INTO Core_Job_Skills (SOC_code, stks_code) VALUES ('251021', '175'); 

INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('901', 'Work with a team', '902');
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('902', 'Work with clients', '903');
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('903', 'Critical thinking', '901'); 
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('904', 'Verbal communication', '904'); 
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('905', 'Written communication', '905'); 
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('908', 'Desire to learn', '908'); 
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('909', 'Leadership skills', '909'); 
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('910', 'Teaching skills', '910'); 
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('001', 'C#', '140'); 
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('002', 'ASP', '026');
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('003', 'MVC', '164');
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('004', 'LINQ', '001');
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('005', 'Entity Framework', '001'); 
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('006', 'Web API', '258');
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('007', 'HTML', '088');
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('008', 'CSS', '047'); 
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('009', 'JavaScript', '109'); 
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('010', 'Angular JS', '018'); 
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('011', 'Agile/Scrum', '501'); 
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('012', '.NET', '001'); 
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('013', 'Node.JS', '170');
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('014', 'Spring', '221');
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('015', 'Java', '101');
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('016', 'JDBC', '112');
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('017', 'Oracle SQL', '178'); 
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('018', 'Python', '192'); 
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('101', 'OSX', '129'); 
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('102', 'Microsoft Windows', '158'); 
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('103', 'Linux', '123'); 
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('019', 'C', '140'); 
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('020', 'C++', '035'); 
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('021', 'UNIX Shell', '246'); 
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('022', 'Windows PowerShell', '150'); 
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('023', 'Ruby', '204'); 
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('024', 'Ruby on Rails', '205'); 
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('025', 'jQuery', '116'); 
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('026', 'JSON', '118'); 
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('027', 'Amazon Web Services', '015'); 
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('028', 'Android', '016'); 
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('029', 'Android SDK', '017'); 
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('030', 'SQL', '224'); 
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('032', 'Object-Oriented Programming', '175'); 
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('033', 'Scrum Master', '501'); 
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('034', 'Relational Database Management System', '201'); 
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('035', 'ODBC', '176'); 
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('036', 'SQL Server', '225'); 
-- For testing purposes, no person should have all three of skills 037, 038, and 039. 
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('037', 'Usability Testing', '247');
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('038', 'JUnit', '119'); 
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('039', 'Selenium', '212'); 
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('040', 'Penetration Testing', '271'); 
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('041', 'File System Architecture', '272'); 
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('042', 'Reverse Engineering', '273'); 
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('043', 'UNIX', '245'); 
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('044', 'Oracle PL/SQL', '179'); 
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('045', 'Integrated Development Environment (IDE)', '098'); 
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('046', 'Graphical User Interface (GUI)', '078'); 
INSERT INTO Knowledge_Skill (ks_code, ks_title, stks_code) VALUES ('047', 'JBoss Framework', '111'); 


--------------------------------------------------------------------------------
-- Courses, prereqs, skills they teach, and sections for each. -----------------
--------------------------------------------------------------------------------
-- MAKE SURE EACH CERTIFICATE HAS AT LEAST ONE ASSOCIATED COURSE!!!
INSERT INTO Course (course_code, course_title, course_level, course_description, status, retail_price) VALUES 
	('1501', 'Data Structures in Java', '1', 'A third course in Java programming. Passing this course establishes basic competency in Java for job market purposes.', 'active', 225.00); 
INSERT INTO Course (course_code, course_title, course_level, course_description, status, retail_price) VALUES 
	('1502', 'Data Structures in Python', '1', 'A third course in Python programming. Passing this course establishes basic competency in Python for job market purposes.', 'active', 225.00); 
INSERT INTO Course (course_code, course_title, course_level, course_description, status, retail_price) VALUES 
	('1503', 'Data Structures in C++', '1', 'A third course in C++ programming. Passing this course establishes basic competency in C++ for job market purposes.', 'active', 225.00); 
INSERT INTO Course (course_code, course_title, course_level, course_description, status, retail_price) VALUES 
	('2201', 'Introductory Web Development', '2', 'A first course in web application development. Covers basic HTML5, CSS, and JavaScript.', 'active', 350.00); 
INSERT INTO Course (course_code, course_title, course_level, course_description, status, retail_price) VALUES 
	('3201', 'Modern Web Frameworks', '3', 'Covers a number of contemporary front-end and back-end frameworks for building web apps, including but not limited to Spring, jQuery, Node.JS, AngularJS, JSON.', 'active', 415.00); 
INSERT INTO Course (course_code, course_title, course_level, course_description, status, retail_price) VALUES 
	('3202', 'Web Development in Ruby on Rails', '3', 'Pretty much what it sounds like--this course covers webpage development in Ruby on Rails in depth.', 'active', 427.00); 
INSERT INTO Course (course_code, course_title, course_level, course_description, status, retail_price) VALUES 
	('3213', 'Application Development with Amazon Web Services, 1', '3', 'An in-depth introduction to application development using Amazon Web Services', 'active', 575.00); 
INSERT INTO Course (course_code, course_title, course_level, course_description, status, retail_price) VALUES 
	('3214', 'Application Development with Amazon Web Services, 2', '3', 'A second course in AWS development; students will work in a team setting to produce a large-scale project', 'active', 655.00); 
INSERT INTO Course (course_code, course_title, course_level, course_description, status, retail_price) VALUES 
	('3221', 'Android Application Development', '3', 'An in-depth introduction to development in Androd. Students will produce a large-scale project in a team setting.', 'active', 685.00); 
INSERT INTO Course (course_code, course_title, course_level, course_description, status, retail_price) VALUES 
	('3231', 'Application Development for .NET Framework', '3', q'[An in-depth introduction to development in Microsoft's .NET framework. Programming in C#, ASP, LINQ, and Entity frameworks will be discussed. Students will produce a large-scale project in a team setting.]', 'active', 685.00); 
INSERT INTO Course (course_code, course_title, course_level, course_description, status, retail_price) VALUES 
	('3301', 'JBoss Development for RedHat Certification', '3', 'Teaches intermediate/advanced Java development using the JBoss Framework.', 'active', 345.50); 
INSERT INTO Course (course_code, course_title, course_level, course_description, status, retail_price) VALUES 
	('3701', 'Software Testing Frameworks', '3', q'[Covers the basics of several popular testing frameworks, including but not limited to JUnit and Selenium]', 'active', 295.00); 
INSERT INTO Course (course_code, course_title, course_level, course_description, status, retail_price) VALUES 
	('3702', 'Usability Testing', '3', q'[Discusses the intricacies of developing web pages and applications for a diverse audience. Google Chrome's built-in usability testing features are discussed.]', 'active', 295.00); 
INSERT INTO Course (course_code, course_title, course_level, course_description, status, retail_price) VALUES 
	('4101', 'SQL and RDBS Design', '4', 'This course covers beginner and intermediate SQL, JDBC, and Relational Database Design', 'active', 475.00); 
INSERT INTO Course (course_code, course_title, course_level, course_description, status, retail_price) VALUES 
	('4102', 'SQL and RDBS Design for Microsoft Applications', '4', 'This course covers beginner and intermediate SQL Server, ODBC, and Relational Database Design', 'active', 475.00); 
INSERT INTO Course (course_code, course_title, course_level, course_description, status, retail_price) VALUES 
	('5101', 'Advanced SQL and RDBS Design', '4', 'This course covers advanced querying techniques in the SQL language with a focus on Oracle SQL and JDBC. Other topics include permissions, managing data transactions in a world-wide setting, and database design', 'active', 925.00); 
INSERT INTO Course (course_code, course_title, course_level, course_description, status, retail_price) VALUES 
	('5102', 'Advanced SQL and RDBS Design for Microsoft Applications', '4', 'This course covers advanced querying techniques in SQL language with a focus on SQL Server and ODBC. Other topics include permissions, managing data transactions in a world-wide setting, and database design', 'active', 925.00); 
INSERT INTO Course (course_code, course_title, course_level, course_description, status, retail_price) VALUES 
	('2501', 'Systems Programming Concepts', '2', 'Teaches basics of programming in the UNIX environment in C++. Additional topics include the UNIX Shell and Linux.', 'active', 350.00); 
INSERT INTO Course (course_code, course_title, course_level, course_description, status, retail_price) VALUES 
	('3501', 'Operating Systems', '3', 'This course covers basic issues in the design and implementation of an operating system, including File Systems, Multithreading, Processes, and Memory Management for major operating systems', 'active', 400.00); 
INSERT INTO Course (course_code, course_title, course_level, course_description, status, retail_price) VALUES 
	('4501', 'Reverse Engineering', '4', 'Teaches basics of reverse engineering, including memory dumps, and various tools', 'active', 475.00); 
INSERT INTO Course (course_code, course_title, course_level, course_description, status, retail_price) VALUES 
	('4502', 'Penetration Testing', '4', 'Teaches basic and intermediate strategies in testing the vulnerabilities of a system', 'active', 475.00); 
INSERT INTO Course (course_code, course_title, course_level, course_description, status, retail_price) VALUES 
	('5601', 'Agile Software Development', '4', 'Students will learn the basics of working in an Agile environment by working in groups to produce a large-scale Java project', 'active', 795.00); 
	
INSERT INTO Prerequisite (course_code, prereq_code) VALUES ('5601', '1501'); 
INSERT INTO Prerequisite (course_code, prereq_code) VALUES ('5102', '4102'); 
INSERT INTO Prerequisite (course_code, prereq_code) VALUES ('5101', '4101'); 
INSERT INTO Prerequisite (course_code, prereq_code) VALUES ('4102', '3231'); 
INSERT INTO Prerequisite (course_code, prereq_code) VALUES ('4101', '1501'); 
INSERT INTO Prerequisite (course_code, prereq_code) VALUES ('4502', '3501'); 
INSERT INTO Prerequisite (course_code, prereq_code) VALUES ('4502', '1502'); 
INSERT INTO Prerequisite (course_code, prereq_code) VALUES ('4501', '3501'); 
INSERT INTO Prerequisite (course_code, prereq_code) VALUES ('3701', '1501'); 
INSERT INTO Prerequisite (course_code, prereq_code) VALUES ('3501', '2501'); 
INSERT INTO Prerequisite (course_code, prereq_code) VALUES ('3301', '1501'); 
INSERT INTO Prerequisite (course_code, prereq_code) VALUES ('3221', '1501'); 
INSERT INTO Prerequisite (course_code, prereq_code) VALUES ('3213', '2201'); 
INSERT INTO Prerequisite (course_code, prereq_code) VALUES ('3201', '2201'); 
INSERT INTO Prerequisite (course_code, prereq_code) VALUES ('2501', '1503'); 
	
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('1501', '015'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('1501', '032'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('1501', '045'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('1501', '046'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('1502', '018'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('1502', '032'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('1502', '045'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('1502', '046'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('1503', '020'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('1503', '032'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('1503', '045'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('1503', '046'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('2201', '007'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('2201', '008'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('2201', '009'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('3201', '026'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('3201', '010'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('3201', '013'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('3201', '025'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('3201', '014'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('3202', '023'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('3202', '024'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('3213', '027'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('3214', '027'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('3214', '901'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('3221', '028'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('3221', '029'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('3221', '901'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('3231', '901'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('3231', '001'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('3231', '002'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('3231', '004'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('3231', '005'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('3231', '012'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('3301', '015'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('3301', '103'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('3301', '047'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('3701', '038'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('3701', '039'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('3702', '037'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('4101', '016'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('4101', '030'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('4102', '035'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('4102', '036'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('5101', '016'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('5101', '034'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('5101', '044'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('5102', '034'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('5102', '035'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('5102', '036'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('5601', '011'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('5601', '015'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('5601', '901'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('2501', '103'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('2501', '020'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('2501', '021'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('2501', '043'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('3501', '041'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('3501', '101'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('3501', '102'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('3501', '103'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('4501', '042'); 
INSERT INTO Teaches_Skill (course_code, ks_code) VALUES ('4502', '040'); 

INSERT INTO Requires_Course (certificate_code, course_code) VALUES ('110014', '3301'); 
INSERT INTO Requires_Course (certificate_code, course_code) VALUES ('110007', '3213'); 
INSERT INTO Requires_Course (certificate_code, course_code) VALUES ('110008', '3214'); 
INSERT INTO Requires_Course (certificate_code, course_code) VALUES ('110009', '3213'); 
INSERT INTO Requires_Course (certificate_code, course_code) VALUES ('110010', '3214'); 
INSERT INTO Requires_Course (certificate_code, course_code) VALUES ('110011', '3214'); 
INSERT INTO Requires_Course (certificate_code, course_code) VALUES ('110015', '4101'); 
INSERT INTO Requires_Course (certificate_code, course_code) VALUES ('110016', '5101'); 
INSERT INTO Requires_Course (certificate_code, course_code) VALUES ('110006', '5102'); 
INSERT INTO Requires_Course (certificate_code, course_code) VALUES ('110005', '4102'); 
INSERT INTO Requires_Course (certificate_code, course_code) VALUES ('110012', '3231'); 
INSERT INTO Requires_Course (certificate_code, course_code) VALUES ('110013', '3231'); 

-- Current courses (for use with required queries 10, 11, 12). 
-- Databases, specifically with Oracle and Java. 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('4101', '4501', '2017', TO_DATE('13-MAY-17', 'DD-MON-RR'), '111111555', 'classroom', 975.00); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('4101', '4411', '2017', TO_DATE('05-JUN-17', 'DD-MON-RR'), '111111444', 'online-sync', 875.00); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('4101', '4421', '2017', TO_DATE('25-JUN-17', 'DD-MON-RR'), '111111444', 'correspondence', 775.00); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('5101', '4413', '2017', TO_DATE('12-JUN-17', 'DD-MON-RR'), '111111444', 'online-sync', 1025.00); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('5101', '4414', '2017', TO_DATE('03-JUL-17', 'DD-MON-RR'), '111111444', 'correspondence', 855.00); 
-- Databases, specifically with SQL Server and ODBC. 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('4102', '4111', '2017', TO_DATE('06-JUN-17', 'DD-MON-RR'), '111111111', 'online-sync', 1015.95); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('4102', '4121', '2017', TO_DATE('26-JUN-17', 'DD-MON-RR'), '111111111', 'correspondence', 895.75); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('5102', '4112', '2017', TO_DATE('13-JUN-17', 'DD-MON-RR'), '111111111', 'online-sync', 1175.75); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('5102', '4122', '2017', TO_DATE('07-JUL-17', 'DD-MON-RR'), '111111111', 'correspondence', 925.95); 
-- Intro courses in basic languages
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('1501', '4501', '2017', TO_DATE('12-MAY-17', 'DD-MON-RR'), '111111555', 'classroom', 775.00); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('1501', '4611', '2017', TO_DATE('30-MAY-17', 'DD-MON-RR'), '111111666', 'online-sync', 125.00); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('1501', '4612', '2017', TO_DATE('30-JUN-17', 'DD-MON-RR'), '111111666', 'online-sync', 125.00); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('1502', '4613', '2017', TO_DATE('30-MAY-17', 'DD-MON-RR'), '111111666', 'online-sync', 125.00); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('1502', '4614', '2017', TO_DATE('30-JUN-17', 'DD-MON-RR'), '111111666', 'online-sync', 125.00); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('1503', '4501', '2017', TO_DATE('12-MAY-17', 'DD-MON-RR'), '111111555', 'classroom', 775.00); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('1503', '4615', '2017', TO_DATE('30-MAY-17', 'DD-MON-RR'), '111111666', 'online-sync', 150.00); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('1503', '4616', '2017', TO_DATE('30-JUN-17', 'DD-MON-RR'), '111111666', 'online-sync', 150.00); 
-- AWS Courses, offered only through Amazon. 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('3213', '4211', '2017', TO_DATE('12-MAY-17', 'DD-MON-RR'), '111111222', 'online-sync', 675.00); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('3213', '4221', '2017', TO_DATE('19-MAY-17', 'DD-MON-RR'), '111111222', 'correspondence', 575.00); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('3214', '4212', '2017', TO_DATE('12-AUG-17', 'DD-MON-RR'), '111111222', 'online-sync', 755.00); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('3214', '4222', '2017', TO_DATE('29-AUG-17', 'DD-MON-RR'), '111111222', 'correspondence', 655.00); 
-- WebDev courses 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('2201', '4501', '2017', TO_DATE('12-MAY-17', 'DD-MON-RR'), '111111555', 'classroom', 600.00); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('2201', '4631', '2017', TO_DATE('27-MAY-17', 'DD-MON-RR'), '111111666', 'online-selfpaced', 375.95); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('3201', '4611', '2017', TO_DATE('05-JUN-17', 'DD-MON-RR'), '111111666', 'online-sync', 415.95); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('3201', '4631', '2017', TO_DATE('15-JUN-17', 'DD-MON-RR'), '111111666', 'online-selfpaced', 455.95); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('3202', '4501', '2017', TO_DATE('12-MAY-17', 'DD-MON-RR'), '111111555', 'classroom', 795.00); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('3202', '4631', '2017', TO_DATE('13-AUG-17', 'DD-MON-RR'), '111111666', 'online-selfpaced', 455.00); 
-- Android course at UNO only.
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('3221', '4501', '2017', TO_DATE('12-MAY-17', 'DD-MON-RR'), '111111555', 'classroom', 745.50); 
-- .NET course through Microsoft only, in two formats. 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('3231', '4111', '2017', TO_DATE('05-JUN-17', 'DD-MON-RR'), '111111111', 'online-sync', 695.95); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('3231', '4131', '2017', TO_DATE('15-MAY-17', 'DD-MON-RR'), '111111111', 'online-selfpaced', 750.95); 
-- JBoss class through RedHat only. 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('3301', '4330', '2017', TO_DATE('17-JUL-17', 'DD-MON-RR'), '111111333', 'online-selfpaced', 345.50); 
-- Testing and Agile Courses mixed at UNO and Coursera. 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('3701', '4501', '2017', TO_DATE('12-May-17', 'DD-MON-RR'), '111111555', 'classroom', 550.00); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('3702', '4501', '2017', TO_DATE('12-May-17', 'DD-MON-RR'), '111111555', 'classroom', 575.00); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('5601', '4501', '2017', TO_DATE('12-Aug-17', 'DD-MON-RR'), '111111555', 'classroom', 779.95); 
-- Systems and IA courses mixed at UNO and Coursera. 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('2501', '4530', '2017', TO_DATE('15-MAY-17', 'DD-MON-RR'), '111111555', 'online-selfpaced', 425.00); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('2501', '4610', '2017', TO_DATE('05-MAY-17', 'DD-MON-RR'), '111111666', 'online-sync', 525.79); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('3501', '4500', '2017', TO_DATE('12-MAY-17', 'DD-MON-RR'), '111111555', 'classroom', 625.89); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('3501', '4501', '2017', TO_DATE('15-AUG-17', 'DD-MON-RR'), '111111555', 'classroom', 325.89); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('3501', '4630', '2017', TO_DATE('25-MAY-17', 'DD-MON-RR'), '111111666', 'online-selfpaced', 575.99); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('4501', '4500', '2017', TO_DATE('12-MAY-17', 'DD-MON-RR'), '111111555', 'classroom', 950.00); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('4501', '4610', '2017', TO_DATE('05-JUN-17', 'DD-MON-RR'), '111111666', 'online-sync', 799.95); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('4502', '4500', '2017', TO_DATE('20-DEC-17', 'DD-MON-RR'), '111111555', 'classroom', 875.00); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('4502', '4630', '2017', TO_DATE('21-AUG-17', 'DD-MON-RR'), '111111666', 'online-selfpaced', 950.00); 
	
	
-- Past courses (primarily for use in application when adding new hire). 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('1501', '3501', '2014', TO_DATE('12-MAY-14', 'DD-MON-RR'), '111111555', 'classroom', 775.00); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('1501', '3611', '2016', TO_DATE('30-MAY-16', 'DD-MON-RR'), '111111666', 'online-sync', 125.00); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('1502', '3612', '2015', TO_DATE('30-MAY-15', 'DD-MON-RR'), '111111666', 'online-sync', 125.00); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('1502', '3611', '2013', TO_DATE('30-JUN-13', 'DD-MON-RR'), '111111666', 'online-sync', 125.00); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('1503', '3501', '2015', TO_DATE('12-MAY-17', 'DD-MON-RR'), '111111555', 'classroom', 775.00); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('1503', '3612', '2016', TO_DATE('30-MAY-17', 'DD-MON-RR'), '111111666', 'online-sync', 150.00); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('2201', '3501', '2014', TO_DATE('12-MAY-14', 'DD-MON-RR'), '111111555', 'classroom', 600.00); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('2201', '3631', '2015', TO_DATE('27-MAY-15', 'DD-MON-RR'), '111111666', 'online-selfpaced', 375.95); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('2501', '3530', '2014', TO_DATE('15-MAY-14', 'DD-MON-RR'), '111111555', 'online-selfpaced', 425.00); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('3201', '3611', '2013', TO_DATE('05-JUN-13', 'DD-MON-RR'), '111111666', 'online-sync', 415.95); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('3201', '3631', '2016', TO_DATE('15-JUN-16', 'DD-MON-RR'), '111111666', 'online-selfpaced', 455.95); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('3202', '3501', '2012', TO_DATE('12-MAY-12', 'DD-MON-RR'), '111111555', 'classroom', 795.00); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('3213', '3211', '2016', TO_DATE('12-MAY-17', 'DD-MON-RR'), '111111222', 'online-sync', 675.00); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('3214', '3211', '2013', TO_DATE('12-AUG-17', 'DD-MON-RR'), '111111222', 'online-sync', 755.00); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('3221', '3501', '2016', TO_DATE('12-AUG-16', 'DD-MON-RR'), '111111555', 'classroom', 745.50); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('3231', '3131', '2015', TO_DATE('15-MAY-15', 'DD-MON-RR'), '111111111', 'online-selfpaced', 750.95); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('3301', '3330', '2013', TO_DATE('17-JUL-13', 'DD-MON-RR'), '111111333', 'online-selfpaced', 345.50); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('3501', '3630', '2015', TO_DATE('25-MAY-15', 'DD-MON-RR'), '111111666', 'online-selfpaced', 575.99); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('3701', '3501', '2013', TO_DATE('12-MAY-13', 'DD-MON-RR'), '111111555', 'classroom', 550.00); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('3702', '3501', '2016', TO_DATE('20-DEC-16', 'DD-MON-RR'), '111111555', 'classroom', 575.00); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('4101', '3501', '2016', TO_DATE('13-MAY-16', 'DD-MON-RR'), '111111555', 'classroom', 975.00); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('4101', '3411', '2016', TO_DATE('05-JUN-16', 'DD-MON-RR'), '111111444', 'online-sync', 875.00); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('4101', '3421', '2014', TO_DATE('25-JUN-14', 'DD-MON-RR'), '111111444', 'correspondence', 775.00); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('4102', '3111', '2016', TO_DATE('06-JUN-16', 'DD-MON-RR'), '111111111', 'online-sync', 1015.95); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('4102', '3121', '2014', TO_DATE('26-JUN-14', 'DD-MON-RR'), '111111111', 'correspondence', 895.75); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('4501', '3500', '2013', TO_DATE('21-DEC-13', 'DD-MON-RR'), '111111555', 'classroom', 950.00); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('4502', '4630', '2016', TO_DATE('21-AUG-16', 'DD-MON-RR'), '111111666', 'online-selfpaced', 950.00); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('5101', '3413', '2015', TO_DATE('12-JUN-15', 'DD-MON-RR'), '111111444', 'online-sync', 1025.00); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('5101', '3414', '2016', TO_DATE('03-JUL-16', 'DD-MON-RR'), '111111444', 'correspondence', 855.00); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('5102', '3112', '2015', TO_DATE('13-JUN-15', 'DD-MON-RR'), '111111111', 'online-sync', 1175.75); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('5102', '3122', '2016', TO_DATE('07-JUL-16', 'DD-MON-RR'), '111111111', 'correspondence', 925.95); 
INSERT INTO Course_Section (course_code, section_no, section_year, completion_date, offered_by, section_format, section_price) VALUES
	('5601', '3501', '2015', TO_DATE('12-AUG-15', 'DD-MON-RR'), '111111555', 'classroom', 779.95); 
	
	
--------------------------------------------------------------------------------
-- Jobs, their requirements, and their categorizations -------------------------
--------------------------------------------------------------------------------	
INSERT INTO Job (job_code, company_id, emp_mode, pay_type, job_title, job_description) VALUES 
	('99901', '999001111', 'part-time', 'salary', 'Adjunct Instructor - Computer Science', q'[Department of Computer Science seeks adjunct instructor to teach one course a semester. Specific need is for Software Development 1, taught in Python.]'); 
INSERT INTO Job (job_code, company_id, emp_mode, pay_type, job_title, job_description) VALUES 
	('99902', '999002222', 'part-time', 'salary', 'Adjunct Instructor - Computer Science', q'[Computer Science Department looks to hire an adjunct instructor to teach one section of Software Development 1 a semester. Language of program is Java.]'); 
INSERT INTO Job (job_code, company_id, emp_mode, pay_type, job_title, job_description) VALUES 
	('10001', '111111111', 'full-time', 'salary', 'Web Developer - Back End .NET', q'[Our ideal candidate will be a passionate, talented and creative person that is looking to share in our mission of delivering the most robust, user friendly platforms that deliver exceptional results for our clients. You will have a working knowledge of Microsoft's C#.net and ASP.net. Development experience in SQL Server is an added benefit. In addition, you should be familiar with HTML, CSS, and JavaScript. Desire to learn is a must!]'); 
INSERT INTO Job (job_code, company_id, emp_mode, pay_type, job_title, job_description) VALUES 
	('20001', '111111111', 'full-time', 'hourly', 'Software Engineer, Junior', q'[Ideal candidate will have expertise in back end development using Java. Proficiency in Spring, JavaScript, AngularJS, and NodeJS are expected. Familarity with Oracle SQL and JDBC are preferred. Certification as Oracle PL/SQL Developer Certified Associate is a plus, but not required. Communication skills are a must; demonstrated leadership ability improves chances of advancement.]');  
INSERT INTO Job (job_code, company_id, emp_mode, pay_type, job_title, job_description) VALUES 
	('30001', '222111111', 'full-time', 'salary', 'IT Technician', q'[Position will serve all on-site IT needs for the school. Competency expected in all major operating systems. Capability to teach elementary programming course in Python expected. Experience in educational setting preferred.]'); 
INSERT INTO Job (job_code, company_id, emp_mode, pay_type, job_title, job_description) VALUES 
	('44401', '444111111', 'full-time', 'hourly', 'Traveling IT Consultant', q'[Employee will assistant local client businesses in constructing and maintaining computer and network systems. Candidate must be familiar with major operating systems, including several flavors of Linux. Certification in Java Development for RedHat Linux is required. Proficiency in both UNIX and Window shells required. Experience programming in C and C++ preferred. Solid communication skills are required.]');
INSERT INTO Job (job_code, company_id, emp_mode, pay_type, job_title, job_description) VALUES 
	('55502', '555111111', 'full-time', 'hourly', 'Web Developer - Back End', q'[Developer will help maintain and add new features to existing sites built for prominent business clients. Primary development in Ruby and Ruby on Rails. Knowledge of HTML, CSS, JavaScript, jQuery, Node.js, and JSON are required as well.]'); 
INSERT INTO Job (job_code, company_id, emp_mode, pay_type, job_title, job_description) VALUES 
	('55504', '555111111', 'full-time', 'hourly', 'Android Application Developer - Senior', q'[Seeking Senior Developer to lead team in Android Development. Apart from Android SDK, expertise in Java, JDBC, and Oracle SQL are necessary. Experience leading a team will be prefered.]'); 
INSERT INTO Job (job_code, company_id, emp_mode, pay_type, job_title, job_description) VALUES 
	('66601', '666111111', 'full-time', 'salary', 'Business Analyst', q'[Qualified candidates will possess the leadership, writing, and speaking skills to effectivly communicate needs, expectations, and abilities between clients and a database design team. This position requires the candidate to have a thorough understanding of RDBMS, object-oriented programming, and SQL. Expertise in working in Agile environment expected (Scrum master desired).]'); 
INSERT INTO Job (job_code, company_id, emp_mode, pay_type, job_title, job_description) VALUES 
	('66604', '666111111', 'full-time', 'salary', 'Senior Application Developer - .NET', q'[Senior developer position for database applications in .NET framework. Requires in-depth knowledge of SQL Server, ODBC, C#, and .NET framework. Position requires Microsoft Certified Solutions Expert: Data Management and Analytics certification. Experience working in Agile environment required.]'); 
INSERT INTO Job (job_code, company_id, emp_mode, pay_type, job_title, job_description) VALUES 
	('66607', '666111111', 'full-time', 'salary', 'Junior Application Developer - Java', q'[Junior developer comfortable with developing Oracle database applications using Oracle SQL, Java, JDBC, and the Spring framework sought. Requires Oracle PL/SQL Developer Certified Associate certification.]'); 
-- The following jobs are currently not filled. 
INSERT INTO Job (job_code, company_id, emp_mode, pay_type, job_title, job_description) VALUES 
	('66605', '666111111', 'full-time', 'salary', 'Senior Application Developer - Java', q'[Senior developer position for Oracle database applications. Requires in-depth knowledge of Oracle SQL, JDBC, Java, and Spring framework. Position requires Oracle Database SQL Expert certification. Experience in Agile environment necessary.]'); 
INSERT INTO Job (job_code, company_id, emp_mode, pay_type, job_title, job_description) VALUES 
	('66606', '666111111', 'full-time', 'salary', 'Junior Application Developer - .NET', q'[Junior developer capable of developing application in .Net framework wanted. Must be comfortable with SQL Server, ODBC, C#, and .NET framework. Requires Microsoft Certified Solutions Associate: SQL Server 2012/2014 certification.]'); 
INSERT INTO Job (job_code, company_id, emp_mode, pay_type, job_title, job_description) VALUES 
	('55503', '555111111', 'full-time', 'salary', 'Web Developer - AWS', q'[Developer will help maintain and add new features to existing sites built for prominent business clients. Sites are built on Amazon Web Services. AWS Certified Developer - Associate certification is required, though DevOps Engineer - Professional Certification will be preferred. Knowledge of HTML, CSS, and JavaScript are required as well.]'); 
INSERT INTO Job (job_code, company_id, emp_mode, pay_type, job_title, job_description) VALUES 
	('55501', '555111111', 'full-time', 'salary', 'Web Developer - Front End', q'[Candidate will assist multiple backend teams on developing intuitive and elegent user interfaces. Fluency in HTML, CSS, and JavaScript are expected, as is familiary with jQuery. Experience developing in Ruby and Ruby on Rails is preferred.]'); 
-- There should be no one fully qualified for the following unfilled job. 
INSERT INTO Job (job_code, company_id, emp_mode, pay_type, job_title, job_description) VALUES 
	('66602', '666111111', 'full-time', 'salary', 'Quality Assurance Specialist', q'[Specialist will ensure that software in production meets all guidelines and requirements as set by product owner. Experience in Usability Testing and the JUnit and Selenium Frameworks is required. Experience with Agile/Scrum is necessary as well.]'); 
	
INSERT INTO Categorizes_Job (job_code, SOC_code) VALUES ('10001', '151134'); 
INSERT INTO Categorizes_Job (job_code, SOC_code) VALUES ('20001', '151132');
INSERT INTO Categorizes_Job (job_code, SOC_code) VALUES ('30001', '151142'); 
INSERT INTO Categorizes_Job (job_code, SOC_code) VALUES ('44401', '151152'); 
INSERT INTO Categorizes_Job (job_code, SOC_code) VALUES ('55501', '151134'); 
INSERT INTO Categorizes_Job (job_code, SOC_code) VALUES ('55502', '151134'); 
INSERT INTO Categorizes_Job (job_code, SOC_code) VALUES ('55503', '151134'); 
INSERT INTO Categorizes_Job (job_code, SOC_code) VALUES ('55504', '151132'); 
INSERT INTO Categorizes_Job (job_code, SOC_code) VALUES ('66601', '151199'); 
INSERT INTO Categorizes_Job (job_code, SOC_code) VALUES ('66602', '151199'); 
INSERT INTO Categorizes_Job (job_code, SOC_code) VALUES ('66604', '151132'); 
INSERT INTO Categorizes_Job (job_code, SOC_code) VALUES ('66605', '151132'); 
INSERT INTO Categorizes_Job (job_code, SOC_code) VALUES ('66606', '151132'); 
INSERT INTO Categorizes_Job (job_code, SOC_code) VALUES ('66607', '151132'); 
INSERT INTO Categorizes_Job (job_code, SOC_code) VALUES ('99901', '251021');
INSERT INTO Categorizes_Job (job_code, SOC_code) VALUES ('99902', '251021');
	
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('10001', '001'); 
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('10001', '002'); 
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('10001', '003'); 
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('10001', '004'); 
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('10001', '012');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('10001', '009'); 
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('10001', '005'); 
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('10001', '006'); 
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('10001', '007'); 
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('10001', '008');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('20001', '904'); 
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('20001', '905'); 
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('20001', '009'); 
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('20001', '010'); 
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('20001', '013'); 
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('20001', '014'); 
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('20001', '015'); 
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('30001', '018'); 
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('30001', '101'); 
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('30001', '102'); 
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('30001', '103'); 
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('30001', '910'); 
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('44401', '904'); 
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('44401', '101');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('44401', '102');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('44401', '103');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('44401', '021');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('44401', '022');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('55501', '007');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('55501', '008');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('55501', '009');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('55501', '025');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('55502', '023');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('55502', '024');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('55502', '007');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('55502', '008');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('55502', '009');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('55502', '025');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('55502', '013');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('55502', '026');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('55503', '007');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('55503', '008');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('55503', '009');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('55503', '027');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('55504', '029');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('55504', '028');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('55504', '015');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('55504', '016');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('55504', '017');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('66601', '902');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('66601', '904');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('66601', '905');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('66601', '909');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('66601', '034');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('66601', '032');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('66601', '033');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('66602', '037');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('66602', '038');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('66602', '039');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('66602', '011');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('66604', '001');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('66604', '012');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('66604', '035');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('66604', '036');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('66604', '011');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('66605', '014');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('66605', '015');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('66605', '016');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('66605', '017');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('66605', '011');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('66606', '001');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('66606', '012');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('66606', '035');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('66606', '036');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('66607', '014');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('66607', '015');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('66607', '016');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('66607', '017');
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('99901', '910'); 
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('99901', '018'); 
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('99902', '910'); 
INSERT INTO Requires_Skill (job_code, ks_code) VALUES ('99902', '015'); 
	
INSERT INTO Prefers_Skill (job_code, ks_code) VALUES ('10001', '010'); 
INSERT INTO Prefers_Skill (job_code, ks_code) VALUES ('10001', '011'); 
INSERT INTO Prefers_Skill (job_code, ks_code) VALUES ('20001', '016'); 
INSERT INTO Prefers_Skill (job_code, ks_code) VALUES ('20001', '017'); 
INSERT INTO Prefers_Skill (job_code, ks_code) VALUES ('20001', '909'); 
INSERT INTO Prefers_Skill (job_code, ks_code) VALUES ('44401', '019'); 
INSERT INTO Prefers_Skill (job_code, ks_code) VALUES ('44401', '020'); 
INSERT INTO Prefers_Skill (job_code, ks_code) VALUES ('55501', '023');
INSERT INTO Prefers_Skill (job_code, ks_code) VALUES ('55501', '024');
INSERT INTO Prefers_Skill (job_code, ks_code) VALUES ('55504', '909');
	
INSERT INTO Requires_Certificate (job_code, certificate_code) VALUES ('44401', '110014'); 
INSERT INTO Requires_Certificate (job_code, certificate_code) VALUES ('55503', '110007'); 
INSERT INTO Requires_Certificate (job_code, certificate_code) VALUES ('66604', '110006'); 
INSERT INTO Requires_Certificate (job_code, certificate_code) VALUES ('66605', '110016'); 
INSERT INTO Requires_Certificate (job_code, certificate_code) VALUES ('66606', '110005'); 
INSERT INTO Requires_Certificate (job_code, certificate_code) VALUES ('66607', '110015'); 

INSERT INTO Prefers_Certificate (job_code, certificate_code) VALUES ('20001', '110015'); 
INSERT INTO Prefers_Certificate (job_code, certificate_code) VALUES ('55503', '110008'); 

--------------------------------------------------------------------------------
-- People, their skills, jobs, certificates, and the courses they've taken. ----
--------------------------------------------------------------------------------
-- People who will have had long-term careers. ---------------------------------
INSERT INTO Person (person_id, first_name, middle_name, last_name, p_street_no, p_street_name, p_unit_no, p_city, p_state, p_zip, email, gender) VALUES 
	('111110001', 'Franklin', 'Daydream', 'Worrell', '4242', 'Saint Sebastian Ave', 
		'N/A', 'New Orleans', 'LA', '71107', 'frankie.d@some.mail.com', 'M'); 
INSERT INTO Person (person_id, first_name, middle_name, last_name, p_street_no, p_street_name, p_unit_no, p_city, p_state, p_zip, email, gender) VALUES 
	('111110002', 'Iris', 'Ann', 'Murdoch', '86732', 'Omelas St', '7A', 'Chalmette', 
		'LA', '70227', 'iris.murdoch@philosopher.org', 'F'); 
INSERT INTO Person (person_id, first_name, middle_name, last_name, p_street_no, p_street_name, p_unit_no, p_city, p_state, p_zip, email, gender) VALUES 
	('111110003', 'Larry', 'David', 'Hume', '976', 'Wysteria Lane', 'C', 'Empire', 
		'LA', '71283', 'empiricalMind@philosopher.org', 'M');  
INSERT INTO Person (person_id, first_name, middle_name, last_name, p_street_no, p_street_name, p_unit_no, p_city, p_state, p_zip, email, gender) VALUES 
	('111110004', 'Jackson', 'Hindsight', 'Stone', '783', 'Wide Ave', '2', 'Mobile', 
		'AL', '36691', 'my.stone.wall@political.shelf', 'M'); 
INSERT INTO Person (person_id, first_name, middle_name, last_name, p_street_no, p_street_name, p_unit_no, p_city, p_state, p_zip, email, gender) VALUES 
	('111110005', 'Michelle', 'Angela', 'Givins', '7272', 'Adams St', 'N/A', 
		'New Orleans', 'LA', '70131', 'GivinsToReceive@hollow.com', 'F'); 
INSERT INTO Person (person_id, first_name, middle_name, last_name, p_street_no, p_street_name, p_unit_no, p_city, p_state, p_zip, email, gender) VALUES 
	('111110006', 'John', 'Jacob', 'Jingle', '121', 'Royal St', 'N/A', 
		'New Orleans', 'LA', '70118', 'you.get.it@bad.joke', 'M'); 
INSERT INTO Person (person_id, first_name, middle_name, last_name, p_street_no, p_street_name, p_unit_no, p_city, p_state, p_zip, email, gender) VALUES 
	('111110007', 'Felica', 'Wynnona', 'Bosch', '237', 'Willow St', 'N/A', 
		'New Orleans', 'LA', '70116', 'develop.this@software.net', 'F'); 
INSERT INTO Person (person_id, first_name, middle_name, last_name, p_street_no, p_street_name, p_unit_no, p_city, p_state, p_zip, email, gender) VALUES 
	('111110008', 'Jamie', 'Willow', 'Watkins', '5981', 'Spain St', 'C', 
		'New Orleans', 'LA', '70118', 'will.jam@bad.joke', 'F'); 
INSERT INTO Person (person_id, first_name, middle_name, last_name, p_street_no, p_street_name, p_unit_no, p_city, p_state, p_zip, email, gender) VALUES 
	('111110009', 'Brett', 'James', 'Jones', '1155', 'Oak St', '2', 'New Orleans', 
		'LA', '70118', 'keepingUpWithMe@bad.joke', 'M');  
INSERT INTO Person (person_id, first_name, middle_name, last_name, p_street_no, p_street_name, p_unit_no, p_city, p_state, p_zip, email, gender) VALUES 
	('111110010', 'Elton', 'Hercules', 'John', '344', 'Penny Lane', 'N/A', 'Boston', 
		'MA', '00234', 'tell.everybody@your.song', 'M');  
-- Persons who will be unemployed. ---------------------------------------------
INSERT INTO Person (person_id, first_name, middle_name, last_name, p_street_no, p_street_name, p_unit_no, p_city, p_state, p_zip, email, gender) VALUES 
	('111220001', 'James', 'Wilfred', 'Carson', '1212', 'Bear St', '6B', 
		'Baton Rouge', 'LA', '70125', 'drive.my.carson@bad.joke', 'M'); 
-- Second unemployed person in missing-three list for jobs 55501, 55503, 66606 and 6602. 
INSERT INTO Person (person_id, first_name, middle_name, last_name, p_street_no, p_street_name, p_unit_no, p_city, p_state, p_zip, email, gender) VALUES 
	('111220002', 'Alice', 'Rabbit', 'White', '203', 'Queen St', 'N/A', 'Red Bluff', 
		'CA', '97618', 'cup.of.tea@novel.read', 'F'); 
INSERT INTO Person (person_id, first_name, middle_name, last_name, p_street_no, p_street_name, p_unit_no, p_city, p_state, p_zip, email, gender) VALUES 
	('111220003', 'Anne', 'Wilma', 'Potter', '323', 'Wolf Park Cir', 'N/A', 
		'Gretna', 'LA', '70128', 'awpotts@some.mail.com', 'F'); 
-- Unemployed person in missing-one list for jobs 55501, 55503, 66606, and 66602. 
INSERT INTO Person (person_id, first_name, middle_name, last_name, p_street_no, p_street_name, p_unit_no, p_city, p_state, p_zip, email, gender) VALUES 
	('111220004', 'Ichabod', 'Sandpiper', 'Crane', '777', 'Brooks Rd', '3', 
		'Sleepy Hollow', 'NY', '00437', 'headless.horseman@irving.org', 'M'); 
-- Unemployed person in missing-two list for jobs 55501, 55503, 66606, and 66602. 
INSERT INTO Person (person_id, first_name, middle_name, last_name, p_street_no, p_street_name, p_unit_no, p_city, p_state, p_zip, email, gender) VALUES 
	('111220005', 'Lucinda', 'Eva', 'Williams', '633', 'Gravel Rd', 'N/A', 
		'Lake Charles', 'LA', '77919', 'passionate.kisses@car.wheels', 'F');
-- Unemployed person in missing-three list for jobs 55501, 55503, 66606, and 66602. 
INSERT INTO Person (person_id, first_name, middle_name, last_name, p_street_no, p_street_name, p_unit_no, p_city, p_state, p_zip, email, gender) VALUES 
	('111220006', 'Steven', 'Townes', 'Earl', '666', 'Copperhead Rd', '13', 
		'Nashville', 'TN', '67098', 'feelingalright@music.mail', 'M'); 
INSERT INTO Person (person_id, first_name, middle_name, last_name, p_street_no, p_street_name, p_unit_no, p_city, p_state, p_zip, email, gender) VALUES 
	('111220007', 'Jackie', 'Stone', 'Hodges', '9056', 'Wheatstone Rd', 'N/A', 
		'Huntsville', 'AL', '37982', 'hardly.working@some.mail', 'F'); 
INSERT INTO Person (person_id, first_name, middle_name, last_name, p_street_no, p_street_name, p_unit_no, p_city, p_state, p_zip, email, gender) VALUES 
	('111220008', 'Chris', 'Jake', 'Ruse', '6763', 'Skid Row', '333', 'New Orleans', 
		'LA', '70155', 'up.in.arms@some.mail', 'M'); 
INSERT INTO Person (person_id, first_name, middle_name, last_name, p_street_no, p_street_name, p_unit_no, p_city, p_state, p_zip, email, gender) VALUES 
	('111220009', 'Ignatius', 'James', 'Reily', '3124', 'Palmira St', 'A', 
		'New Orleans', 'LA', '70120', 'lucky.dog@quarter.net', 'M'); 
-- Unemployed person who has every skill and every certificate. 
INSERT INTO Person (person_id, first_name, middle_name, last_name, p_street_no, p_street_name, p_unit_no, p_city, p_state, p_zip, email, gender) VALUES 
	('111220010', 'Ru', 'Paul', 'Charles', '5555', 'Blush St', 'B', 'New York', 
		'NY', '02578', 'lifes.a.drag@liner.eye', 'F'); 
-- Some more folks; the significance of whom I'll decide later. ----------------
INSERT INTO Person (person_id, first_name, middle_name, last_name, p_street_no, p_street_name, p_unit_no, p_city, p_state, p_zip, email, gender) VALUES 
	('111330001', 'Townes', 'Van', 'Zandt', '489', 'Whitlock St', 'J', 'Pineville', 
		'LA', '70124', 'one.more.time@some.mail', 'M'); 
INSERT INTO Person (person_id, first_name, middle_name, last_name, p_street_no, p_street_name, p_unit_no, p_city, p_state, p_zip, email, gender) VALUES 
	('111330002', 'James', 'T', 'Kirk', '1635', 'Park Ave', 'N/A', 'Atlanta', 'GA', 
		'63245', 'where.no.man@enterprise.ss', 'M'); 
INSERT INTO Person (person_id, first_name, middle_name, last_name, p_street_no, p_street_name, p_unit_no, p_city, p_state, p_zip, email, gender) VALUES 
	('111330003', 'Jordan', 'John', 'Catalano', '431', 'Mars Ave', '12', 
		'San Diego', 'CA', '97328', '30seconds2@mars.net', 'M');
INSERT INTO Person (person_id, first_name, middle_name, last_name, p_street_no, p_street_name, p_unit_no, p_city, p_state, p_zip, email, gender) VALUES 
	('111330004', 'Pam', 'Ella', 'Pouvey', '575', 'Milking Shed Lane', 'N/A', 
		'Dairey', 'WI', '59083', 'behind.the@grain.tower', 'F'); 
INSERT INTO Person (person_id, first_name, middle_name, last_name, p_street_no, p_street_name, p_unit_no, p_city, p_state, p_zip, email, gender) VALUES 
	('111330005', 'Cyril', 'Jake', 'Figus', '904', 'Loser Rd', 'E4', 'Atlanta', 
		'GA', '54367', 'keeping.it.countly@responsibility.soc', 'M');
INSERT INTO Person (person_id, first_name, middle_name, last_name, p_street_no, p_street_name, p_unit_no, p_city, p_state, p_zip, email, gender) VALUES 
	('111330006', 'Archibald', 'Ephram', 'Krieger', '1232', 'Elm St', '722', 
		'Weehawken', 'NJ', '00325', 'teddley@un.holy', 'M');
INSERT INTO Person (person_id, first_name, middle_name, last_name, p_street_no, p_street_name, p_unit_no, p_city, p_state, p_zip, email, gender) VALUES 
	('111330007', 'Mallory', 'Whitney', 'Archer', '357', 'Ave A', '532', 'New York', 
		'NY', '01724', 'duchess@true.love', 'F'); 
-- Person who has every certificate, but it is expired. 
INSERT INTO Person (person_id, first_name, middle_name, last_name, p_street_no, p_street_name, p_unit_no, p_city, p_state, p_zip, email, gender) VALUES 
	('111330009', 'Lana', 'Elizabeth', 'Kane', '522', 'Orchid Ave', 'A', 
		'Baton Rouge', 'LA', '70812', 'whaaaaaat@loggins.net', 'F'); 
INSERT INTO Person (person_id, first_name, middle_name, last_name, p_street_no, p_street_name, p_unit_no, p_city, p_state, p_zip, email, gender) VALUES 
	('111330012', 'Velma', 'Marie', 'Harper', '345', 'Watkins Court Rd', 'N/A', 
		'Kenner', 'LA', '70121', 'ihearthatbreathin@mama.org', 'F'); 
-- These last three will have no skills. Necessary for some queries. 
INSERT INTO Person (person_id, first_name, middle_name, last_name, p_street_no, p_street_name, p_unit_no, p_city, p_state, p_zip, email, gender) VALUES 
	('111330010', 'Fluffy', 'Crystal', 'Breaux', '225', 'River Rd', 'N/A', 
		'Metarie', 'LA', '71983', 'oh.no.she@did.not', 'F'); 
INSERT INTO Person (person_id, first_name, middle_name, last_name, p_street_no, p_street_name, p_unit_no, p_city, p_state, p_zip, email, gender) VALUES 
	('111330011', 'Iola', 'May', 'Boylyn', '343', 'Watkins Court Rd', 'N/A', 
		'Kenner', 'LA', '70121', 'feltknickknacks@mama.org', 'F'); 
INSERT INTO Person (person_id, first_name, middle_name, last_name, p_street_no, p_street_name, p_unit_no, p_city, p_state, p_zip, email, gender) VALUES 
	('111330008', 'Sterling', 'Mallory', 'Archer', '136', '105th St', '1221', 
		'New York', 'NY', '01724', 'danger.zone@loggins.net', 'M'); 
	
-- Person with reasonably dense skill set (obviously, me). 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110001', '030'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110001', '038');
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110001', '019'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110001', '020'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110001', '021'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110001', '101'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110001', '102'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110001', '103'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110001', '032'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110001', '903'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110001', '904'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110001', '905'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110001', '908'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110001', '910'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110001', '017'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110001', '018'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110001', '015'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110001', '016'); 
-- Person who has every skill, except those uniquely required for 6602. 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220010', '001'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220010', '002'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220010', '003'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220010', '004'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220010', '005'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220010', '006'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220010', '007'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220010', '008'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220010', '009'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220010', '010'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220010', '011'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220010', '012'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220010', '013'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220010', '014'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220010', '015'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220010', '016'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220010', '017'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220010', '018'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220010', '019'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220010', '020'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220010', '021'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220010', '022'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220010', '023'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220010', '024'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220010', '025'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220010', '026'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220010', '027'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220010', '028'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220010', '029'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220010', '030'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220010', '032'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220010', '033'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220010', '034'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220010', '035'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220010', '036'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220010', '101'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220010', '102'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220010', '103'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220010', '901'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220010', '902'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220010', '903'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220010', '904'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220010', '905'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220010', '908'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220010', '909'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220010', '910'); 
-- Unemployed person in missing-one list for jobs 55501, 55503, 66606, and 66602. 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220004', '007'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220004', '009'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220004', '013'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220004', '023'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220004', '024'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220004', '025'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220004', '026'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220004', '027'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220004', '001'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220004', '012'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220004', '036'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220004', '011'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220004', '037'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220004', '038'); 
-- Unemployed person in missing-two list for jobs 55501, 55503, 66606, and 66602. 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220005', '009'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220005', '013'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220005', '023'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220005', '024'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220005', '025'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220005', '026'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220005', '001'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220005', '012'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220005', '038'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220005', '039'); 
-- Unemployed person in missing-three list for jobs 55501, 55503, 66606, and 66602. 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220006', '007'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220006', '001'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220006', '037'); 
-- Second unemployed person in missing-three list for jobs 55501, 55503, 66606 and 6602. 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220002', '009'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220002', '036'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220002', '011'); 
-- All other persons have a more or less random assortment of skills. 
-- DO NOT TOUCH 111110001, 111220002, 111220004, 111220005, 111220006, 111220010 HERE!
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110002', '902'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110002', '904'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110002', '910'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110002', '103'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110002', '028'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110002', '029'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110002', '015'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110002', '038'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110002', '019'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110002', '020'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110002', '021'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110002', '018'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110002', '032'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110003', '910'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110003', '903'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110003', '908'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110003', '102'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110003', '001'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110003', '032'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110003', '022'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110003', '036'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110003', '035'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110003', '018'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110003', '011'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110003', '037'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110003', '033'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110004', '901'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110004', '902'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110004', '007'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110004', '008'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110004', '009'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110004', '014'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110004', '032'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110004', '010'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110004', '037'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110005', '023'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110005', '024'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110005', '036'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110005', '035'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110005', '032'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110005', '018'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110005', '022'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110005', '021'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110005', '101'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110005', '102'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110005', '103'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110006', '027'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110006', '901'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110006', '011'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110006', '033'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110006', '102'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110006', '012'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110006', '018'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110007', '034'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110007', '017'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110007', '016'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110007', '015'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110007', '038'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110007', '032'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110007', '027'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110007', '019'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110007', '103'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110007', '021'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110007', '101'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110008', '021'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110008', '103'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110008', '015'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110008', '038'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110008', '028'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110008', '029'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110009', '009'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110009', '013'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110009', '014'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110009', '025'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110009', '032'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110009', '001'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110009', '002'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110009', '004'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110009', '012'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110009', '022'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110009', '035'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110009', '036'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110009', '037'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110010', '019'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110010', '020'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110010', '032'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110010', '021'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110010', '015'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110010', '038'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110010', '103'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111110010', '901'); 
--INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220001', '901'); 
--INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220001', '902'); 
--INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220001', '903'); 
--INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220001', '904'); 
--INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220001', '905'); 
--INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220001', '908'); 
--INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220001', '909'); 
--INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220001', '007'); 
--INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220001', '023'); 
--INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220001', '024'); 
--INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220001', '032'); 
--INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220001', '015'); 
--INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220001', '038'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220003', '036'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220003', '035'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220003', '012'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220003', '001'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220003', '018'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220003', '032'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220007', '902'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220007', '903'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220007', '904'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220007', '905'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220007', '007'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220007', '008'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220007', '009'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220007', '010'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220007', '027'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220007', '037'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220007', '102'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220008', '904'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220008', '905'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220008', '910'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220008', '007'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220008', '008'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220008', '009'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220008', '014'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220008', '015'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220008', '016'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220008', '017'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220009', '019'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220009', '020'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220009', '015'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111220009', '032'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111330001', '901'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111330001', '902'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111330001', '903'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111330001', '910'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111330001', '018'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111330002', '901'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111330002', '909'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111330002', '001'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111330002', '012'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111330002', '032'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111330002', '003'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111330003', '025'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111330003', '026'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111330003', '009'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111330003', '022'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111330003', '102'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111330003', '001'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111330003', '015'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111330004', '903'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111330004', '018'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111330004', '023'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111330004', '024'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111330005', '032'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111330005', '019'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111330005', '020'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111330006', '027'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111330006', '009'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111330006', '010'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111330006', '013'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111330006', '026'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111330007', '102'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111330007', '022'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111330007', '036'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111330007', '035'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111330007', '019'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111330007', '020'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111330007', '032'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111330009', '039'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111330009', '015'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111330009', '020'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111330009', '032'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111330012', '903'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111330012', '904'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111330012', '901'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111330012', '020'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111330012', '007'); 
INSERT INTO Has_Skill (person_id, ks_code) VALUES ('111330012', '008'); 
--INSERT INTO Has_Skill (person_id, ks_code) VALUES ('', ''); 

--INSERT INTO Works (person_id, job_code, start_date, end_date, pay_rate) VALUES 
--	('', '', TO_DATE('', 'DD-MON-RR'), TO_DATE('', 'DD-MON-RR'), ); 
INSERT INTO Works (person_id, job_code, start_date, end_date, pay_rate) VALUES 
	('111110001', '30001', TO_DATE('05-JAN-11', 'DD-MON-RR'), TO_DATE('20-JUN-11', 'DD-MON-RR'), 23000.00); 
INSERT INTO Works (person_id, job_code, start_date, end_date, pay_rate) VALUES 
	('111110001', '44401', TO_DATE('05-JUL-11', 'DD-MON-RR'), TO_DATE('31-DEC-12', 'DD-MON-RR'), 15.00); 
INSERT INTO Works (person_id, job_code, start_date, end_date, pay_rate) VALUES 
	('111110001', '20001', TO_DATE('05-JAN-13', 'DD-MON-RR'), TO_DATE('31-DEC-13', 'DD-MON-RR'), 22.00);
INSERT INTO Works (person_id, job_code, start_date, end_date, pay_rate) VALUES 
	('111110001', '55502', TO_DATE('05-JAN-16', 'DD-MON-RR'), TO_DATE('31-DEC-16', 'DD-MON-RR'), 25.00); 
INSERT INTO Works (person_id, job_code, start_date, end_date, pay_rate) VALUES 
	('111110001', '99902', TO_DATE('15-AUG-16', 'DD-MON-RR'), null, 7000.00); 
INSERT INTO Works (person_id, job_code, start_date, end_date, pay_rate) VALUES 
	('111110001', '66607', TO_DATE('02-JAN-17', 'DD-MON-RR'), null, 65000.00); 
INSERT INTO Works (person_id, job_code, start_date, end_date, pay_rate) VALUES 
	('111110002', '30001', TO_DATE('15-AUG-10', 'DD-MON-RR'), TO_DATE('20-DEC-10', 'DD-MON-RR'), 25000.00);
INSERT INTO Works (person_id, job_code, start_date, end_date, pay_rate) VALUES 
	('111110002', '10001', TO_DATE('21-JAN-11', 'DD-MON-RR'), TO_DATE('01-SEP-14', 'DD-MON-RR'), 45000.00); 
INSERT INTO Works (person_id, job_code, start_date, end_date, pay_rate) VALUES 
	('111110002', '66604', TO_DATE('03-SEP-14', 'DD-MON-RR'), null, 82000.00); 
INSERT INTO Works (person_id, job_code, start_date, end_date, pay_rate) VALUES 
	('111110003', '55502', TO_DATE('09-SEP-14', 'DD-MON-RR'), TO_DATE('15-MAY-15', 'DD-MON-RR'), 27.00); 
INSERT INTO Works (person_id, job_code, start_date, end_date, pay_rate) VALUES 
	('111110003', '44401', TO_DATE('15-APR-15', 'DD-MON-RR'), TO_DATE('01-JAN-17', 'DD-MON-RR'), 19.00); 
INSERT INTO Works (person_id, job_code, start_date, end_date, pay_rate) VALUES 
	('111110003', '99901', TO_DATE('15-JAN-16', 'DD-MON-RR'), null, 8000.00); 
INSERT INTO Works (person_id, job_code, start_date, end_date, pay_rate) VALUES 
	('111110003', '55502', TO_DATE('05-JAN-17', 'DD-MON-RR'), null, 28.00); 
INSERT INTO Works (person_id, job_code, start_date, end_date, pay_rate) VALUES 
	('111110004', '66601', TO_DATE('29-FEB-16', 'DD-MON-RR'), null, 59500.00); 
INSERT INTO Works (person_id, job_code, start_date, end_date, pay_rate) VALUES 
	('111110005', '55502', TO_DATE('09-JAN-12', 'DD-MON-RR'), TO_DATE('01-SEP-14', 'DD-MON-RR'), 29.00); 
INSERT INTO Works (person_id, job_code, start_date, end_date, pay_rate) VALUES 
	('111110005', '55501', TO_DATE('09-OCT-14', 'DD-MON-RR'), TO_DATE('01-FEB-16', 'DD-MON-RR'), 67000.00); 
INSERT INTO Works (person_id, job_code, start_date, end_date, pay_rate) VALUES 
	('111110006', '55504', TO_DATE('03-MAY-11', 'DD-MON-RR'), TO_DATE('21-JUL-13', 'DD-MON-RR'), 36.00); 
INSERT INTO Works (person_id, job_code, start_date, end_date, pay_rate) VALUES 
	('111110006', '66607', TO_DATE('31-JUL-13', 'DD-MON-RR'), TO_DATE('21-JUL-15', 'DD-MON-RR'), 55750.00); 
INSERT INTO Works (person_id, job_code, start_date, end_date, pay_rate) VALUES 
	('111110007', '55503', TO_DATE('18-MAR-11', 'DD-MON-RR'), TO_DATE('01-JUN-14', 'DD-MON-RR'), 62525.00); 
INSERT INTO Works (person_id, job_code, start_date, end_date, pay_rate) VALUES 
	('111110007', '20001', TO_DATE('01-JUN-14', 'DD-MON-RR'), null, 25.00); 
INSERT INTO Works (person_id, job_code, start_date, end_date, pay_rate) VALUES 
	('111110008', '55504', TO_DATE('12-MAR-09', 'DD-MON-RR'), TO_DATE('01-JUL-11', 'DD-MON-RR'), 25.75); 
INSERT INTO Works (person_id, job_code, start_date, end_date, pay_rate) VALUES 
	('111110008', '66601', TO_DATE('12-JUL-11', 'DD-MON-RR'), TO_DATE('14-FEB-12', 'DD-MON-RR'), 49025.75); 
INSERT INTO Works (person_id, job_code, start_date, end_date, pay_rate) VALUES 
	('111110009', '66601', TO_DATE('23-OCT-08', 'DD-MON-RR'), TO_DATE('12-JUL-11', 'DD-MON-RR'), 45525.00); 
INSERT INTO Works (person_id, job_code, start_date, end_date, pay_rate) VALUES 
	('111110009', '66604', TO_DATE('12-NOV-11', 'DD-MON-RR'), TO_DATE('13-APR-12', 'DD-MON-RR'), 52500.00); 
INSERT INTO Works (person_id, job_code, start_date, end_date, pay_rate) VALUES 
	('111110009', '66605', TO_DATE('13-APR-12', 'DD-MON-RR'), TO_DATE('13-APR-14', 'DD-MON-RR'), 55200.00); 
INSERT INTO Works (person_id, job_code, start_date, end_date, pay_rate) VALUES 
	('111110010', '99901', TO_DATE('21-JAN-12', 'DD-MON-RR'), TO_DATE('15-DEC-13', 'DD-MON-RR'), 5575.00); 
INSERT INTO Works (person_id, job_code, start_date, end_date, pay_rate) VALUES 
	('111110010', '66605', TO_DATE('21-JUL-14', 'DD-MON-RR'), TO_DATE('01-JAN-17', 'DD-MON-RR'), 57500.00); 

INSERT INTO Works (person_id, job_code, start_date, end_date, pay_rate) VALUES 
	('111220001', '20001', TO_DATE('05-Jan-10', 'DD-MON-RR'), TO_DATE('20-DEC-11', 'DD-MON-RR'), 12.95);
INSERT INTO Works (person_id, job_code, start_date, end_date, pay_rate) VALUES 
	('111220001', '30001', TO_DATE('05-Jan-12', 'DD-MON-RR'), TO_DATE('20-JUN-13', 'DD-MON-RR'), 26000.00);
INSERT INTO Works (person_id, job_code, start_date, end_date, pay_rate) VALUES 
	('111220005', '30001', TO_DATE('15-AUG-13', 'DD-MON-RR'), TO_DATE('20-JUN-15', 'DD-MON-RR'), 28000.00); 
INSERT INTO Works (person_id, job_code, start_date, end_date, pay_rate) VALUES 
	('111220006', '66601', TO_DATE('06-MAY-12', 'DD-MON-RR'), TO_DATE('03-FEB-14', 'DD-MON-RR'), 57000.00); 
INSERT INTO Works (person_id, job_code, start_date, end_date, pay_rate) VALUES 
	('111220006', '66602', TO_DATE('01-DEC-15', 'DD-MON-RR'), TO_DATE('01-NOV-16', 'DD-MON-RR'), 55500.00); 
INSERT INTO Works (person_id, job_code, start_date, end_date, pay_rate) VALUES 
	('111220009', '66606', TO_DATE('15-MAR-13', 'DD-MON-RR'), TO_DATE('12-JAN-15', 'DD-MON-RR'), 82500.00); 
INSERT INTO Works (person_id, job_code, start_date, end_date, pay_rate) VALUES 
	('111220009', '55504', TO_DATE('15-JAN-15', 'DD-MON-RR'), TO_DATE('08-NOV-16', 'DD-MON-RR'), 32.50); 
INSERT INTO Works (person_id, job_code, start_date, end_date, pay_rate) VALUES 
	('111220010', '66601', TO_DATE('15-MAR-14', 'DD-MON-RR'), TO_DATE('12-JAN-16', 'DD-MON-RR'), 62000.00); 
INSERT INTO Works (person_id, job_code, start_date, end_date, pay_rate) VALUES 
	('111220010', '66607', TO_DATE('15-JAN-16', 'DD-MON-RR'), TO_DATE('21-OCT-16', 'DD-MON-RR'), 64375.00); 

INSERT INTO Works (person_id, job_code, start_date, end_date, pay_rate) VALUES 
	('111330002', '66604', TO_DATE('12-JUN-12', 'DD-MON-RR'), TO_DATE('31-AUG-14', 'DD-MON-RR'), 82000.00); 
INSERT INTO Works (person_id, job_code, start_date, end_date, pay_rate) VALUES 
	('111330002', '10001', TO_DATE('15-OCT-14', 'DD-MON-RR'), null, 65000.00); 
INSERT INTO Works (person_id, job_code, start_date, end_date, pay_rate) VALUES 
	('111330004', '44401', TO_DATE('15-JAN-14', 'DD-MON-RR'), TO_DATE('01-MAR-15', 'DD-MON-RR'), 17.00); 
INSERT INTO Works (person_id, job_code, start_date, end_date, pay_rate) VALUES 
	('111330006', '66602', TO_DATE('21-MAR-11', 'DD-MON-RR'), TO_DATE('18-NOV-15', 'DD-MON-RR'), 61750.00); 
INSERT INTO Works (person_id, job_code, start_date, end_date, pay_rate) VALUES 
	('111330006', '99901', TO_DATE('15-JAN-14', 'DD-MON-RR'), TO_DATE('20-DEC-15', 'DD-MON-RR'), 8000.00); 
INSERT INTO Works (person_id, job_code, start_date, end_date, pay_rate) VALUES 
	('111330007', '44401', TO_DATE('03-JAN-17', 'DD-MON-RR'), null, 18.25); 

	
INSERT INTO Has_Certificate (person_id, certificate_code, expiration_date) VALUES ('111110001', '110014', TO_DATE('31-DEC-2015', 'DD-MON-RR')); 
INSERT INTO Has_Certificate (person_id, certificate_code, expiration_date) VALUES ('111110001', '110015', TO_DATE('01-MAY-2017', 'DD-MON-RR')); 
INSERT INTO Has_Certificate (person_id, certificate_code, expiration_date) VALUES ('111110001', '110016', TO_DATE('01-MAY-2019', 'DD-MON-RR')); 
-- Person who has every certificate, unexpired. 
INSERT INTO Has_Certificate (person_id, certificate_code, expiration_date) VALUES ('111220010', '110005', TO_DATE('01-MAY-2019', 'DD-MON-RR')); 
INSERT INTO Has_Certificate (person_id, certificate_code, expiration_date) VALUES ('111220010', '110006', TO_DATE('01-MAY-2019', 'DD-MON-RR')); 
INSERT INTO Has_Certificate (person_id, certificate_code, expiration_date) VALUES ('111220010', '110007', TO_DATE('01-MAY-2019', 'DD-MON-RR')); 
INSERT INTO Has_Certificate (person_id, certificate_code, expiration_date) VALUES ('111220010', '110008', TO_DATE('01-MAY-2019', 'DD-MON-RR')); 
INSERT INTO Has_Certificate (person_id, certificate_code, expiration_date) VALUES ('111220010', '110009', TO_DATE('01-MAY-2019', 'DD-MON-RR')); 
INSERT INTO Has_Certificate (person_id, certificate_code, expiration_date) VALUES ('111220010', '110010', TO_DATE('01-MAY-2019', 'DD-MON-RR')); 
INSERT INTO Has_Certificate (person_id, certificate_code, expiration_date) VALUES ('111220010', '110011', TO_DATE('01-MAY-2019', 'DD-MON-RR')); 
INSERT INTO Has_Certificate (person_id, certificate_code, expiration_date) VALUES ('111220010', '110012', TO_DATE('01-MAY-2019', 'DD-MON-RR')); 
INSERT INTO Has_Certificate (person_id, certificate_code, expiration_date) VALUES ('111220010', '110013', TO_DATE('01-MAY-2019', 'DD-MON-RR')); 
INSERT INTO Has_Certificate (person_id, certificate_code, expiration_date) VALUES ('111220010', '110014', TO_DATE('01-MAY-2019', 'DD-MON-RR')); 
INSERT INTO Has_Certificate (person_id, certificate_code, expiration_date) VALUES ('111220010', '110015', TO_DATE('01-MAY-2019', 'DD-MON-RR')); 
INSERT INTO Has_Certificate (person_id, certificate_code, expiration_date) VALUES ('111220010', '110016', TO_DATE('01-MAY-2019', 'DD-MON-RR')); 
-- Person who has every certificate, but they are all expired. 
INSERT INTO Has_Certificate (person_id, certificate_code, expiration_date) VALUES ('111330009', '110005', TO_DATE('01-MAY-2011', 'DD-MON-RR')); 
INSERT INTO Has_Certificate (person_id, certificate_code, expiration_date) VALUES ('111330009', '110006', TO_DATE('01-MAY-2011', 'DD-MON-RR')); 
INSERT INTO Has_Certificate (person_id, certificate_code, expiration_date) VALUES ('111330009', '110007', TO_DATE('01-MAY-2011', 'DD-MON-RR')); 
INSERT INTO Has_Certificate (person_id, certificate_code, expiration_date) VALUES ('111330009', '110008', TO_DATE('01-MAY-2011', 'DD-MON-RR')); 
INSERT INTO Has_Certificate (person_id, certificate_code, expiration_date) VALUES ('111330009', '110009', TO_DATE('01-MAY-2011', 'DD-MON-RR')); 
INSERT INTO Has_Certificate (person_id, certificate_code, expiration_date) VALUES ('111330009', '110010', TO_DATE('01-MAY-2011', 'DD-MON-RR')); 
INSERT INTO Has_Certificate (person_id, certificate_code, expiration_date) VALUES ('111330009', '110011', TO_DATE('01-MAY-2011', 'DD-MON-RR')); 
INSERT INTO Has_Certificate (person_id, certificate_code, expiration_date) VALUES ('111330009', '110012', TO_DATE('01-MAY-2011', 'DD-MON-RR')); 
INSERT INTO Has_Certificate (person_id, certificate_code, expiration_date) VALUES ('111330009', '110013', TO_DATE('01-MAY-2011', 'DD-MON-RR')); 
INSERT INTO Has_Certificate (person_id, certificate_code, expiration_date) VALUES ('111330009', '110014', TO_DATE('01-MAY-2011', 'DD-MON-RR')); 
INSERT INTO Has_Certificate (person_id, certificate_code, expiration_date) VALUES ('111330009', '110015', TO_DATE('01-MAY-2011', 'DD-MON-RR')); 
INSERT INTO Has_Certificate (person_id, certificate_code, expiration_date) VALUES ('111330009', '110016', TO_DATE('01-MAY-2011', 'DD-MON-RR')); 
	
INSERT INTO Has_Certificate (person_id, certificate_code, expiration_date) VALUES ('111110006', '110008', TO_DATE('01-MAY-2019', 'DD-MON-RR')); 

	
--INSERT INTO Takes (person_id, course_code, section_no, section_year, grade) VALUES 
--	(); 

-- Commit changes so that other running programs can query data. 
COMMIT; 
