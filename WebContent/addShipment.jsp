<%-- <%@ include file="auth.jsp"%> --%>
<%@ page import="java.text.NumberFormat" %>
<%@ include file="jdbc.jsp" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<!DOCTYPE html>
<html>
<head>
	<title>Add Shipment</title>
</head>
<body>
<%

// Write query to retrieve all order summary records
try
{
	getConnection();
	String desc = request.getParameter("shipmentDesc");
	int wid = Integer.parseInt(request.getParameter("warehouseId"));


	String SQL = "INSERT INTO shipment (shipmentDate, shipmentDesc, warehouseId) VALUES (?,?,?)";


	PreparedStatement pst = con.prepareStatement(SQL);

	java.util.Date utilDate = new java.util.Date();
    java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
	pst.setDate(1, sqlDate);
	pst.setString(2, desc);
	pst.setInt(3, wid);

	int check = pst.executeUpdate();

	if (check>0) out.println("add shipment successfully");
	else out.println("failed to add customer");
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
