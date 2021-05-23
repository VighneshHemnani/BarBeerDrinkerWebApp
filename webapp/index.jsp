<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Home Page - BarBeerDrinkerProject</title>
	</head>
	
	
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
	
	<link href='https://fonts.googleapis.com/css2?family=Poppins&display=swap' rel='stylesheet' type='text/css'>
	
	<style>
	
				.header {
				  padding: 80px;
				  text-align: center;
				  background: #99afc2;
				  color: black;
				}
				.footer {
				   position: fixed;
				   font-family: 'Poppins';
				   left: 0;
				   bottom: 0;
				   width: 100%;
				   background-color: #99afc2;
				   color: white;
				   text-align: center;
				}
				.btn {
				border: none;
				font-family: 'Poppins';
				font-size: inherit;
				color: inherit;
				background: none;
				cursor: pointer;
				padding: 25px 80px;
				display: inline-block;
				margin: 15px 30px;
				letter-spacing: 1px;
				font-weight: 300;
				outline: none;
				position: relative;
				-webkit-transition: all 0.3s;
				-moz-transition: all 0.3s;
				transition: all 0.3s;
			}
			
			.btn:after {
				content: '';
				position: absolute;
				z-index: -1;
				-webkit-transition: all 0.3s;
				-moz-transition: all 0.3s;
				transition: all 0.3s;
			}
			
		
			.btn:before {
				font-family: 'FontAwesome';
				speak: none;
				font-style: normal;
				font-weight: normal;
				font-variant: normal;
				text-transform: none;
				line-height: 1;
				position: relative;
				-webkit-font-smoothing: antialiased;
			}
			
			
		
			.btn-sep {
				padding: 25px 60px 25px 110px;
			}
			
			.btn-sep:before {
				background: rgba(0,0,0,0.15);
			}
			
			.btn-4 {
				background: #34495e;
				color: #fff;
			}
			
			.btn-4:hover {
				background: #2c3e50;
			}
			
			.btn-4:active {
				background: #2c3e50;
				top: 2px;
			}
			
			.btn-4:before {
				position: absolute;
				height: 100%;
				left: 0;
				top: 0;
				line-height: 3;
				font-size: 140%;
				width: 60px;
			}
			
			.icon-drinker:before {
				content: "\f007";
			}
			
			.icon-bar:before {
				content: "\f000";
			}
			
			.icon-beer:before {
				content: "\f0fc";
			}
			
			.icon-mod:before {
				content: "\f0ad";
			}
			
			
			.readmeheader{
				font-family: 'Poppins';
			}
		
			
	</style>
	
	<body style="background-color: #d5dee6;">
		
		<div class="header">
	  		<center>
			<table>
				<tr>
						<center><h1 class = readmeheader>BarBeerDrinker Project</h1></center>
				</tr>
				<tr>
					<td><button class="btn btn-4 btn-sep icon-drinker" onclick="location.href='DrinkerPage.jsp'">drinker page</button></td>
					<td><button class ="btn btn-4 btn-sep icon-bar" onclick="location.href='BarPage.jsp'">bar page</button></td>
					<td><button class ="btn btn-4 btn-sep icon-beer" onclick="location.href='BeerPage.jsp'">beer page</button></td>
					<td><button class ="btn btn-4 btn-sep icon-mod" onclick="location.href='ModPage.jsp'">modification page</button></td>
				</tr>
			</table>
			</center>
		</div>
		
		
		
		<br>
		<br>
		<br>
		
		<center><h4 class = readmeheader>readme:</h4></center>
		<center><p class = readmeheader>BarBeerDrinker is a project that is the final project of the CS course, Principle of Information and Data Management. This web application consists of Part 1 and Part 3 of the project. For Part 1 of the project, you will see access to a Drinker, Bar and Beer page in the home page (above), and for Part 3 of the project you will see a Modification Page also in the Navigation page as above. </p></center>
		
		<br>
							  
		<br>
		
		<div class="footer">
		  <p>Vighnesh Hemnani - CS336 - Fall 2020</p>
		</div>
		
	
</body>
</html>