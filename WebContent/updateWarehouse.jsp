<%@ include file="auth.jsp"%>
<%@ page import="java.text.NumberFormat" %>
<%@ include file="jdbc.jsp" %>
<%@ include file="auth.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>Update Warehouse</title>
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
String warehouseId = request.getParameter("warehouseId");
String warehouseName = request.getParameter("warehouseName");
try
{
	getConnection();
	int id=-1;
	try
	{
		id = Integer.parseInt(warehousetId);
	} 
	catch(Exception e)
	{
		out.println("<h3 style='color: red;'>Invalid warehouse id!  Please try again.</h3>");
		return;
	}

	String SQL = "UPDATE warehouse SET warehouseName = ? WHERE warehouseId = ?";

	PreparedStatement pst = con.prepareStatement(SQL);
	pst.setString(1,warehouseName); 
	pst.setInt(2,warehouseId);

	int check = pst.executeUpdate();
	if(check > 0) out.println("<h3>Warehouse updated.</h3>");
	else out.println("<h3 style='color: red;'>Failed to update warehouse. Please try again.</h3>");
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
