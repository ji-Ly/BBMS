


<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.hly.utils.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<% 
String id = request.getParameter("id");
String name = request.getParameter("name");
String father = request.getParameter("father");
String mother = request.getParameter("mother");
String mobilenumber = request.getParameter("mobilenumber");
String email = request.getParameter("email");
String address = request.getParameter("address");

try{
	Connection connection = ConnectionProvider.getConnection();
	PreparedStatement preparedStatement = connection.prepareStatement("update donor set name = ?, father = ?, mother = ?, mobilenumber = ?, email = ?, address = ?");
	preparedStatement.setString(1, name);
	preparedStatement.setString(2, father);
	preparedStatement.setString(3, mother);
	preparedStatement.setString(4, mobilenumber);
	preparedStatement.setString(5, email);
	preparedStatement.setString(6, address);
	
	preparedStatement.executeUpdate();
	
	response.sendRedirect("editDeleteList.jsp?msg=valid");
}catch(Exception e) {
	e.printStackTrace();
	response.sendRedirect("editDeleteList.jsp?msg=invalid");
}
%>