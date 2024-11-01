
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.hly.utils.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<% 
String id = request.getParameter("id");
try{
	Connection connection = ConnectionProvider.getConnection();
	PreparedStatement preparedStatement = connection.prepareStatement("delete from donor where id = '"+id+"'");
	preparedStatement.executeUpdate();
	
	response.sendRedirect("editDeleteList.jsp?msg=deleted");
	
}catch(Exception e){
	e.printStackTrace();
	response.sendRedirect("editDeteleList.jsp?msg=invalid");
}

%>