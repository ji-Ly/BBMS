<%@page import="com.hly.utils.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<% 
String id = request.getParameter("id");
String name = request.getParameter("name");
String father = request.getParameter("father");
String mother = request.getParameter("mother");
String mobilenumber = request.getParameter("mobilenumber");
String gender = request.getParameter("gender");
String email = request.getParameter("email");
String bloodgroup = request.getParameter("bloodgroup");
String address = request.getParameter("address");

try{
	Connection connection = ConnectionProvider.getConnection();
	PreparedStatement preparedStatement = connection.prepareStatement("insert into donor values(?, ?, ?, ?, ?, ?, ?, ?, ?)");
	preparedStatement.setString(1, id);
	preparedStatement.setString(2, name);
	preparedStatement.setString(3, father);
	preparedStatement.setString(4, mother);
	preparedStatement.setString(5, mobilenumber);
	preparedStatement.setString(6, gender);
	preparedStatement.setString(7, email);
	preparedStatement.setString(8, bloodgroup);
	preparedStatement.setString(9, address);
	
	preparedStatement.executeUpdate();
	
	response.sendRedirect("addNewDonor.jsp?msg=valid");
}catch(Exception e) {
	response.sendRedirect("addNewDonor.jsp?msg=invalid");
}



%>