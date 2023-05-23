<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="ObjQues.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee login</title>
<script>
history.forward();
function result()
{
	location.href="AdminLogin.jsp";
}
</script>
</head>

<body style="background-color:">

<form method="post" action="UserDB">
<h2 class="reg">LOGIN</h2>
<div class="container">
<div class="box">
	<label class="lbl">Employee ID: </label>
	<input type="text" class="txt" name="userid">
</div>
 <div class="box">
<label class="lbl">Name: </label> 
&emsp;&emsp;&emsp;
<input type="text" class="txt" name="usertxt">
	
</div> 
<div class="box">
	<input type="submit" class="subbtn" id="submitbtn" style="background-color:green; margin-left:70px; margin-top:20px;" >
</div>
	
</div>

</form>

<div class="admbtn">
<input type="button" onclick="result()" value="Admin Login" id="admbtn" class="subbtn">
</div>
</body>
</html>