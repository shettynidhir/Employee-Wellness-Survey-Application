<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="ObjQues.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>
history.forward();

function check()
{
	
	user=document.getElementById("user").value;
	pass=document.getElementById("pass").value;
	
	console.log(user);
	console.log(pass);
	
	if(user=="admin" && pass=="dedalus#23")
	{
		console.log("Hello");
		document.location.href="Result.jsp";
	}
	else
	{
		alert('Invalid credentials!!');
		document.location.href='AdminLogin.jsp';
		
	}
}

</script>
</head>


<body>
<%
String url="jdbc:mysql://localhost:3306/empsurvey";
		String user="root";
		String pass="nrs@23#sheshvel";	
		String sql1="select Q1 as Val1, count(Q1) as Count1 from result group by Q1 order by Q1 desc";
		String sql2="select Q2 as Val2, count(Q2) as Count2 from result group by Q2 order by Q2 desc";
		String sql3="select Q3 as Val3, count(Q3) as Count3 from result group by Q3 order by Q3 desc";
		String sql4="select Q4 as Val4, count(Q4) as Count4 from result group by Q4 order by Q4 desc";
		
		int[] q1=new int[4];
		int[] q2=new int[4];
		int[] q3=new int[4];
		int[] q4=new int[4];
		
		int i=0;
	//session.setAttribute("user",name);  
		try
		{
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,user,pass);	
			
			PreparedStatement st1=con.prepareStatement(sql1);
			PreparedStatement st2=con.prepareStatement(sql2);
			PreparedStatement st3=con.prepareStatement(sql3);
			PreparedStatement st4=con.prepareStatement(sql4);
			
			
			
			ResultSet rs1=st1.executeQuery();
			ResultSet rs2=st2.executeQuery();
			ResultSet rs3=st3.executeQuery();
			ResultSet rs4=st4.executeQuery();
			
			while(rs1.next())
			{
				int count=rs1.getInt("Count1");
				q1[i]=count;
				System.out.println("Inside: "+q1[i]);
				i++;
			
			}
			i=0;
			while(rs2.next())
			{
				int count=rs2.getInt("Count2");
				q2[i]=count;
				System.out.println("Inside: "+q2[i]);
				i++;
			
			}
			i=0;
			while(rs3.next())
			{
				int count=rs3.getInt("Count3");
				q3[i]=count;
				System.out.println("Inside: "+q3[i]);
				i++;
			
			}
			i=0;
			while(rs4.next())
			{
				int count=rs4.getInt("Count4");
				q4[i]=count;
				System.out.println("Inside: "+q4[i]);
				i++;
			
			}
			
			session.setAttribute("q1", q1);
			session.setAttribute("q2", q2);
			session.setAttribute("q3", q3);
			session.setAttribute("q4", q4);
			
			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}%>
<form>
<h2 class="reg" style="margin-left:580px;">ADMIN LOGIN</h2>
<div class="container">
<div class="box">
	<label class="lbl">Username: </label>
	<input type="text" id="user" class="txt" name="adm_user">
</div>
 <div class="box">
<label class="lbl" style=" margin-left:30px;">Password: </label> 

<input type="password" id="pass" style=" margin-right:30px;" class="txt" name="adm_pass">
	
</div> 
<div class="box">
	<input type="button" value="Submit" onclick="check()" class="subbtn" id="submitbtn"
	 style="background-color:green; margin-left:70px; margin-top:20px;">
</div>
	
</div>
</div>
</form>




</body>
</html>