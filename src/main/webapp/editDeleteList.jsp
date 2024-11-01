<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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

<%
String msg = request.getParameter("msg");
if("valid".equals(msg)) {
	%>
	<center><font color="red" size="5">Updated Donor Successfully</font></center> 
	<%
}
%>

<br>
<% 
if("invalid".equals(msg)) {
	%>
	<center><font color="red" size="5">Something Went Wrong. Try Again</font></center> 
	<%
}
%>

<%
if("deleted".equals(msg)) {
	%>
	<center><font color="red" size="5">Deleted Donor Successfully</font></center> 
	<%
}
%>

<center>
<table id="customers">
<tr>
<th>ID</th>
<th>Name</th>
<th>Father</th>
<th>Mother</th>
<th>Mobile Number</th>
<th>Gender</th>
<th>Email</th>
<th>Blood Group</th>
<th>Address</th>
</tr>
<tr>
<% 
try{
	Connection connection = ConnectionProvider.getConnection();
	PreparedStatement preparedStatement = connection.prepareStatement("select * from donor");
	ResultSet rs = preparedStatement.executeQuery();
	
	while(rs.next()) {
		
%>
<td>
<%= rs.getInt(1) %> 
</td>
<td>
<%= rs.getString(2) %> 
</td>
<td>
<%= rs.getString(3) %> 
</td>
<td>
<%= rs.getString(4) %> 
</td>
<td>
<%= rs.getString(5) %> 
</td>
<td>
<%= rs.getString(6) %> 
</td>
<td>
<%= rs.getString(7) %> 
</td>
<td>
<%= rs.getString(8) %> 
</td>
<td>
<%= rs.getString(9) %> 
</td>
<td>
<a href="updateDonor.jsp?id=<%= rs.getString(1) %>">Edit</a> 
</td>
<td>
<a href="deleteDonor.jsp?id=<%= rs.getString(1) %>">Delete</a> 
</td>
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
<h3><center>All Right Reserved @ hLy allways Me :: 2024  </center></h3>
</body>
</html>