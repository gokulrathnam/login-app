<html>
<head>
<title>Registration Page</title>
<style>
body {
	text-align: center;
}

.login-menu {
	display: inline-block;
	text-align: left;
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	background-color: #f9f9f9;
}

.login-menu input[type="text"], .login-menu input[type="password"],
	.login-menu input[type="password1"] {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.login-menu input[type="submit"] {
	width: 100%;
	padding: 10px;
	border: none;
	border-radius: 4px;
	background-color: #4CAF50;
	color: white;
	cursor: pointer;
}
</style>
</head>
<script language="javaScript">
	function fnSubmit() {
		var usr = document.forms[0].username.value;
		var pwd = document.forms[0].password.value;
		var pwd1 = document.forms[0].password1.value;
		if (usr==""||usr.length<4) {
			alert("User Name Should Enter More than Five Character");
			document.forms[0].method = "post";
			document.forms[0].action = "Register.jsp";
			document.forms[0].submit();
		} else if (pwd != pwd1) {
			alert("Password Doesn't Match.Please Enter Valid Password");
			document.forms[0].method = "post";
			document.forms[0].action = "Register.jsp";
			document.forms[0].submit();
		}
		else if(pwd==""||pwd1==""){
			alert("Enter Password");
			document.forms[0].method = "post";
			document.forms[0].action = "Register.jsp";
			document.forms[0].submit();
		}
		else {
			document.forms[0].method = "post";
			document.forms[0].action = "Register_Enter.jsp";
			document.forms[0].submit();
		}
	}
	function fnCancel() {
		document.forms[0].method = "post";
		document.forms[0].action = "../HTML/Login.html";
		document.forms[0].submit();
	}
</script>
<body>
	<div class="login-menu">
		<h1>Registration</h1>
		<form method="post" action="Register_Enter.jsp">
			<label for="username">Username:</label> <input type="text"
				id="username" name="username" placeholder="Enter your username">
			<label for="password">Password:</label> <input type="password"
				id="password" name="password" placeholder="Enter your password">
			<label for="password">Re-EnterPassword:</label> <input
				type="password" id="password1" name="password1"
				placeholder="Enter your password"> <input type="button"
				value="Register" onclick="fnSubmit()"> <input type="button"
				value="Cancel" onclick="fnCancel()">
		</form>
</body>
</html>