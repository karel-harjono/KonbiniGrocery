<%-- <%@ include file="auth.jsp"%> --%>
<%@ page import="java.text.NumberFormat" %>
<%@ include file="jdbc.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>Add Customer</title>
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
	String first = request.getParameter("firstName");
	String last = request.getParameter("lastName");
	String email = request.getParameter("email");
	String phone = request.getParameter("phoneNumber");
	String address = request.getParameter("address");
	String city = request.getParameter("city");
	String state = request.getParameter("state");
	String postal = request.getParameter("postalCode");
	String country = request.getParameter("country");
	String userId = request.getParameter("username");
	String password = request.getParameter("password");


	String SQL = "INSERT INTO customer (firstName, lastName, email, phonenum, address, city, state, postalCode, country,userid,password) VALUES (?,?,?,?,?,?,?,?,?,?,?)";


	PreparedStatement pst = con.prepareStatement(SQL);
	pst.setString(1,first);
	pst.setString(2,last);
	pst.setString(3,email);
	pst.setString(4,phone);
	pst.setString(5,address);
	pst.setString(6,city);
	pst.setString(7,state);
	pst.setString(8,postal);
	pst.setString(9,country);
	pst.setString(10,userId);
	pst.setString(11,password);


	int check = pst.executeUpdate();

	if(password != null) {session.setAttribute("loginMessage", null); response.sendRedirect("login.jsp");}
	else out.println("failed to add customer");
}
catch (Exception e)
{
    out.print(e);
}



// Close connection
%>

</body>
</html>
