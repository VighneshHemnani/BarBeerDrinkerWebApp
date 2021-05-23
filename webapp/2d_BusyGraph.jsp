<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<% 
	StringBuilder myData = new StringBuilder();
	String strData = "";
    String chartTitle = "";
    String legend = "";
    
	StringBuilder myData2 = new StringBuilder();
	String strData2 = "";
    String chartTitle2 = "";
    String legend2 = "";

	try{
		//this list will hold the x-axis and y-axis data as a pair
		ArrayList<Map<String,Integer>> list = new ArrayList();
   		Map<String,Integer> map = null;
   		
   		ArrayList<Map<String,Integer>> list2 = new ArrayList();
   		Map<String,Integer> map2 = null;
   		
   		//Get the database connection
   		
   		String url = "jdbc:mysql://localhost:3306/BarBeerDrinkerProject";
			
		Class.forName("com.mysql.jdbc.Driver").newInstance();
	
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = DriverManager.getConnection(url, "root", "Strongpassword123");			

   		//Create a SQL statement
   		Statement stmt = con.createStatement();
   		Statement stmt2 = con.createStatement();
   		
   		String graphType = request.getParameter("graphoption");
   		String entity = request.getParameter("selected_bar");   
   		
   		//Make queries for weekly and monthly data:
   		String query1 = "";
   		query1 = "SELECT HOUR(time) AS 'time', COUNT(bill_id) AS 'numoftrans' FROM BarBeerDrinkerProject.bills t1 WHERE bar = \'"+entity+"\' GROUP BY hour(time) ORDER BY hour(time) ASC;";
   		String query2 = "";
   		query2 = "SELECT day, COUNT(bill_id) AS 'numoftrans' FROM BarBeerDrinkerProject.bills WHERE bar = \'"+entity+"\' GROUP BY day ORDER BY CASE WHEN day = 'Monday' THEN 1 WHEN day = 'Tuesday' THEN 2 WHEN day = 'Wednesday' THEN 3 WHEN day = 'Thursday' THEN 4 WHEN day = 'Friday' THEN 5 WHEN day = 'Saturday' THEN 6 WHEN day = 'Sunday' THEN 7 END ASC;";
		//Run the queries against the database.
   		ResultSet result = stmt.executeQuery(query1);
		ResultSet result2 = stmt2.executeQuery(query2);
		
   		//Process the result1 and result2:
   		while (result.next()) { 
			map=new HashMap<String,Integer>();
			String v = Integer.toString(result.getInt("time"));
		  	map.put(v,result.getInt("numoftrans"));
			list.add(map);
   	    } 
   	    result.close();
   	    
   		while (result2.next()) { 
			map2=new HashMap<String,Integer>();
		  	map2.put(result2.getString("day"),result2.getInt("numoftrans"));
			list2.add(map2);
   	    } 
   	    result2.close();
   	    
   	    //Create a String of graph data of the following form: ["Caravan", 3],["Cabana",2],...
        for(Map<String,Integer> hashmap : list){
        		Iterator it = hashmap.entrySet().iterator();
            	while (it.hasNext()) { 
	           		Map.Entry pair = (Map.Entry)it.next();
	           		String key = pair.getKey().toString().replaceAll("'", "");
	           		myData.append("['"+ key +"',"+ pair.getValue() +"],");
           	}
        }
        strData = myData.substring(0, myData.length()-1); //remove the last comma
        
        //Create the chart title according to what the user selected
     	chartTitle = "Busiest periods of the day in " + entity + " (Most transactions)";
      	legend = "number of transactions";
      	
        for(Map<String,Integer> hashmap2 : list2){
    		Iterator it2 = hashmap2.entrySet().iterator();
        	while (it2.hasNext()) { 
           		Map.Entry pair2 = (Map.Entry)it2.next();
           		String key = pair2.getKey().toString().replaceAll("'", "");
           		myData2.append("['"+ key +"',"+ pair2.getValue() +"],");
       		}
    	}
    	strData2 = myData2.substring(0, myData2.length()-1); //remove the last comma
    
	    //Create the chart title according to what the user selected
	 	chartTitle2 = "Busiest periods of the week in "+entity+" (Most transactions)";
	  	legend2 = "number of transactions";
	}
   		
   	catch(SQLException e)
	{
    		out.println(e);
    }
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Search Query</title>
		<script src="https://code.highcharts.com/highcharts.js"></script>
		<script> 
		
			var data = [<%=strData%>]; //contains the data of the graph in the form: [ ["Caravan", 3],["Cabana",2],...]
			var title = '<%=chartTitle%>';
			var legend = '<%=legend%>'
			//this is an example of other kind of data
			//var data = [["01/22/2016",108],["01/24/2016",45],["01/25/2016",261],["01/26/2016",224],["01/27/2016",307],["01/28/2016",64]];
			var cat = [];
			data.forEach(function(item) {
			  cat.push(item[0]);
			});
			document.addEventListener('DOMContentLoaded', function () {
			var myChart = Highcharts.chart('graphContainer', {
			    chart: {
			        defaultSeriesType: 'column',
			        events: {
			            //load: requestData
			        }
			    },
			    title: {
			        text: title
			    },
			    xAxis: {
			        text: 'xAxis',
			        categories: cat
			    },
			    yAxis: {
			        text: 'yAxis'
			    },
			    series: [{
			        name: legend,
			        data: data
			    }]
			});
			});
			
			var data2 = [<%=strData2%>]; //contains the data of the graph in the form: [ ["Caravan", 3],["Cabana",2],...]
			var title2 = '<%=chartTitle2%>';
			var legend2 = '<%=legend2%>'
			//this is an example of other kind of data
			//var data = [["01/22/2016",108],["01/24/2016",45],["01/25/2016",261],["01/26/2016",224],["01/27/2016",307],["01/28/2016",64]];
			var cat2 = [];
			data2.forEach(function(item) {
			  cat2.push(item[0]);
			});
			document.addEventListener('DOMContentLoaded', function () {
			var myChart2 = Highcharts.chart('graphContainer2', {
			    chart: {
			        defaultSeriesType: 'column',
			        events: {
			            //load: requestData
			        }
			    },
			    title: {
			        text: title2
			    },
			    xAxis: {
			        text: 'xAxis',
			        categories: cat2
			    },
			    yAxis: {
			        text: 'yAxis'
			    },
			    series: [{
			        name: legend2,
			        data: data2
			    }]
			});
			});
		
		</script>
	</head>

	<body>
	<br><br>
	<center>
	<div id="graphContainer" style="width: 500px; height: 400px; margin: 0 auto"></div>
	<br>
	<div id="graphContainer2" style="width: 500px; height: 400px; margin: 0 auto"></div>
	</center>
	
	
</html>