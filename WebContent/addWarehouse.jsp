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
	String name = request.getParameter("warehouseName");
	String SQL = "INSERT INTO warehouse (warehouseName) VALUES (?)";
	PreparedStatement pst = con.prepareStatement(SQL);
	pst.setString(1,name);

	int check = pst.executeUpdate();

	if(check >0) out.println("new warehouse added");
	else out.println("failed to add warehouse");
}
catch (Exception e)
{
    out.print(e);
}



// Close connection
%>

</body>
</html>