<!DOCTYPE html>
<html>
<head>
<title>Administrator Page</title>
</head>
<body>


// TODO: Include files auth.jsp and jdbc.jsp
<%@ include file="auth.jsp"%>
<%@ page import="java.text.NumberFormat" %>
<%@ include file="jdbc.jsp" %>
<%@ page language="java" import="java.io.*,java.sql.*"%>

<%
String userName = (String) session.getAttribute("authenticatedUser");
String thisisAdmin = (String) session.getAttribute("thisisAdmin");
boolean login = false;

%>

<%
if(userName == null && thisisAdmin == null){
    out.println("Log in to be able to acces this page");
    login = false;
}
else login = true;
%>

<%

String url = "jdbc:sqlserver://db:1433;DatabaseName=tempdb;";
String uid = "SA";
String pw = "YourStrong@Passw0rd";

String SQL = "SELECT orderDate, SUM(totalAmount) AS total"
            +"FROM orderSummary"
            +"GROUP BY orderDate";

if(login){
    if(userName.equals("arnold") && thisisAdmin.equals("arnold")){
        try (Connection con = DriverManager.getConnection(url, uid, pw);
            Statement stmt = con.createStatement();)
        {

        out.println("<h1>Administrator Sales Report by Day</h1>");
        out.println("<table border = 1>");
            
        PreparedStatement pstmt = con.prepareStatement(SQL);
        ResultSet rst = pstmt.executeQuery();
        out.println("<tr><th>Order Date</th><th>Total Order Amount</th></tr>");

        while(rst.next()) out.println("<tr><th>"+ rst.getString(1)+"</th><th> $"+ rst.getString(2)+"</th></tr>");
        out.println("</table>");
        }
        catch (Exception e)
        {
            out.print(e);
        }
    }
    else out.println("<h1>Error! No Admin Privelleges</h1>");
}
else out.println("<h1>Log in is needed</h1>");
%>
</body>
</html>

