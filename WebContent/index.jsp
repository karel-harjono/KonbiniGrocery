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
                        font-weight: bold;
			padding: 6px;
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

        <h2><a href="showcart.jsp"><button class="button">Your Cart &#128722</button></a></h2>

        <h2><a href="listprod.jsp"><button class="button">Begin Shopping &#128717</button></a></h2>
        
        <h2><a href="listorder.jsp"><button class="button">List All Orders &#128176</button></a></h2>
        
        <h2><a href="customer.jsp"><button class="button">Customer Info &#128106</button></a></h2>
        
        <h2><a href="admin.jsp"><button class="button">Administrators &#128100</button></a></h2>
        
        <% 
        if(session.getAttribute("authenticatedUser") != null)
            out.println("<h2><a href=\"logout.jsp\"><button class=\"button\">Log out &#9940</button></a></h2>"); 
        %>
</body>
</head>


