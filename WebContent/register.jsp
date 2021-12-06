<!DOCTYPE html>
<html>
<head>
        <title>Konbini Grocery Main Page</title>
        <style>
                @font-face{
                        font-family: customFont;
                        src: url(NikkyouSans-mLKax.ttf);
                }
                h1{
                        text-align: center;
                        font-family: customFont;
                        font-size: 50px;
                        padding: 10px 16px;
                }
                h2 {
                        text-align: center;
                        font-family: sans-serif;
                        font-size: 30px;
                }
                .button{
			font-family: sans-serif;
			font-size: 18px;
			text-align:center;
			padding: 8px;
			margin: 4px 2px;
			background: #F5CEC5;
			transition-duration: 0.4s;
			cursor: pointer;
		}
		.button:hover{
			background-color: #FAAA96;
		}
                a, a:hover{
                        color: black;
                }
        </style>
</head>
<body>

<form class="register" method="post" action="addCust.jsp">
    <p>
        <label>Username: </label><input class="" type="text" name="username" value="">
    </p>
    <p>
        <label>First Name: </label><input class="" type="text" name="firstName" value="">
    </p>
    <p>
        <label>Last Name: </label><input class="" type="text" name="lastName" value="">
    </p>
    <p>
        <label>Password: </label><input class="" type="password" name="password" value="">
    </p>
    <p>
        <label>Confirm password: </label><input class="" type="password" name="confirmPassword" value="">
    </p>
    <p>
        <label>Email: </label><input type="email" name="email" value="">
    </p>
    <p>
        <label>Phone Number: </label><input class="" type="tel" name="phoneNumber" value="">
    </p>
    <p>
        <label>Country: </label><input type="text" name="country" value="">
    </p>
    <p>
        <label>State/Province: </label><input type="text" name="state" value="">
    </p>
    <p>
        <label>City: </label><input type="text" name="city" value="">
    </p>
    <p>
        <label>Address: </label><input type="text" name="address" value="">
    </p>
    <p>
        <label>Zip/Postal Code: </label><input type="text" name="postalCode" value="">
    </p>
    <h2><input class="button" type="submit" name="sub"></h2>
</form>

</body>