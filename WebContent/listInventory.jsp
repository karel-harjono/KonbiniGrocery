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
            header{
                text-align: center;
                font-family: customFont;
                font-size: 40px;
                padding: 0px;
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
    </style>
</head>
<body>

<header>
	<h1>Customer List</h1>
	<p>
		<a href=shop.html><button class="button"><b>Main Menu &#127968</b></button></a>
		<a href=listprod.jsp><button class="button"><b>List Customer &#128221</b></button></a>
	</p>
</header>

<%
//Note: Forces loading of SQL Server driver
try
{	// Load driver class
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
}
catch (java.lang.ClassNotFoundException e)
{
	out.println("ClassNotFoundException: " +e);
}

// Useful code for formatting currency values:
NumberFormat currFormat = NumberFormat.getCurrencyInstance(Locale.US);
// out.println(currFormat.format(5.0);  // Prints $5.00

// Make connection
String url = "jdbc:sqlserver://db:1433;DatabaseName=tempdb;";
String uid = "SA";
String pw = "YourStrong@Passw0rd";

// Write query to retrieve all order summary records
try (Connection con = DriverManager.getConnection(url, uid, pw);
		Statement stmt = con.createStatement();)
{
	int warehouse = Integer.parseInt(request.getParameter("warehouse id"));
	String SQL = "SELECT productId, quantity, price FROM productInventory WHERE warehouseId = ?";
	PreparedStatement pst = con.prepareStatement(SQL);
	pst.setInt(1,warehouse);
	ResultSet rst = pst.executeQuery();
	ResultSetMetaData rstmd = rst.getMetaData();

	while(rst.next){
		out.println("<table border =1>");
		for(int i = 1; i<=3; i++) out.println("<tr><th>"+rstmd.getColumnName(i)+"</th><th>"+rst.getString(i)+"</th></tr>");
	}
	out.println("</table>");
}
catch (Exception e)
{
    out.print(e);
}



// Close connection
%>

</body>
</html>

