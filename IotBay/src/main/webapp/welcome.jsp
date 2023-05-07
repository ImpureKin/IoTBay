<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Welcome</title>
</head>
<body bgcolor="favcol" </body>
	<h1>Welcome</h1>
	<%
	String tos = request.getParameter("tos");
	if (tos != null && tos.equals("true")) {
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String gender = request.getParameter("gender");
		String favcol = request.getParameter("favcol");
	%>
	<p>Welcome, <%= name %>!</p>
	<p>Your email is: <%= email %></p>
        <p>Your password is: <%= password %></p>
	<p>Your gender is: <%= gender %></p>
	<p>Your favorite color is: <%= favcol %></p>
	<%
		} else {
	%>
		<p>You must agree to the TOS to register. Please <a href="registration.jsp">go back</a> and agree to the TOS.</p>
	<%
		}
	%>
</body>
</html>
