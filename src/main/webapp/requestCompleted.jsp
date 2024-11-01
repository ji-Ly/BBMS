<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.hly.utils.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@include file="header.html"%>
<html>
<head>
<style>
#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 95%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}
</style>
</head>
<body>
<br>
<center>
<table id="customers">
<tr><th>Name</th><th>Moblie Number</th><th>Email</th><th>Blood Group</th></tr>
<tr>
<% try{
	Connection connection = ConnectionProvider.getConnection();
	Statement statement = connection.createStatement();
	ResultSet rs = statement.executeQuery("select * from bloodrequest where status = 'completed'");
	
	while(rs.next()){
		
%>
<td> <%= rs.getString(1) %> </td>
<td> <%= rs.getString(2) %> </td>
<td> <%= rs.getString(3) %> </td>
<td> <%= rs.getString(4) %> </td>
</tr>
<%
	}
}catch(Exception e){
	e.printStackTrace();
}
%>
</table>

</center>






<br>
<br>
<br>
<br>
<h3><center>All Right Reserved @ BTech Days :: 2020  </center></h3>
</body>
</html>