<!DOCTYPE html>
<html lang="en">
<head>
 <link rel="stylesheet" href="style.css" type="text/css" media="screen">
<style>
input[type="text"], input[type="password"], input[type="submit"]
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
</style>
</head>
<body>
<div class="header">
  <a href="#default" class="logo"><img class="logo" src="Logo1.png"></a>
  <div class="header-right">
    <a href="index.jsp">Home</a>
    <a class="active" href="adminLogin.jsp">Admin Login</a>
  </div>
</div>
<body>
<div class="container">
<br>
	<br>
	<form action="adminLoginAction.jsp" method="post">
	<div class="form-groups"></div>
	<%
	String msg = request.getParameter("msg");
	if("invalid".equals(msg)) {
		%>
		<center><font color="red" sỉz="5">Invalid Username/Password</font></center>
		<%
	}
	
	%>
	
	<center><h2>User Name</h2></center>
	<input type="text" name="username" placeholder="User Name" requrired>
	
	<center><h2>Password</h2></center>
	<input type="text" name="password" placeholder="Password" requrired>
	
	<center><button class="button">Submit</button></center>
	</form>
	
	
	
	
	
</div>
<br>
<br>
<br>
<br>
<h3><center>All Right Reserved @ hLy Love You Guys :: 2024  </center></h3>
</body>
</html>
