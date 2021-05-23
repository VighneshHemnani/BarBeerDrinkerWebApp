<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Beer Page</title>
</head>
<link href="https://fonts.googleapis.com/css?family=Montserrat:300,500,700,900" rel="stylesheet">
<style>

.footer {
				   position: fixed;
				   font-family: 'Montserrat';
				   font-size: 20px;
			  	   font-weight: 500;
				   padding: 20px;
				   left: 0;
				   bottom: 0;
				   width: 100%;
				   background-color: #99afc2;
				   color: white;
				   text-align: center;
				}

:root {
  --blue: #3498db;
  --dark-blue: #2980b9;
  --grey: #333;
  --light-grey: #3b3b3b;
}

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Montserrat';
}
.menu {
  width: 20rem;
  border-radius: 0.2rem;
  overflow: hidden;
}
.menu a {
  text-decoration: none;
}

.menu-item {
  list-style: none;
  border-top: 1px solid var(--dark-blue);
  overflow: hidden;
}

.btn {
  display: block;
  padding: 1rem 1.2rem;
  background: var(--blue);
  color: white;
  position: relative;
}
.btn::before {
  content: '';
  position: absolute;
  width: 1rem;
  height: 1rem;
  background: var(--blue);
  left: 1.5rem;
  bottom: -0.5rem;
  transform: rotate(45deg);
}
.btn i {
  margin-right: 1rem;
}

.menu-item__sub {
  overflow: hidden;
  transition: max-height 0.3s;
  max-height: 0;
}
.menu-item__sub a {
  display: block;
  padding: 1rem 1.6rem;
  color: white;
  font-size: 0.9rem;
  position: relative;
  border-bottom: 1px solid var(--light-grey);
}
.menu-item__sub a::before {
  content: '';
  position: absolute;
  left: 0;
  top: 0;
  width: 0.4rem;
  height: 100%;
  transform: translatex(-0.4rem);
  transition: 0.3s;
  opacity: 0;
}
.menu-item__sub a:hover::before {
  opacity: 1;
  transform: translatex(0);
}

.menu-item:target .menu-item__sub {
  max-height: 10em;
  padding: 20px;
}


</style>

<body style="background-color: #d5dee6;">

	<br>
		<br>
			<br>
			
	<center><h2>BarBeerDrinker Project</h2></center> <!-- the usual HTML way -->
	<br>
	<center><h3>Welcome to the Beer Page!</h3></center>
	<br>
		<br>
			<br>
	<center>

	(a) Find top 5 bars where this beer sells the most
	
	    	<form method="get" action="3a_Top5Bars.jsp">
	    		<br><br>
				<input type="text" name="selected_beer" required placeholder = "Enter a beer">
				<br><br>
				<input type="submit" value="Search!">
			</form>
	
	<br><br>
	
	(b) Find all drinkers who are the biggest consumers of a given beer
	  
			<form method="get" action="3b_BiggestDrinkers.jsp">   
				<br><br>
				<input type="text" name="selected_beer" required placeholder = "Enter a beer">
				<br><br>
				<input type="submit" value="Search!">
			</form>
	
	<br><br>
	
	(c) Find a graph of the time distribution of when this beer sells the most in a day (in terms hours)
	  
			<form method="get" action="3c_TimeDist.jsp">
				<br><br>
				<input type="text" name="selected_beer" required placeholder = "Enter a beer">
				<br><br>
				<input type="submit" value="Search!">
			</form>
		
	</center>

	<div class="footer">
	  <p>Vighnesh Hemnani - CS336 - Fall 2020</p>
	</div>

</body>
</html>