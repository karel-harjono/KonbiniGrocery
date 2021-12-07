<%@ page import="java.text.NumberFormat" %>
<%@ include file="jdbc.jsp" %>
<%@ include file="auth.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>Update Inventory</title>
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
	int wid = Integer.parseInt(request.getParameter("warehouse id"));
	int pid = Integer.parseInt(request.getParameter("product id"));
	int quantity = Integer.parseInt(request.getParameter("new quantity"));
	double price = Double.parseDouble(request.getParameter("new price"));

	String SQL = "UPDATE productInventory SET quantity = ?, price = ? WHERE productId = ? AND warehouseId = ?";

	PreparedStatement pst = con.prepareStatement(SQL);
	pst.setInt(1,quantity); 
	pst.setDouble(2,price); 
	pst.setInt(3,pid);
	pst.setInt(4,wid);

	int check = pst.executeUpdate();
	if(check >0) out.println("<h3>Product inventory in warehouse updated.</h3>");
	else out.println("<h3 style='color: red;'>Failed to update product inventory in warehouse.</h3>");
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
