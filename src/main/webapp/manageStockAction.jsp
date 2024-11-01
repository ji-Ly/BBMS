

<%@page import="java.sql.Statement"%>
<%@page import="com.hly.utils.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%
String bloodgroup = request.getParameter("bloodgroup");
String incdec = request.getParameter("incdec");
String units = request.getParameter("units");

try{
	Connection connection = ConnectionProvider.getConnection();
	Statement statement = connection.createStatement();
	
	if(incdec.equals("inc")) {
		statement.executeUpdate("update stock set units = units + '"+units+"' where bloodgroup = '"+bloodgroup+"'");
		response.sendRedirect("manageStock.jsp?msg=valid");
		
	}else{
		statement.executeUpdate("update stock set units = units - '"+units+"' where bloodgroup = '"+bloodgroup+"'");
		response.sendRedirect("manageStock.jsp?msg=valid");
	}
}catch(Exception e) {
	e.printStackTrace();
	response.sendRedirect("manageStock.jsp?msg=invalid");
}
%>