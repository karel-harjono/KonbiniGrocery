<%@ page import="java.util.HashMap" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ include file="jdbc.jsp" %>

<html>
<head>
    <title>Konbini Grocery - Product Information</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <style>
        @font-face{
            font-family: customFont;
            src: url(NikkyouSans-mLKax.ttf);
        }
        h1{
            text-align: center;
            font-family: customFont;
            font-size: 40px;
            padding: 8px;
            color: black;
        }
        h2, p{
            font-family: customFont;
		    font-size: 25px;
		    text-align: left;
            padding: 8px;
            color: black;
	    }
        p{
            font-family: sans-serif;
            font-size: 18px;
        }
        .button{
            font-family: sans-serif;
            font-size: 16px;
            text-align: center;
            padding: 4px;
            margin: 2px;
            transition-duration: 0.4s;
            cursor: pointer;
            background: #F5CEC5;
            float: left;
        }
        .button:hover{
            background-color: #FAAA96;
        }
        img{
            padding: 10px;
            margin: 4px;
        }
        a, a:hover{
            color: black;
        }
    </style>
</head>
<body>

<%@ include file="header.jsp" %>

<%
// Get product name to search for
String productId = request.getParameter("id");
NumberFormat currFormat = NumberFormat.getCurrencyInstance(Locale.US);
try 
{
    getConnection();
    // TODO: Retrieve and display info for the product

    String sql = "SELECT productName, productPrice, productImage, productImageURL FROM product WHERE ProductId = ?";
    PreparedStatement pstmt = con.prepareStatement(sql);
    pstmt.setString(1, productId);
    ResultSet rst = pstmt.executeQuery();
    while(rst.next()){
        String productName = rst.getString("productName");
	    Double productPrice = rst.getDouble("productPrice");
        String imageURL = rst.getString("productImageURL");
        String image = rst.getString("productImage");
        String link_image = "displayImage.jsp?id="+productId;
        
        out.println("<h2>"+productName+"</h2>");
        // TODO: If there is a productImageURL, display using IMG tag
        // TODO: Retrieve any image stored directly in database. Note: Call displayImage.jsp with product id as parameter.
        if (imageURL != null && image != null){
            out.println("<img src='" + imageURL + "'>");
            out.println("<img src='" + link_image + "'>");
        }
        else if (imageURL != null && image == null){
            out.println("<img src='" + imageURL + "'>");
        }
        else if (imageURL == null && image != null){
            out.println("<img src='" + link_image + "'>");
        }
        
        // TODO: Add links to Add to Cart and Continue Shopping
        String nameEncoded = java.net.URLEncoder.encode(productName, "UTF-8").replace("+","%20");
	    String link = "addcart.jsp?id="+productId+"&name="+nameEncoded+"&price="+productPrice;
        out.println("<p><b>Product ID: </b>"+productId+"</p><p><b>Price: </b>"+currFormat.format(productPrice)+"</p>");
	    out.println("<p><a href="+link+"><button class='button'><b>Add to Cart 🛒</b></button></a>");
        out.println("<a href=listprod.jsp><button class='button'><b>Continue Shopping 🛍 </b></button></a></p>");
    }
    
}
catch (Exception e)
{
    out.print(e);
}
finally
{
	closeConnection();
}
%>

</body>
</html>

