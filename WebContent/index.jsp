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
                        text-align: center;
                        font-family: sans-serif;
                        font-size: 30px;
                }
                .button{
			font-family: sans-serif;
			font-size: 18px;
			text-align:center;
			padding: 8px;
			margin: 4px 2px;
			background: #F5CEC5;
			transition-duration: 0.4s;
			cursor: pointer;
		}
		.button:hover{
			background-color: #FAAA96;
		}
                a, a:hover{
                        color: black;
                }
        </style>
</head>
<body>
        <%@ include file="header.jsp" %>

        <h2><a href="login.jsp"><button class="button"><b>Login &#9989</b></button></a></h2>
        
        <h2><a href="listprod.jsp"><button class="button"><b>Begin Shopping &#128717</b></button></a></h2>
        
        <h2><a href="listorder.jsp"><button class="button"><b>List All Orders &#128176</b></button></a></h2>
        
        <h2><a href="customer.jsp"><button class="button"><b>Customer Info &#128106</b></button></a></h2>
        
        <h2><a href="admin.jsp"><button class="button"><b>Administrators &#128100</b></button></a></h2>
        
        <h2><a href="logout.jsp"><button class="button"><b>Log out &#9940</b></button></a></h2>
</body>
</head>


