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
>%

<%

// Make connection
String url = "jdbc:sqlserver://db:1433;DatabaseName=tempdb;";
String uid = "SA";
String pw = "YourStrong@Passw0rd";

int cid = request.getParameter("customerId");
boolean login = session.getAttribute("loggedIn") != null;

if (!login) out.println("not login into the session");
else if (cid == null) out.println("invalid customer id");
else {
	// Write query to retrieve all order summary records
	try (Connection con = DriverManager.getConnection(url, uid, pw);
			Statement stmt = con.createStatement();)
	{
		String SQL = "SELECT customerId, firstName, lastName, email, phonenum, address, city, state, postalCode, country, userid"
					+"FROM customer"
					+"WHERE customerId = ?";
		PreparedStatement pstmt = con.prepareStatement(SQL);
		pstmt.setInt(1,cid);
		ResultSet rst = pstmt.executeQuery();
		while(rst.next()){
			out.println("<table border = 1><tr><th>+Id+</th><td>+"cid"+</td></tr>"
						+"<tr><th>+First Name+</th><td>+"rst.getString(1)"+</td></tr>"
						+"<tr><th>+Last Name+</th><td>+"rst.getString(2)"+</td></tr>"
						+"<tr><th>+Email+</th><td>+"rst.getString(3)"+</td></tr>"
						+"<tr><th>+Phone+</th><td>+"rst.getString(4)"+</td></tr>"
						+"<tr><th>+Address+</th><td>+"rst.getString(5)"+</td></tr>"
						+"<tr><th>+City+</th><td>+"rst.getString(6)"+</td></tr>"
						+"<tr><th>+State+</th><td>+"rst.getString(7)"+</td></tr>"
						+"<tr><th>+Postal Code+</th><td>+"rst.getString(8)"+</td></tr>"
						+"<tr><th>+Country+</th><td>+"rst.getString(9)"+</td></tr>"
						+"<tr><th>+User id+</th><td>+"rst.getString(10)"+</td></tr></table>"
						);
		}	
	}
	catch (Exception e)
	{

		out.print(e);
	}
}
// Make sure to close connection
%>

</body>
</html>

