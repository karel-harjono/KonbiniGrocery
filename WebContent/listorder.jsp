<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
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
	<h1>Order List</h1>
	<p>
		<a href=index.jsp><button class="button"><b>Main Menu &#127968</b></button></a>
		<a href=listprod.jsp><button class="button"><b>List Products &#128221</b></button></a>
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
	String sql_1 = "SELECT OS.orderId, OS.orderDate, C.customerId, C.firstname, C.lastname, OS.totalAmount "
				+ " FROM orderSummary OS JOIN customer C ON OS.customerId = C.customerId";
	String sql_2 = "SELECT OP.productId, OP.quantity, OP.price "
					+ " FROM orderSummary OS JOIN orderProduct OP ON OS.orderId = OP.orderId "
					+ "WHERE OS.orderId = ?";
	PreparedStatement pstmt_1 = con.prepareStatement(sql_1);
	ResultSet rst_1 = pstmt_1.executeQuery();
	out.println("<table><tr><td class='tableheader'>Order Id</td><td class='tableheader'>Order Date</td><td class='tableheader'>Customer Id</td><td class='tableheader'>Customer Name</td><td class='tableheader'>Total Amount</td></tr>");
	while(rst_1.next())
	{
		out.println("<tr><td align='center'>"+rst_1.getInt("orderId")+"</td><td align='center'>"+rst_1.getDate("orderDate")+"</td><td align='center'>"+rst_1.getInt("customerId")+"</td><td align='center'>"+rst_1.getString("firstname")+ " " + rst_1.getString("lastname")+"</td><td align='center'>"+currFormat.format(rst_1.getDouble("totalAmount"))+ "</td></tr>");
		out.println("<tr><td colspan=5 align='right'><table style='width: 35%;'>");
		out.println("<tr><td class='tableheader'>Product Id</td><td class='tableheader'>Quantity</td><td class='tableheader'>Price</td></tr>");
		PreparedStatement pstmt_2 = con.prepareStatement(sql_2);
		pstmt_2.setInt(1,rst_1.getInt("orderId"));
		ResultSet rst_2 = pstmt_2.executeQuery();
		while(rst_2.next())
		   out.println("<tr><td align='center'>"+rst_2.getInt("productId")+"</td><td align='center'>"+rst_2.getInt("quantity")+"</td><td align='center'>"+currFormat.format(rst_2.getDouble("price"))+"</td></tr>");
		out.println("</table></td></tr>");
	}
	out.println("</table>");	
}
catch (Exception e)
{
    out.print(e);
}

// For each order in the ResultSet

	// Print out the order summary information
	// Write a query to retrieve the products in the order
	//   - Use a PreparedStatement as will repeat this query many times
	// For each product in the order
		// Write out product information 

// Close connection
%>

</body>
</html>

