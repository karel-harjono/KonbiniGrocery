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
	Statement stmt = con.createStatement();
	ResultSet warehouseIds = stmt.executeQuery("SELECT warehouseId FROM warehouse");
	if(request.getParameter("warehouseId") == null){
		out.println("<form method=get action='updateInventory.jsp'>");
		out.println("<table>");
		out.println("<tr><td><label for='warehouseId'>Select warehouseId: </label>");
		out.println("<select name='warehouseId'>");
		while(warehouseIds.next()){
			int temp_id = warehouseIds.getInt(1);
			out.println("<option value='" + temp_id + "'" + temp_id+ "</option>");
			out.println(warehouseIds.getString(1));
		}
		out.println("</select></td></tr>");
		out.println("<tr><td>");
		out.println("<label for='productId'>ProductId: </label>");
		out.println("<input name='productId'/>");
		out.println("</tr></td>");
		out.println("<tr><td>");
		out.println("<label for='newQty'>NewQuantity: </label>");
		out.println("<input name='newQty'/>");
		out.println("</tr></td>");
		out.println("<tr><td>");
		out.println("<label for='newPrice'>NewPrice: </label>");
		out.println("<input name='newPrice'/>");
		out.println("</tr></td>");
		out.println("<tr><td><input type='submit'></td></tr>");
		out.println("</table>");
		out.println("</form>");
	}else{
		int wid = Integer.parseInt(request.getParameter("warehouseId"));
		int pid = Integer.parseInt(request.getParameter("productId"));
		int quantity = Integer.parseInt(request.getParameter("newQty"));
		double price = Double.parseDouble(request.getParameter("newPrice"));

		String SQL = "UPDATE productInventory SET quantity = ?, price = ? WHERE productId = ? AND warehouseId = ?";

		PreparedStatement pst = con.prepareStatement(SQL);
		pst.setInt(1,quantity); 
		pst.setDouble(2,price); 
		pst.setInt(3,pid);
		pst.setInt(4,wid);

		int check = pst.executeUpdate();
		if(check >0) {out.println("<h3>Product inventory in warehouse updated.</h3>");
			out.println("<a href='listInventory.jsp'><button class='button'>List Inventory</button></a>");
		}
		else out.println("<h3 style='color: red;'>Failed to update product inventory in warehouse.</h3>");
	}
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
