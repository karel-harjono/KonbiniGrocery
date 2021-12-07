<%@ include file="auth.jsp"%>
<%@ page import="java.text.NumberFormat" %>
<%@ include file="jdbc.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>Add Product</title>
	<style>
		h2{
			text-align: left;
			font-family: customFont;
			font-size: 30px;
			padding: 0px;
		}
		h3{
			text-align: center;
			font-family: sans-serif;
			font-size: 20px;
		}p{
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
			float:right;
		}
		.button:hover{
			background-color: #FAAA96;
		}
	</style>
</head>
<body>
	<%@ include file="header.jsp" %>

	<h2>Add New Product
		<a href=index.jsp><button class="button">Main Menu &#127968</button></a>
		<a href=admin.jsp><button class="button">Admin Page &#128100</button></a>
	</h2>
	<p>
		&#127800<a href=listprod.jsp>List Products</a>
	</p>
	<p>
		&#127800<a href=updateProduct.jsp>Update Product</a> // INI PERLU PARAMETERS BAANYAK BANGET, BINGUNG
	</p>
<%
// Write query to retrieve all order summary records
try
{
	getConnection();
	String prodName = request.getParameter("productName");
	double prodPrice = Double.parseDouble(request.getParameter("productPrice"));
	String prodDesc = request.getParameter("productDesc");
	int categoryId = Integer.parseInt(request.getParameter("categoryId"));

	String SQL = "INSERT INTO product (productName, productPrice, productDesc, categoryId) VALUES (?,?,?,?)";

	PreparedStatement pst = con.prepareStatement(SQL);
	pst.setString(1,prodName);
	pst.setDouble(2,prodPrice);
	pst.setString(3,prodDesc);
	pst.setInt(4,categoryId);

	int check = pst.executeUpdate();

	if(check >0) out.println("<h3>New product added.</h3>");
	else out.println("<h3 style='color: red;'>Failed to add product.</h3>");
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
