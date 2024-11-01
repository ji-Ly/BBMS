<%
String username = request.getParameter("username");
String password = request.getParameter("password");


	if("admin".equals(username) && "admin".equals(password)){
		response.sendRedirect("index.jsp");
	}else{
		response.sendRedirect("adminLogin.jsp?msg=invalid");
	}


%>