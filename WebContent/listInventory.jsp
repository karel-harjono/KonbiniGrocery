<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ include file="jdbc.jsp" %>
<%@ include file="auth.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<title>Konbini Grocery Order List</title>
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
			p{
				font-family:sans-serif;
				font-size: 18px;
				text-align: left;
				font-weight: bold;
			}
			a{
        		color: black;
    		}
    		a:hover{
        		color:#FAAA96;
    		}
			table{
				width: 100%;
			}
			table, td{
				border: 1px solid #7E8193;
			}
            td{
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
				font-weight: bold;
				text-align:center;
				padding: 8px;
				margin: 4px 2px;
				background: #F5CEC5;
				transition-duration: 0.4s;
				cursor: pointer;
				float: right;
			}
			.button:hover{
				background-color: #FAAA96;
			}
    </style>
</head>
<body>
	<%@ include file="header.jsp" %>

	<h2>Inventory List
		<a href=index.jsp><button class="button">Main Menu &#127968</button></a>
		<a href=admin.jsp><button class="button">Admin Page &#128100</button></a>
	</h2>
	<p>
		&#127800<a href=updateInventory.jsp>Update inventory here</a> // INI PERLU PARAMETERS BAANYAK BANGET, BINGUNG
	</p>
<%
//Note: Forces loading of SQL Server driver

// Useful code for formatting currency values:
NumberFormat currFormat = NumberFormat.getCurrencyInstance(Locale.US);
// out.println(currFormat.format(5.0);  // Prints $5.00

// Write query to retrieve all order summary records
try
{
	getConnection();
	int warehouse = Integer.parseInt(request.getParameter("warehouseId"));
	String SQL = "SELECT productId, quantity, price FROM productInventory WHERE warehouseId = ?";
	PreparedStatement pst = con.prepareStatement(SQL);
	pst.setInt(1,warehouse);
	ResultSet rst = pst.executeQuery();
	ResultSetMetaData rstmd = rst.getMetaData();

	out.println("<table><tr>");
		for(int i = 1; i<4; i++) {
			out.println("<td class='tableheader'>"+rstmd.getColumnName(i)+"</td>");
		}
	out.println("</tr>");

	while(rst.next()){
		out.println("<tr>");
		for(int i = 1; i<4; i++) {
			out.println("<td>"+rst.getString(i)+"</td>");
		}
		out.println("</tr>");
	}
	out.println("</table><br>");
}
catch (Exception e)
{
    out.print(e);
}
finally
{	
	closeConnection();	
}
// Close connection
%>

</body>
</html>

