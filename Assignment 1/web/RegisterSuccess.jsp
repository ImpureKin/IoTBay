<% 
// get the user inputs
String email = request.getParameter("email");
String password = request.getParameter("password");
// store the user inputs in session variables
session.setAttribute("registeredEmail", email);
session.setAttribute("registeredPassword", password);
response.sendRedirect("Welcome Page.jsp");
%>