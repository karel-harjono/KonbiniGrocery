<%@ include file="auth.jsp"%>
<%@ page import="java.text.NumberFormat" %>
<%@ include file="jdbc.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>Add Warehouse</title>
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
	int wid = request.getParameter("warehouse id");
	int pid = request.getParameter("product id");
	int quantity = request.getParameter("new quantity");
	double price = request.getParameter("new price");

	String SQL = "UPDATE productInventory SET quantity = ?, price = ? WHERE productId = ? AND warehouseId = ?";

	PreparedStatement pst = con.prepareStatement(SQL);
	pst.setInt(1,quantity); 
	pst.setDouble(2,price); 
	pst.setInt(3,pid);
	pst.setInt(4,wid);

	int check = pst.executeUpdate();
	if(check >0) out.println("product inventory in warehouse updated");
	else out.println("failed to update product inventory in warehouse");
}
catch (Exception e)
{
    out.print(e);
}



// Close connection
%>

</body>
</html>
