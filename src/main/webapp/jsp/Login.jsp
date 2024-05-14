<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Login Result</title>
</head>
<body>
	<%-- Retrieve the submitted username and password --%>
	<% String username = request.getParameter("username");
       String password = request.getParameter("password");
       System.out.println("username-----> "+username);
       System.out.println("password-----> "+password);
       // Validate the username and password
       if (username.equals("Gokul R") && password.equals("gokul")) {
           // Successful login
    %>
	<h1>Login Successful</h1>
	<p>
		Welcome,
		<%= username %>!
	</p>
	<% } else {
           // Failed login
    %>
	<h1>Login Failed</h1>
	<p>Invalid username or password.</p>
	<% } %>
</body>
</html>