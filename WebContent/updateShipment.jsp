<%@ include file="auth.jsp"%>
<%@ page import="java.text.NumberFormat" %>
<%@ include file="jdbc.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>Update Shipment</title>
</head>
<body>
<%
// Write query to retrieve all order summary records
try
{
	getConnection();
	int id = Integer.parseInt(request.getParameter("shipment id"));
	String desc = request.getParameter("Shipment status");
	

	String SQL = "UPDATE customer SET shipmentDesc = ? WHERE shipmentId = ?";


	PreparedStatement pst = con.prepareStatement(SQL);
	pst.setString(1,desc);
	pst.setInt(2,id);


	int check = pst.executeUpdate();
	if(check >0) out.println("shipment status updated");
	else out.println("failed to update shipment status");
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
