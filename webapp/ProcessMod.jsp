<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style = "font-family: sans-serif;">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link href="https://fonts.googleapis.com/css?family=Montserrat:300,500,700,900" rel="stylesheet">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Query</title>
		
	</head>
	
	<style>
	
				* {
			  -webkit-box-sizing: border-box;
			          box-sizing: border-box;
			}
			
			body {
			  padding: 0;
			  margin: 0;
			  background-color: #ffdede;
			}
			
			#notfound {
			  position: relative;
			  height: 100vh;
			  background: white;
			}
			
			#notfound .notfound {
			  position: absolute;
			  left: 50%;
			  top: 40%;
			  -webkit-transform: translate(-50%, -50%);
			      -ms-transform: translate(-50%, -50%);
			          transform: translate(-50%, -50%);
			}
			
			.notfound {
			  max-width: 900px;
			  width: 100%;
			  
			  text-align: center;
			}
			
			.notfound .notfound-404 {
			  position: relative;
			  height: 180px;
			  margin-bottom: 20px;
			  z-index: -1;
			}
			
			.notfound .notfound-404 h1 {
			  font-family: 'Montserrat', sans-serif;
			  position: absolute;
			  left: 50%;
			  top: 10%;
			  -webkit-transform: translate(-50% , -50%);
			      -ms-transform: translate(-50% , -50%);
			          transform: translate(-50% , -50%);
			  font-size: 200px;
			  font-weight: 900;
			  margin-top: 0px;
			  margin-bottom: 0px;
			  color: #030005;
			  text-transform: uppercase;
			  text-shadow: -1px -1px 0px #8400ff, 1px 1px 0px #ff005a;
			  letter-spacing: 0px;
			}
			
			
			.notfound .notfound-404 h2 {
			  font-family: 'Montserrat', sans-serif;
			  position: absolute;
			  left: 0;
			  right: 0;
			  top: 110px;
			  font-size: 42px;
			  font-weight: 700;
			  color: black;
			  text-transform: uppercase;
			  text-shadow: 0px 2px 0px #8400ff;
			  letter-spacing: 13px;
			  margin: 0;
			}
			
			.notfound .notfound-404 h3 {
			  font-family: 'Montserrat', sans-serif;
			  position: absolute;
			  left: 0;
			  right: 0;
			  top: 300px;
			  font-size: 20px;
			  font-weight: 500;
			  color: black;
			  margin: 0;
			}
			
			.notfound .notfound-404 h4 {
			  font-family: 'Montserrat', sans-serif;
			  position: absolute;
			  left: 0;
			  right: 0;
			  top: 300px;
			  font-size: 20px;
			  font-weight: 300;
			  color: black;
			  margin: 0;
			}
			
			.notfound a {
			  font-family: 'Montserrat', sans-serif;
			  display: inline-block;
			  text-transform: uppercase;
			  color: #ff005a;
			  text-decoration: none;
			  border: 2px solid;
			  background: transparent;
			  padding: 10px 40px;
			  font-size: 14px;
			  font-weight: 700;
			  -webkit-transition: 0.2s all;
			  transition: 0.2s all;
			}
			
			.notfound a:hover {
			  color: #8400ff;
			}
			
			@media only screen and (max-width: 767px) {
			    .notfound .notfound-404 h2 {
			        font-size: 24px;
			    }
			}
			
			@media only screen and (max-width: 480px) {
			  .notfound .notfound-404 h1 {
			      font-size: 182px;
			  }
			}
				
	
		
	</style>
	
	<body>
	
	
	<div id="notfound">
		<div class="notfound">
			<div class="notfound-404">
			
				
			<% try {
		
				String url = "jdbc:mysql://localhost:3306/testProject";
				
				Class.forName("com.mysql.jdbc.Driver").newInstance();
	
				//Get the database connection
				ApplicationDB db = new ApplicationDB();	
				Connection con = DriverManager.getConnection(url, "root", "Strongpassword123");		
	
				//Create a SQL statement
				Statement stmt = con.createStatement();
				//Get the selected radio button from the index.jsp
				String temp = request.getParameter("sqlquery"); //entity = "joe biden"
				String userquery = "";
				userquery = ""+temp+"";
			
				//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
				Boolean ret = stmt.execute(userquery);

	
				out.println("<h1>");
				out.println("yay");
				out.println("</h1>");
				out.println("<h3>");
				out.println("Query was a success! Now go enjoy a beer :D");
				out.println("</h3>");

			
				} catch (Exception e) {
					
				String error = e.getMessage();

				if (error.contains("foreign key") == true){
					out.println("<h1>");
					out.println("oops");
					out.println("</h1>");
					out.println("<h2>");
					out.println("foreign key violation");
					out.println("</h2>");
					out.println("<h3>");
					out.println("There seems to be an error in your SQL query: you have violated a foreign key constraint. Please ensure you update a parent table first, then child table. Please review your query.");
					out.println("<br>");
					out.println("In specifics, JDBC returned an error: ");
					out.println("</h3>");
					out.println("<h4>");
					out.println("<br>");
					out.println("<br>");
					out.println("<br>");
					out.println("<br>");
					out.println("<br>");
					out.println(e);
					out.println("</h4>");
					
				}
				else if (error.contains("syntax") == true){
					out.println("<h1>");
					out.println("oops");
					out.println("</h1>");
					out.println("<h2>");
					out.println("syntax error");
					out.println("</h2>");
					out.println("<h3>");
					out.println("There seems to be a syntax error in your SQL query: Please review your query.");
					out.println("<br>");
					out.println("In specifics, JDBC returned an error: ");
					out.println("</h3>");
					out.println("<h4>");
					out.println("<br>");
					out.println("<br>");
					out.println("<br>");
					out.println("<br>");
					out.println("<br>");
					out.println(e);
					out.println("</h4>");
				}
				else if (error.contains("PRIMARY") == true){
					out.println("<h1>");
					out.println("oops");
					out.println("</h1>");
					out.println("<h2>");
					out.println("primary key violation");
					out.println("</h2>");
					out.println("<h3>");
					out.println("There seems to be an error in your SQL query: you have violated a primary key constraint. Please ensure you don't have any duplicate tuples and review your query.");
					out.println("<br>");
					out.println("In specifics, JDBC returned an error: ");
					out.println("</h3>");
					out.println("<h4>");
					out.println("<br>");
					out.println("<br>");
					out.println("<br>");
					out.println("<br>");
					out.println("<br>");
					out.println(e);
					out.println("</h4>");
				}
				else{
					out.println("<h1>");
					out.println("oops");
					out.println("</h1>");
					out.println("<h2>");
					out.println("sql error");
					out.println("</h2>");
					out.println("<h3>");
					out.println("There seems to be an error in your SQL query/database. Please review your query.");
					out.println("<br>");
					out.println("In specifics, JDBC returned an error: ");
					out.println("</h3>");
					out.println("<h4>");
					out.println("<br>");
					out.println("<br>");
					out.println("<br>");
					out.println("<br>");
					out.println("<br>");
					out.println(e);
					out.println("</h4>");
				}
				
				
				}
			
			%>

			</div>
			<a href="ModPage.jsp">back to modify</a>
		</div>
	</div>


	</body>
</html>