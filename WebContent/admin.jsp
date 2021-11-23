<!DOCTYPE html>
<html>
<head>
<title>Administrator Page</title>
</head>
<body>


// TODO: Include files auth.jsp and jdbc.jsp
<%@ include file="auth.jsp"%>
<%@ include file="jdbc.jsp" %>
<%

boolean login = session.getAttribute("loggedIn") != null;

if(!login){
    out.println("You are not login into the session");
}
else{
    // TODO: Write SQL query that prints out total order amount by day
    out.print(<h2>Administrator Sales Report by Day</h2>);

    // Make connection
    String url = "jdbc:sqlserver://db:1433;DatabaseName=tempdb;";
    String uid = "SA";
    String pw = "YourStrong@Passw0rd";

    // Write query to retrieve all order summary records
    try (Connection con = DriverManager.getConnection(url, uid, pw);
            Statement stmt = con.createStatement();)
    {
        String SQL = "SELECT SUM(totalAmount) AS total, orderDate"
                    +"FROM orderSummary"
                    +"GROUP BY orderDate"
                    +"ORDER BY orderDate ASC";
        ResultSet rst = stmt.executeQuery(SQL);

        out.println("<table border = 1><tr><th>Order Date</th><th>Total Order Amount</th></tr>");
        while(rst.next()){
            out.print(<tr><td>+"rst.getDate(1)"+</td><td>+"rst.getDouble(2)"+</td></tr>);
        }   
        out.print(</table>);
    }
    catch (Exception e)
    {
        out.print(e);
    }
}
%>

</body>
</html>

