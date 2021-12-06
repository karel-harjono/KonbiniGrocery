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
        <label>Username: </label><input class="" type="text" name="username" value="" required>
    </p>
    <p>
        <label>First Name: </label><input class="" type="text" name="firstName" value="" required>
    </p>
    <p>
        <label>Last Name: </label><input class="" type="text" name="lastName" value="" required>
    </p>
    <p>
        <label>Password: </label><input class="" type="password" name="password" value=""  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required>
    </p>
    <p>
        <label id="confirmPassword">Confirm password: </label><input class="" type="password" name="confirmPassword" value="" required>
    </p>
    <p>
        <label>Email: </label><input type="email" name="email" value="" required>
    </p>
    <p>
        <label>Phone Number: </label><input class="" type="tel" name="phoneNumber" placeholder="000-000-0000" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" required> format: 000-000-0000
    </p>
    <p>
        <label>Country: </label><input type="text" name="country" value="" required>
    </p>
    <p>
        <label>State/Province: </label><input type="text" name="state" value="" required>
    </p>
    <p>
        <label>City: </label><input type="text" name="city" value="" required>
    </p>
    <p>
        <label>Address: </label><input type="text" name="address" value="" required>
    </p>
    <p>
        <label>Zip/Postal Code: </label><input type="text" name="postalCode" value="" required>
    </p>
    <h2><input class="button" type="submit" name="sub"></h2>
</form>
<script type="text/javascript">
function checkPassword(){
    var pass = document.getElementByName("password");
    var confirmPass = document.getElementByName("confirmPassword");

    if(pass === confirmPass){
        document
        return false;
    }
}
</script>
</body>