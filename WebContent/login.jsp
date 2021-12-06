<!DOCTYPE html>
<html>
<head>
<title>Login Screen</title>
<style>
	@font-face{
		font-family: customFont;
		src: url(NikkyouSans-mLKax.ttf);
	}
	h3{
		text-align: center;
		font-family: customFont;
		font-size: 25px;
		padding: 0px;
		text-align: center;
	}
	table, td{
		border: 1px solid #7E8193;
		margin-left: auto;
  		margin-right: auto;
		align-items: center;
	}
	td{
		font-family: sans-serif;
		font-size: 14px;
		text-align: center;
		font-weight: bold;
		height: 25px;
	}
	p{
		font-family:sans-serif;
		font-size: 20px;
		text-align: center;
		font-weight: bold;
	}
	form{
		font-family: sans-serif;
		font-size: 15px;
	}
	input, .input2, button {
		font-family: sans-serif;
		font-size: 16px;
		text-align: center;
		font-weight: bold;
		padding: 4px;
		margin: 2px;
		transition-duration: 0.4s;
		cursor: pointer;
		background: #FCFBF6;
	}
	.input2, button {
		background: #F5CEC5;
	}
	input:hover {
		background-color: #F5CEC5;
	}
	.input2:hover, button:hover{
		background-color: #FAAA96;
	}
	a{
        color: black;
    }
    a:hover{
        color:#FAAA96;
    }
</style>
</head>
<body>

<div style="margin:0 auto;text-align:center;display:inline">
<%@ include file="header.jsp" %>

<h3>Please Login to System</h3>

<%
// Print prior error login message if present
if (session.getAttribute("loginMessage") != null)
	out.println("<p style='color:red'>"+session.getAttribute("loginMessage").toString()+"</p>");
%>
<p style='font-size:14px'>New to our store?&nbsp<a href=register.jsp>Register here!</button></a></p>

<form name="MyForm" method=post action="validateLogin.jsp">
<table>
<tr>	
	<td><div align="right">Username:</div></td>
	<td><input type="text" name="username"  size=10 maxlength=10></td>
</tr>
<tr>
	<td><div align="right">Password:</div></td>
	<td><input type="password" name="password" size=10 maxlength="10"></td>
</tr>
</table>
<br>
<input class="input2" type="submit" name="Submit2" value="Log In &#9989">
</form>
</div>
<p><a href=index.jsp><button>Main Menu &#127968</button></a></p>
</body>
</html>

