<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.util.*,com.gokul.*,oracle.jdbc.*"%>
<jsp:useBean id="cgc" class="com.gokul.CommonCredentials" />
<%
    String user_id = request.getParameter("username");
    String passwd = request.getParameter("password");
    String User_id="";
    User_id = cgc.insertUser(user_id, passwd);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Submitting Form</title>
<style>
body {
	text-align: center;
}

.user_id {
	display: inline-block;
	text-align: left;
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	background-color: #f9f9f9;
}
</style>
</head>
<body>
<div class="user_id">
<h1>Registration Successfull</h1>
<td width="24%"><font class="DataFont">UserName:</font>&nbsp;<font color = "red"></font></td>
<td width="28%" ><font class="DataFont"><b><%=User_id%></b></td>
</body>
</html>