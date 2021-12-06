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
	int id = request.getParameter("id");
	String prodName = request.getParameter("productName");
	double prodPrice = request.getParameter("prodPrice");
	String prodDesc = request.getParameter("prodDesc");
	int categoryId = request.getParameter("categoryId");

	String SQL = "UPDATE product SET productName = ?, productPrice = ?, productDesc = ?, categoryId = ? WHERE productId = ?";

	PreparedStatement pst = con.prepareStatement(SQL);
	pst.setString(1,name); 
	pst.setDouble(2,prodPrice);
	pst.setString(3,prodDesc);
	pst.setInt(4,categoryId);
	pst.setInt(5,id);

	int check = pst.executeUpdate();
	if(check >0) out.println("Warehouse updated");
	else out.println("failed to update warehouse");
}
catch (Exception e)
{
    out.print(e);
}



// Close connection
%>

</body>
</html>