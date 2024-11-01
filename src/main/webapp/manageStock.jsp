<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>	
<%@page import="com.hly.utils.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@include file="header.html"%>
<html>
<head>
<link rel="stylesheet" href="style.css" type="text/css" media="screen">
<style>
input[type="text"], input[type="password"], input[type="submit"],select
{
    border: none;
    background:silver;
    height: 50px;
    font-size: 16px;
	margin-left:35%;
	padding:15px;
	width:33%;	
	border-radius: 25px;
}

#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 55%;
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
<% 
String msg = request.getParameter("msg");
if("valid".equals(msg)) {
	%> <center><font color="red" size="5">Updated Successfully</font></center> <%
}
if("invalid".equals(msg)) {
	%> <center><font color="red" size="5">Something Wrong. Try Again</font></center> <%
}
%>

<div class="form-group">
<form action="manageStockAction.jsp">
<center><h2>Select Blood Group</h2></center>
<select name="bloodgroup" required>
<option value="A+">A+</option>
<option value="A-">A-</option>
<option value="B+">B+</option>
<option value="B-">B-</option>
<option value="O+">O+</option>
<option value="O-">O-</option>
<option value="AB+">AB+</option>
<option value="AB-">AB-</option>
</select>

<center><h2>Select Increase/Decrease</h2></center>
<select name="incdec" required>
<option value="inc">Increase</option>
<option value="dec">Decrease</option>
</select>

<center><h2>Units</h2></center>
<input type="text" name="units" placeholder="Enter units" required>
<center><button type="submit" class="button">Save</button></center>
</form>
</div>
<br>

<center>
<table id="customers">
<tr>
<th>Blood Group</th>
<th>Units</th>
</tr>
<tr>
<% 
try{
	Connection connection = ConnectionProvider.getConnection();
	Statement statement = connection.createStatement();
	ResultSet rs = statement.executeQuery("select * from stock");
	
	while(rs.next()) {
		
%>
<td> <%= rs.getString(1) %> </td>
<td> <%= rs.getString(2) %> </td>

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
<h3><center>All Right Reserved @ hLY for Giving :: 2024  </center></h3>
</body>
</html>