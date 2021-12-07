<%@ include file="auth.jsp"%>
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
	</style>
</head>
<body>
<%
// Write query to retrieve all order summary records
try
{
	getConnection();
	int id = Integer.parseInt(request.getParameter("id"));
	String prodName = request.getParameter("productName");
	double prodPrice = Double.parseDouble(request.getParameter("prodPrice"));
	String prodDesc = request.getParameter("prodDesc");
	int categoryId = Integer.parseInt(request.getParameter("categoryId"));

	String SQL = "UPDATE product SET productName = ?, productPrice = ?, productDesc = ?, categoryId = ? WHERE productId = ?";

	PreparedStatement pst = con.prepareStatement(SQL);
	pst.setString(1,name); 
	pst.setDouble(2,prodPrice);
	pst.setString(3,prodDesc);
	pst.setInt(4,categoryId);
	pst.setInt(5,id);

	int check = pst.executeUpdate();
	if(check >0) out.println("<h3>Warehouse updated.</h3>");
	else out.println("<h3 style='color: red;'>Failed to update warehouse.</h3>");
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
