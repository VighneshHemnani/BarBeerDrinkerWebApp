<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style = "font-family: sans-serif;">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Bar Page Output</title>
	</head>
	
	<style>
	
			.content-table {
			  border-collapse: collapse;
			  margin: 25px 0;
			  font-size: 0.9em;
			  min-width: 400px;
			  border-radius: 5px 5px 0 0;
			  overflow: hidden;
			  box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
			  background-color: white;
			}
			
			.content-table thead tr {
			  color: #ffffff;
			  text-align: left;
			  font-weight: bold;
			}
			
			.content-table th,
			.content-table td {
			  padding: 12px 15px;
			}
			
			.content-table tbody tr {
			  border-bottom: 1px solid #dddddd;
			}
	
	</style>
	
	<body style="background-color: #d5dee6;">
		<% try {
	
			String url = "jdbc:mysql://localhost:3306/BarBeerDrinkerProject";
			
			Class.forName("com.mysql.jdbc.Driver").newInstance();

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = DriverManager.getConnection(url, "root", "Strongpassword123");		

			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the selected radio button from the index.jsp
			String entity = request.getParameter("selected_bar");
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String str = "SELECT t3.manf as 'manf', CEILING(SUM(t2.quantity)) as 'totalsold' FROM BarBeerDrinkerProject.bills t1, BarBeerDrinkerProject.transactions t2, BarBeerDrinkerProject.beer t3 WHERE t1.bar = \'"+entity+"\' AND t2.bill_id = t1.bill_id AND t2.type = 'beer' AND t2.item = t3.name GROUP BY manf ORDER BY totalsold DESC LIMIT 5";

			ResultSet result = stmt.executeQuery(str);
			
		%>
		
	<!--  Make an HTML table to show the results in: -->
	<table class = "content-table">
		<tr>    
			<td>Beer Manufacturer</td>
			<td>Total sells</td>
		</tr>
			<%while (result.next()) 
				{%>
				<tr>    
					<td><%= result.getString("manf") %></td>
					<td><%= result.getString("totalsold") %></td>
				</tr>
				

			<% }
			//close the connection.
			db.closeConnection(con);
			%>
	</table>

			
		<%} catch (Exception e) {
			out.print(e);
		}%>
	
	</body>
</html>