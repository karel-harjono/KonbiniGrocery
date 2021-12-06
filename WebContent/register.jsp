<!DOCTYPE html>
<html>
<head>
        <title>Konbini Grocery Main Page</title>
        <style>
            @font-face{
                font-family: customFont;
                src: url(NikkyouSans-mLKax.ttf);
            }
            h1{
                text-align: center;
                font-family: customFont;
                font-size: 50px;
                padding: 10px 16px;
            }
            h2 {
                text-align: left;
                font-family: customFont;
                font-size: 30px;
            }
            form{
		        font-family: sans-serif;
		        font-size: 15px;
	        }
	        .input{
		        font-family: sans-serif;
		        font-size: 18px;
		        text-align: center;
		        font-weight: bold;
		        padding: 4px;
		        margin: 2px;
		        transition-duration: 0.4s;
		        cursor: pointer;
		        background: #FCFBF6;
                width: 98%;
	        }
	        .input2, button {
                font-family: sans-serif;
		        font-size: 18px;
		        text-align: center;
		        font-weight: bold;
		        padding: 4px;
		        margin: 2px;
		        transition-duration: 0.4s;
		        cursor: pointer;
		        background: #F5CEC5;
                float: right;
	        }
	        .input:hover {
		        background-color: #F5CEC5;
	        }
	        .input2:hover, button:hover{
		        background-color: #FAAA96;
	        }
            table{
		        width: 100%;
	        }
	        table, td{
		        border: 1px solid #7E8193;
	        }
            td, p{
                font-family: sans-serif;
                font-size: 14px;
		        height: 25px;
                width:auto;
            }
	        .tableheader{
		        height: 30px;
		        font-size: 18px;
		        font-family: customFont;
		        text-align: center;
		        background-color: #F5CEC5;
	        }
        </style>
</head>
<body>
<%@ include file="header.jsp" %>
<h2>Create new account
    <a href=index.jsp><button>Main Menu &#127968</button></a>
	<a href=listprod.jsp><button>List Products &#128221</button></a>
    <a href=showcart.jsp><button>Your Cart &#128722</button></a>
</h2>

<form class="register" method="post" action="addCust.jsp">
    <table>
        <tr><td class='tableheader'>Username:</td><td><input class='input' type="text" name="username" value=""></td></tr>
        <tr><td class='tableheader'>First Name:</td><td><input class='input' type="text" name="firstName" value=""></td></tr>
        <tr><td class='tableheader'>Last Name:</td><td><input class='input' type="text" name="lastName" value=""></td></tr>
        <tr><td class='tableheader'>Password:</td><td><input class='input' type="password" name="password" value=""></td></tr>
        <tr><td class='tableheader'>Confirm password:</td><td><input class='input' type="password" name="confirmPassword" value=""></td></tr>
        <tr><td class='tableheader'>Email:</td><td><input class='input' type="email" name="email" value=""></td></tr>
        <tr><td class='tableheader'>Phone Number:</td><td><input class='input' type="tel" name="phoneNumber" value=""></td></tr>
        <tr><td class='tableheader'>Country:</td><td><input class='input' type="text" name="country" value=""></td></tr>
        <tr><td class='tableheader'>State/Province:</td><td><input class='input' type="text" name="state" value=""></td></tr>
        <tr><td class='tableheader'>City:</td><td><input class='input' type="text" name="city" value=""></td></tr>
        <tr><td class='tableheader'>Address:</td><td><input class='input' type="text" name="address" value=""></td></tr>
        <tr><td class='tableheader'>Zip/Postal Code:</td><td><input class='input' type="text" name="postalCode" value=""></td></tr>
    </table>
    <br><input class="input2" type="submit" name="sub">
</form>
<p></p>

</body>