<%@ include file="authAdmin.jsp"%>
<%@ page import="java.text.NumberFormat" %>
<%@ include file="jdbc.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>Add Product</title>
	<style>
		@font-face{
            font-family: customFont;
            src: url(NikkyouSans-mLKax.ttf);
        }
		h2{
			text-align: left;
			font-family: customFont;
			font-size: 30px;
			padding: 4px;
		}
		h3{
			text-align: left;
			font-family: sans-serif;
			font-size: 20px;
			padding: 4px;
		}
		p{
			font-family:sans-serif;
			font-size: 18px;
			text-align: left;
			font-weight: bold;
			padding: 4px;
		}
		a{
    		color: black;
    	}
    	a:hover{
        	color:#FAAA96;
    	}
		form{
			font-family: sans-serif;
			font-size: 15px;
		}
		table{
			width: auto;
			padding: 4px;
		}
		table, td{
			border: 1px solid #7E8193;
		}
        td{
            font-family: sans-serif;
            font-size: 14px;
			font-weight: bold;
			height: 25px;
			text-align: center;
        }
		.tableheader{
			height: 30px;
			font-size: 18px;
			font-family: customFont;
			text-align: center;
			background-color: #F5CEC5;
		}
		button, input{
			font-family: sans-serif;
			font-size: 18px;
			font-weight: bold;
			text-align:center;
			padding: 6px;
			margin: 4px 2px;
			background: #F5CEC5;
			transition-duration: 0.4s;
			cursor: pointer;
			float:right;
		}
		input{
			font-size: 15px;
			padding: 4px;
			background: #FCFBF6;
		}
		button:hover, input:hover{
			background-color: #FAAA96;
		}
	</style>
</head>
<body>
	<%@ include file="header.jsp" %>

	<h2>Add New Product
		<a href=index.jsp><button>Main Menu &#127968</button></a>
		<a href=admin.jsp><button>Admin Page &#128100</button></a>
	</h2>

	<p>
		&#127800<a href=updateProduct.jsp>Update Product</a>
	</p>
	<p>
		&#127800<a href=listprod.jsp>List Products</a>
	</p>

	<form method='post' action='addProduct.jsp'>
	<table>
	<tr><td>Product Name:</td><td><input type='text' name='productName' size='20' class='input2'></td></tr>
	<tr><td>Product Price:</td><td><input type='text' name='productPrice' size='20' class='input2'></td></tr>
	<tr><td>Product Description:</td><td><input type='text' name='productDesc' size='20' class='input2'></td></tr>
	<tr><td>Category ID:</td><td><input type='text' name='categoryId' size='20' class='input2'></td></tr>
	<tr><td>Product ID:</td><td><input type='text' name='productId' size='20' class='input2'></td></tr>
	<tr><td colspan=2>(enter product ID to update existing product)</td></tr>
	<tr><td colspan=2><input type='submit' value='Add Product'> <input type='submit' value='Update Product' formaction="updateProduct.jsp"></td></tr>
	</table>
	</form>
	<br>

	
<%
// Write query to retrieve all order summary records
int check = 0;
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

	check = pst.executeUpdate();
}
catch (Exception e)
{
    out.print("<h3 style='color: red;'>"+e+"</h3>");
}
finally
{	
	closeConnection();
	if(check >0) out.println("<h3 style='color: darkgreen;'>New product added.</h3>");
	else out.println("<h3 style='color: red;'>Failed to add product.</h3>");	
}

// Close connection
%>

</body>
</html>
