<%@ include file='jdbc.jsp' %>
<%
try{
    getConnection();
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM orderproduct");
    while(rs.next()){
        out.println("<p>");
        for(int i = 1; i < 5; i++)
            out.println(rs.getString(i));
        out.println("</p>");
    }
}catch(Exception e){out.println(e);}
%>