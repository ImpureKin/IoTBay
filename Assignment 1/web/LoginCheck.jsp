<%
// check if email and password are set in session
String email = request.getParameter("email");
String password = request.getParameter("password");
String sessionEmail = (String) session.getAttribute("registeredEmail");
String sessionPassword = (String) session.getAttribute("registeredPassword");

if (email.equals(sessionEmail) && password.equals(sessionPassword)) {
    response.sendRedirect("Welcome Page.jsp");
}
else {
    response.sendRedirect("LoginFail.jsp");
}
%>