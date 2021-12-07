<style>
    @font-face{
        font-family: customFont;
        src: url(NikkyouSans-mLKax.ttf);
    }
    h1{
        text-align: center;
        font-family: customFont;
        font-size: 60px;
        padding:0%;
    }
    .a_header{
        color: black;
        text-decoration: none;
    }
    .a_header:hover{
        color:#FAAA96;
        text-decoration: none;
    }
    .upperright{
        font-family: sans-serif;
	    font-size: 18px;
	    text-align: left;
        font-weight: bold;
        color: black;
        float: right;
	}
</style>

<h1>
    <a class='a_header' href="index.jsp">&nbsp&nbsp&#9961 Konbini &#9961</a>
    <%
    // TODO: Display user name that is logged in (or nothing if not logged in)
	String userName = (String) session.getAttribute("authenticatedUser");
	if (userName != null)
		out.println("<a class='a_header upperright' href='customer.jsp'>Hello, "+userName+"!</a>");
    else
        out.println("<a class='a_header upperright' href='login.jsp'>Sign in&nbsp&nbsp</a>");
    %>
</h1>      
<hr>