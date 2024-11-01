
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.hly.utils.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%
String mobilenumber = request.getParameter("mobilenumber");
try{
	Connection connection = ConnectionProvider.getConnection();
	PreparedStatement preparedStatement = connection.prepareStatement("delete from bloodrequest where mobilenumber = ?");
	preparedStatement.setString(1, mobilenumber);
	preparedStatement.executeUpdate();
	
	response.sendRedirect("requestForBlood.jsp");
}catch(Exception e) {
	e.printStackTrace();
	response.sendRedirect("requestForBlood.jsp");
}
%>