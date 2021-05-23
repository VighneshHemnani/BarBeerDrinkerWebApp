<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<% 
	StringBuilder myData=new StringBuilder();
	String strData ="";
    String chartTitle="";
    String legend="";

	try{
		//this list will hold the x-axis and y-axis data as a pair
		ArrayList<Map<String,Integer>> list = new ArrayList();
   		Map<String,Integer> map = null;
   		
   		//Get the database connection
   		
   		String url = "jdbc:mysql://localhost:3306/BarBeerDrinkerProject";
			
		Class.forName("com.mysql.jdbc.Driver").newInstance();
	
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = DriverManager.getConnection(url, "root", "Strongpassword123");			

   		//Create a SQL statement
   		Statement stmt = con.createStatement();
   		
   		String graphType = request.getParameter("graphoption");
   		String entity = request.getParameter("selected_beer");   
   		
   		//Make a query
   		String query = "" ;
   		query = "SELECT HOUR(t1.time) AS 'hours', CEILING(SUM(t2.quantity)) AS 'totalsold' FROM BarBeerDrinkerProject.bills t1, BarBeerDrinkerProject.transactions t2 WHERE t2.bill_id = t1.bill_id AND t2.item =\'"+entity+"\' GROUP BY hour(t1.time) ORDER BY hour(t1.time) ASC; ";
   		
		//Run the query against the database.
   		ResultSet result = stmt.executeQuery(query);
   		//Process the result
   		while (result.next()) { 
			map=new HashMap<String,Integer>();
		  	map.put(result.getString("hours"),result.getInt("totalsold"));
			list.add(map);
   	    } 
   	    result.close();
   	    
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
     	chartTitle = "Time distribution of how many "+entity+" beers sold in a day by hours";
      	legend = "beers sold";
  

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
		
		</script>
	</head>
	<body>
	<br><br>
	<center><div id="graphContainer" style="width: 500px; height: 400px; margin: 0 auto"></div></center>
	
</html>