<%@ include file="authAdmin.jsp"%>
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
	int id = Integer.parseInt(request.getParameter("shipmentId"));
	String desc = (String)request.getParameter("shipmentDesc");
	PreparedStatement pstmt = con.prepareStatement("SELECT * FROM shipment WHERE shipmentId=?");
	pstmt.setInt(1,id);
	ResultSet shipments = pstmt.executeQuery();
	int check = 0;
	if(!shipments.next()){ // if no shipment with given id, add shipment
		out.println("<h2>shipmentId does not exist.</h2>");
		out.println("<a href='listShipment.jsp'>Go back</a>");
	}else{
		String SQL = "UPDATE shipment SET shipmentDesc = ? WHERE shipmentId = ?";


		PreparedStatement pst = con.prepareStatement(SQL);
		pst.setString(1,desc);
		pst.setInt(2,id);


		check = pst.executeUpdate();
	}
	if(check >0) {out.println("<h3>Shipment status updated.</h3>");
			out.println("<a href='listShipment.jsp'><button class='button'>List Shipments</button></a>");
		}
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
