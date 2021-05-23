<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Modification Page</title>
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
  width: 50rem;
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
  width: 40rem;
  max-height: 0;
}
.menu-item__sub a {
  display: block;
  padding: 1rem 1.6rem;
  color: white;
  font-size: 0.9rem;
  position: relative;
  border-bottom: 1px solid var(--light-grey);
  height: 20rem;
}
.menu-item__sub a::before {
  content: '';
  position: absolute;
  left: 0;
  top: 0;
  transform: translatex(-0.4rem);
  transition: 0.3s;
  opacity: 0;
  height: 20rem;
}
.menu-item__sub a:hover::before {
  opacity: 1;
  transform: translatex(0);
}

.menu-item:target .menu-item__sub {
  max-height: 10em;
  padding: 20px;
}



input[type=text], select {
  width: 35rem;
  height: 5rem;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}


</style>

<body style="background-color: #d5dee6;">
	
	<br>
		<br>
			<br>
			
	<center><h2>BarBeerDrinker Project</h2></center> <!-- the usual HTML way -->
	<br>
	<center><h3>Welcome to the Modification Page!</h3></center>
	<br>
		<br>
			<br>

	<center>
	<div class="menu">
	  <li class="menu-item" id="profile">
	    <a href="#profile" class="btn">
	      <i class="far fa-user"></i>
	      inserting new information
	    </a>
	    <div class="menu-item__sub">
	    	<form method="get" action="ProcessMod.jsp">
				<input type="text" name="sqlquery" required placeholder = "Enter your SQL Query...">
				<br><br>
				<input type="submit" value="Insert!">
			</form>
		</div>
	  </li>
	  <li class="menu-item" id="messages">
	    <a href="#messages" class="btn">
	      <i class="far fa-envelope"></i>
	      updating current information
	    </a>
	    <div class="menu-item__sub">
		<form method="get" action="ProcessMod.jsp">
			<input type="text" name="sqlquery" required placeholder = "Enter your SQL Query...">
			<br><br>
			<input type="submit" value="Update!">
	</form>
	</div>
	</center>
	
			<div class="footer">
		  <p>Vighnesh Hemnani - CS336 - Fall 2020</p>
		</div>
</body>
</html>