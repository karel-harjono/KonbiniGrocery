<%@ include file="authAdmin.jsp"%>
<%@ page import="java.text.NumberFormat" %>
<%@ include file="jdbc.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>Update Product</title>
	<style>
		h3{
			text-align: center;
			font-family: sans-serif;
			font-size: 20px;
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
	</style>
</head>
<body>
<%
// Write query to retrieve all order summary records
int check = 0;
try
{
	getConnection();
	int id = Integer.parseInt(request.getParameter("productId"));
	String prodName = request.getParameter("productName");
	double prodPrice = Double.parseDouble(request.getParameter("productPrice"));
	String prodDesc = request.getParameter("productDesc");
	int categoryId = Integer.parseInt(request.getParameter("categoryId"));

	String SQL = "UPDATE product SET productName = ?, productPrice = ?, productDesc = ?, categoryId = ? WHERE productId = ?";

	PreparedStatement pst = con.prepareStatement(SQL);
	pst.setString(1,prodName); 
	pst.setDouble(2,prodPrice);
	pst.setString(3,prodDesc);
	pst.setInt(4,categoryId);
	pst.setInt(5,id);

	check = pst.executeUpdate();
}
catch (Exception e)
{
    out.print(e);
}
finally
{	
	closeConnection();
	if(check >0) {
		out.println("<h3 style='color: green;'>Product updated.</h3>");
		out.println("<a href='listProd.jsp'><button class='button' style='float:left;'>List Product</button></a>");
	}
	else out.println("<h3 style='color: red;'>Failed to add product.</h3>");
}
// Close connection
%>

</body>
</html>
