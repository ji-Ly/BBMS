<%@page import="jakarta.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="com.hly.utils.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<% 

// lấy dữ liệu tuef form về sau đó thêm lên database
String name = request.getParameter("name");
String mobilenumber = request.getParameter("mobilenumber");
String email = request.getParameter("email");
String bloodgroup = request.getParameter("bloodgroup");
String status = "pending";

try{
	
	Connection connection = ConnectionProvider.getConnection();
	PreparedStatement preparedStatement = connection.prepareStatement("insert into bloodrequest values(?, ?, ?, ?, ?)");
	preparedStatement.setString(1, name);
	preparedStatement.setString(2, mobilenumber);
	preparedStatement.setString(3, email);
	preparedStatement.setString(4, bloodgroup);
	preparedStatement.setString(5, status);
	
	preparedStatement.executeUpdate();
	response.sendRedirect("index.jsp?msg=valid");
}catch(Exception e) {
	response.sendRedirect("index.jsp?msg=invalid");
}


%>