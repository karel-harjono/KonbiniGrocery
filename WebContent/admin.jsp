<!DOCTYPE html>
<html>
<head>
<title>Administrator Page</title>
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
		<h2>Administrator Sales Report by Day</h2>
		<a href=index.jsp><button class="button"><b>Main Menu &#127968</b></button></a>
		<a href=listprod.jsp><button class="button"><b>List Products &#128221</b></button></a>
		<br>
	</header>

<%@ include file="jdbc.jsp" %>
<%@ include file="authAdmin.jsp"%>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page language="java" import="java.io.*,java.sql.*"%>

<%
    String userName = (String) session.getAttribute("authenticatedUser");
%>

<%
// Print out total order amount by day
String sql = "select year(orderDate), month(orderDate), day(orderDate), SUM(totalAmount) FROM OrderSummary GROUP BY year(orderDate), month(orderDate), day(orderDate)";

NumberFormat currFormat = NumberFormat.getCurrencyInstance(Locale.US);

try 
{	
	getConnection();
	ResultSet rst = con.createStatement().executeQuery(sql);		
	out.println("<table>");
	out.println("<tr><td class='tableheader'>Order Date</td><td class='tableheader'>Total Order Amount</td>");	

	while (rst.next())
	{
		out.println("<tr><td align='center'>"+rst.getString(1)+"-"+rst.getString(2)+"-"+rst.getString(3)+"</td><td align='center'>"+currFormat.format(rst.getDouble(4))+"</td></tr>");
	}
	out.println("</table>");		
}
catch (SQLException ex) 
{ 	
    out.println(ex); 
}
finally
{	
	closeConnection();	
}
%>
</body>
</html>

