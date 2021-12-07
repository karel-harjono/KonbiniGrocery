<!DOCTYPE html>
<html>
<head>
<title>Administrator Page</title>
<style>
	@font-face{
        font-family: customFont;
        src: url(NikkyouSans-mLKax.ttf);
    }
    h2{
		text-align: left;
		font-family: customFont;
		font-size: 30px;
		padding: 0px;
	}
	table{
		width: 100%;
	}
	table{
		border: 1px solid #7E8193;
	}
    td, p{
        font-family: sans-serif;
        font-size: 14px;
		height: 25px;
		text-align: center;
    }
	.tableheader{
		border: 1px solid #7E8193;
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
		font-weight: bold;
		padding: 6px;
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
<%@ include file="jdbc.jsp" %>
<%@ include file="authAdmin.jsp"%>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page language="java" import="java.io.*,java.sql.*"%>

<%@ include file="header.jsp" %>
		<h2>Administrator Management Site
			<a href=index.jsp><button class="button" style='float:right'><b>Main Menu &#127968</b></button></a>
		</h2>
		<br>

<%
// Print out total order amount by day
String sql = "select year(orderDate), month(orderDate), day(orderDate), SUM(totalAmount) FROM OrderSummary GROUP BY year(orderDate), month(orderDate), day(orderDate)";

NumberFormat currFormat = NumberFormat.getCurrencyInstance(Locale.US);

try 
{	
	getConnection();
	ResultSet rst = con.createStatement().executeQuery(sql);
	out.println("<table style='border:0px'>");	
		out.println("<tr><td><a href='listCust.jsp'><button class='button' style='width:45%'>Customer &#128106</button></a><br>");		// ADD CUST NYA BELUM BERES
		out.println("<a href='listInventory.jsp'><button class='button' style='width:45%'>Inventory &#128218 </button></a><br>");		// UPDATE INVENTORY NYA
		out.println("<a href='listorder.jsp'><button class='button' style='width:45%'>Orders &#128176 </button></a><br>");
		out.println("<a href='addProduct.jsp'><button class='button' style='width:45%'>Products &#128230 </button></a><br>");			// HOW TO PASS PARAM?
		out.println("<a href='updateShipment.jsp'><button class='button' style='width:45%'>Shipment &#128667</button></a><br>");		// INI PERLU PARAM. SHIPMENT ID
		out.println("<a href='listWarehouse.jsp'><button class='button' style='width:45%'>Warehouse &#128205</button></a></td>");		// CHECK INSIDE
		out.println("<td>");
			out.println("<p style='font-size:20px'><b>SALES:</b></p>");
			out.println("<table>");
			out.println("<tr><td class='tableheader' style='border:1px solid #7E8193'>Order Date</td><td class='tableheader' style='border:1px solid #7E8193'>Total Order Amount</td>");	

			while (rst.next())
			{
				out.println("<tr><td style='border:1px solid #7E8193'>"+rst.getString(1)+"-"+rst.getString(2)+"-"+rst.getString(3)+"</td><td style='border:1px solid #7E8193'>"+currFormat.format(rst.getDouble(4))+"</td></tr>");
			}
			out.println("</table>");
		out.println("</tr></td>");
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
</div>
</table>
</body>
</html>

