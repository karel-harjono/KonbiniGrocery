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
    a{
        color: black;
        text-decoration: none;
    }
    a:hover{
        color:#FAAA96;
    }
    .upperright{
        font-family: sans-serif;
	    font-size: 18px;
	    text-align: left;
        color: black;
        float: right;
	}
</style>

<h1>
    <a href="index.jsp">&nbsp&nbsp&#9961 Konbini &#9961</a>
    <%
    // TODO: Display user name that is logged in (or nothing if not logged in)
	String userName = (String) session.getAttribute("authenticatedUser");
	if (userName != null)
		out.println("<a class='upperright' href='customer.jsp'>Hello, "+userName+"!</a>");
    else
        out.println("<a class='upperright' href='login.jsp'>Sign in&nbsp&nbsp</a>");
    %>
</h1>      
<hr>