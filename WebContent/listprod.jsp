<%@ page import="java.sql.*,java.net.URLEncoder" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<title>Konbini Grocery</title>
<style>
	@font-face{
			font-family: customFont;
			src: url(NikkyouSans-mLKax.ttf);
	}
	h1, h2{
			text-align: center;
			font-family: customFont;
			font-size: 40px;
			padding: 0px;
	}
	h2{
		font-size: 25px;
		text-align: left;
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
		text-align: center;
		height: 25px;
	}
	form{
		font-family: sans-serif;
		font-size: 15px;
	}
	.tableheader{
		height: 30px;
		font-size: 18px;
		font-family: customFont;
		text-align: center;
		background-color: #F5CEC5;
	}
	.button, .button2, input, select{
		font-family: sans-serif;
		font-size: 14px;
		text-align: center;
		padding: 4px;
		margin: 2px;
		transition-duration: 0.4s;
		cursor: pointer;
		background: #FCFBF6;
	}
	.button2{
		background: #F5CEC5;
		font-size: 16px;
		float: right;
	}
	.input2{
        background: white;
        text-align: left;
        font-size: 14px;
    }
	.button:hover, input:hover, select:hover{
		background-color: #F5CEC5;
	}
	.button2:hover{
		background-color: #FAAA96;
	}
	.input2:hover{
        background-color: #FCFBF6;
    }
	a{
        color: black;
    }
	a:hover{
		color: #7E8193;
	}
</style>
</head>
<body>

<h1>Search for the products you want to buy:</h1>

<form method="get" action="listprod.jsp">
	<label>Category</label>
	<select name="category">
		<option value="All">All</option>
		<option value="Beverages">Beverages</option>
		<option value="Condiments">Condiments</option>
		<option value="Confections">Confections</option>
		<option value="Dairy Products">Dairy Products</option>
		<option value="Grains/Cereals">Grains/Cereals</option>
		<option value="Meat/Poultry">Meat/Poultry</option>
		<option value="Produce">Produce</option>
		<option value="Seafood">Seafood</option>
	</select>
<input type="text" name="productName" size="50" class="input2">
<input type="submit" value="Submit"><input type="reset" value="Reset"> (Leave blank for all products)
</form>

<% // Get product name to search for
String name = request.getParameter("productName");
String category = request.getParameter("category");

// Useful code for formatting currency values:
NumberFormat currFormat = NumberFormat.getCurrencyInstance(Locale.US);
// out.println(currFormat.format(5.0);	// Prints $5.00

//Note: Forces loading of SQL Server driver
try
{	// Load driver class
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
}
catch (java.lang.ClassNotFoundException e)
{
	out.println("ClassNotFoundException: " +e);
}

// Variable name now contains the search string the user entered
// Use it to build a query and print out the resultset.  Make sure to use PreparedStatement!

// Make the connection
String url = "jdbc:sqlserver://db:1433;DatabaseName=tempdb;";
String uid = "SA";
String pw = "YourStrong@Passw0rd";

// Print out the ResultSet

// For each product create a link of the form
// addcart.jsp?id=productId&name=productName&price=productPrice

try (Connection con = DriverManager.getConnection(url, uid, pw);
		Statement stmt = con.createStatement();)
{
	String sql_1 = "SELECT P.productName, P.productId, C.categoryName, P.productPrice "
				+ " FROM product P JOIN category C ON P.categoryId = C.categoryId ";
	PreparedStatement pstmt_1 = null;
	ResultSet rst_1 = null;
	boolean hasName = name != null && !name.equals("");
	boolean hasCat = category != null && !category.equals("All");
	out.println("<h2>All Products<a href=index.jsp><button class='button2'><b>Main Menu 🏠</b></button></a><a href=showcart.jsp><button class='button2'><b>Your Cart 🛒</b></button></a></h2>");
	out.println("<table><tr><td class='tableheader'></td><td class='tableheader'>Product Name</td><td class='tableheader'>Category</td><td class='tableheader'>Price</td></tr>");

	if (!hasName && !hasCat){
		pstmt_1 = con.prepareStatement(sql_1);
		rst_1 = pstmt_1.executeQuery();
	} else if (hasName){
		name = "%" + name + "%";
		sql_1 += " WHERE P.productName LIKE ? ";
		if (hasCat)
			sql_1 += " AND categoryName = ?";
		pstmt_1 = con.prepareStatement(sql_1);
		pstmt_1.setString(1, name);
		if (hasCat)
			pstmt_1.setString(2, category);
		rst_1 = pstmt_1.executeQuery();
	} else if (hasCat){
		sql_1 += " WHERE categoryName = ?";
		pstmt_1 = con.prepareStatement(sql_1);
		pstmt_1.setString(1, category);
		rst_1 = pstmt_1.executeQuery();
	}
	sql_1 = pstmt_1.toString();
	while(rst_1.next())
	{
		String productId = rst_1.getString("productId");
		String productName = rst_1.getString("productName");
		Double productPrice = rst_1.getDouble("productPrice");
		String nameEncoded = java.net.URLEncoder.encode(productName, "UTF-8").replace("+","%20");
		String link = "addcart.jsp?id="+productId+"&name="+nameEncoded+"&price="+productPrice;
		String link_detail = "product.jsp?id="+productId;
		out.println("<tr><td width=120px><a href="+link+"><button class='button'>Add to Cart 🛒</button></a></td>");
		out.println("<td><a href="+link_detail+">"+rst_1.getString("productName")+"</a></td><td>"+rst_1.getString("categoryName")+"</td><td>"+currFormat.format(rst_1.getDouble("productPrice"))+"</td></tr>");
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