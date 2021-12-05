<!DOCTYPE html>
<html>
<head>
<title>Customer Page</title>
<style>
	@font-face{
        font-family: customFont;
        src: url(NikkyouSans-mLKax.ttf);
    }
    header{
        text-align: center;
        font-family: customFont;
        font-size: 40px;
        padding: 0px;
    }
	h2{
		font-size: 25px;
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
    }
	.tableheader{
		height: 30px;
		font-size: 18px;
		font-family: customFont;
		text-align: center;
		background-color: #F5CEC5;
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
		left: 50%;
	}
	.button:hover{
		background-color: #FAAA96;
	}
</style>
</head>
<body>
	<header>
		<h2>Customer Profile</h2>
		<a href=index.jsp><button class="button"><b>Main Menu &#127968</b></button></a>
		<a href=listprod.jsp><button class="button"><b>List Products &#128221</b></button></a>
		<br>
	</header>
<%@ include file="auth.jsp"%>
<%@ page import="java.text.NumberFormat" %>
<%@ include file="jdbc.jsp" %>

<%
	String userName = (String) session.getAttribute("authenticatedUser");
%>

<%
// Make connection

// Write query to retrieve all order summary records
NumberFormat currFormat = NumberFormat.getCurrencyInstance();
try {
	String SQL = "SELECT customerId, firstName, lastName, email, phonenum, address, city, state, postalCode, country, userid "
				+"FROM Customer"
				+" WHERE userid = ?";
	
	getConnection();
	PreparedStatement pstmt = con.prepareStatement(SQL);
	pstmt.setString(1, userName);	
	ResultSet rst = pstmt.executeQuery();

	if (rst.next())
	{
		out.println("<table class=\"table\" border=\"1\">");
		out.println("<tr><td class='tableheader'>Id</td><td align='center'>"+rst.getString(1)+"</td></tr>");	
		out.println("<tr><td class='tableheader'>First Name</td><td align='center'> "+rst.getString(2)+"</td></tr>");
		out.println("<tr><td class='tableheader'>Last Name</td><td align='center'>"+rst.getString(3)+"</td></tr>");
		out.println("<tr><td class='tableheader'>Email</td><td align='center'>"+rst.getString(4)+"</td></tr>");
		out.println("<tr><td class='tableheader'>Phone</td><td align='center'>"+rst.getString(5)+"</td></tr>");
		out.println("<tr><td class='tableheader'>Address</td><td align='center'>"+rst.getString(6)+"</td></tr>");
		out.println("<tr><td class='tableheader'>City</td><td align='center'>"+rst.getString(7)+"</td></tr>");
		out.println("<tr><td class='tableheader'>State</td><td align='center'>"+rst.getString(8)+"</td></tr>");
		out.println("<tr><td class='tableheader'>Postal Code</td><td align='center'>"+rst.getString(9)+"</td></tr>");
		out.println("<tr><td class='tableheader'>Country</td><td align='center'>"+rst.getString(10)+"</td></tr>");
		out.println("<tr><td class='tableheader'>User id</td><td align='center'>"+rst.getString(11)+"</td></tr>");		
		out.println("</table>");
	}
}
catch (SQLException ex) {
	out.println(ex); 
}
finally {	
	closeConnection();	
}
// Make sure to close connection
%>

</body>
</html>