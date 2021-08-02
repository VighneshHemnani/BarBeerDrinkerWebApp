# BarBeerDrinkerWebApp

## Project description

BarBeerDrinker is a database creation and integration with a webapp project that is a part of a course at Rutgers University, CS336 taught by Professor Tomasz Imieliński. In this project, we are given a large amount of data points on bars, beers and drinkers in a fictional town, to create a **MySQL** database with the appropriate tables and keys, and then link the database to a website that we made in **HTML**, **CSS** and **JSP** to provide insightful dynamic **MySQL** query outputs in the form of tables and graphs and allow a user to update or delete tuples from the database. 

## Database structure

One of the first steps of the project was to decide how the database was structured. In this step, we also had to take into account what the primary keys and foreign keys were. If you are interested in make these same tables in your database, you can have a look at [create_table_statements.pdf](create_table_statements.pdf) that includes the creation table code in MySQL. These will also give you insight on which variables were decided as primary or foriegn keys. 

## How can I view this project?

1. You can view the .mp4 video demonstration of the webapp as well as the database in its entirety by going to the [demo video](demo_video.mp4) OR
2. You can download and run the files as you like:

Software needed:

   - Tomcat (or any preferred alternative)  
   - A browser (Safari, Chrome etc.)  
   - Database Management Tool (like MySQL Workbench)  
   - IDE (like Eclipse)  

   To view this project, you would first need to recreate the tables in the database: using your preferred software, you can use the creation table code in  [create_table_statements.pdf](create_table_statements.pdf) to create the empty tables. Then, you can import the sample data points that were provided to us so that way, you can view and run the code in the webapp. Then, once you have done that, you can download the webapp folder and run the [index.jsp](webapp/index.jsp) in your preferred IDE. Ensure that Tomcat is installed and working correctly, and then you can run the website on whichever browser you prefer.

## What can I find in this repo?

Here's a list of all the files in this repo and what they are:

1. [constraint_checking.pdf](constraint_checking.pdf) - A .pdf file that contains two queries that checks two constraints to ensure the database has been set up correctly.
2. [database.sql](database.sql) - A .sql file that contains all the tuples/data of each bar, beer, drinker and more information that was used in the database for this project. 
3. [demo_video.mp4](demo_video.mp4) - A .mp4 that runs through the entire project briefly: a sitemap of the web application, the database schema, the constraint checking, sample user testing of the dynamic queries' output via table and graphs as well as dynamic updation and deletion (plus error catching). 
4. [webapp](/webapp/) - A simple and clean web application made in Eclipse using HTMl, CSS and Javascript that displays tables and graph of results of dynamic queries from the user. Once set up properly, the web application also allows the user to dynamically update, modify or delete tuples from the database. Here are a few .gifs that help visualize the entire web application and a brief sitemap if you don't want to download and watch the demonstration video. 
5. [create_table_statements.pdf](create_table_statements.pdf) - A .pdf file that allows you to see the CREATE TABLE statements used in the SQL database. This also contains the different variables, primary keys and foriegn keys for each table.
