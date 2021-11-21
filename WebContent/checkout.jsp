<!DOCTYPE html>
<html>
<head>
<title>Konbini Grocery CheckOut Line</title>
<style>
    @font-face{
            font-family: customFont;
            src: url(NikkyouSans-mLKax.ttf);
    }
    h1{
            display: block;
            text-align: left;
            font-family: customFont;
            font-size: 30px;
            padding: 0px;
    }
    .button, input{
        font-family: sans-serif;
        font-size: 16px;
        text-align:center;
        padding: 8px;
        margin: 4px 2px;
        background: #F5CEC5;
        transition-duration: 0.4s;
        cursor: pointer;
    }
    .input2{
        background: white;
        text-align: left;
        font-size: 18px;
    }
    .button:hover, input:hover{
        background-color: #FAAA96;
    }
    .input2:hover{
        background-color: #FCFBF6;
    }
</style>
</head>
<body>

<h1>Enter your customer id to complete the transaction:</h1>

<form method="get" action="order.jsp">
<input type="text" name="customerId" size="50" class="input2">
<input type="submit" value="Submit"><input type="reset" value="Reset">
</form>

<a href=index.jsp><button class='button'><b>Main Menu &#127968</b></button></a>
<a href=showcart.jsp><button class='button'><b>Your Cart &#128722</b></button></a>

</body>
</html>

