<!DOCTYPE html>
<html>
<head>
<title>Customer Page</title>
</head>
<body>

<%@ include file="auth.jsp"%>
<%@ page import="java.text.NumberFormat" %>
<%@ include file="jdbc.jsp" %>

<%
	String userName = (String) session.getAttribute("authenticatedUser");
%>

<%
// Make connection
String url = "jdbc:sqlserver://db:1433;DatabaseName=tempdb;";
String uid = "SA";
String pw = "YourStrong@Passw0rd";

// Write query to retrieve all order summary records
try (Connection con = DriverManager.getConnection(url, uid, pw);
			Statement stmt = con.createStatement();){
		String SQL = "SELECT customerId, firstName, lastName, email, phonenum, address, city, state, postalCode, country, userid"
					+"FROM customer"
					+"WHERE customerId = ?";
		PreparedStatement pstmt = con.prepareStatement(SQL);
		pstmt.setString(1,userName);
		ResultSet rst = pstmt.executeQuery();
		ResultSetMetaData rstmd = rst.getMetaData();
		rst.next();
		out.println("<table border=\"1\">");
			for(int i = 1; i<= 11; i ++){
				out.println("<tr><th>" + rstmd.getColumnName(i)+ "</th><th>" + rst.getString(i)+"</th></tr>");
			}
			out.println("</table>");
}
	catch (Exception e)
	{
		out.print(e);
	}
// Make sure to close connection
%>

</body>
</html>