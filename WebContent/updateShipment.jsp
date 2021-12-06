<%@ include file="auth.jsp"%>
<%@ page import="java.text.NumberFormat" %>
<%@ include file="jdbc.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>Update Customer</title>
</head>
<body>
<%
try
{	// Load driver class
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
}
catch (java.lang.ClassNotFoundException e)
{
	out.println("ClassNotFoundException: " +e);
}


// Make connection
String url = "jdbc:sqlserver://db:1433;DatabaseName=tempdb;";
String uid = "SA";
String pw = "YourStrong@Passw0rd";

// Write query to retrieve all order summary records
try (Connection con = DriverManager.getConnection(url, uid, pw);
		Statement stmt = con.createStatement();)
{
	int id = request.getParameter("shipment id");
	String desc = request.getParameter("Shipment status");
	

	String SQL = "UPDATE customer SET shipmentDesc = ? WHERE shipmentId = ?";


	PreparedStatement pst = con.prepareStatement(SQL);
	pst.setString(1,desc);
	pst.setString(2,id);


	int check = pst.executeUpdate();
	if(check >0) out.println("shipment status updated");
	else out.println("failed to update shipment status");
}
catch (Exception e)
{
    out.print(e);
}



// Close connection
%>

</body>
</html>