<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="ObjQues.css">

<script>
history.forward(); 
</script>
<title>Employee wellness survey</title>
</head>
<body>

	<form method="post" action="Answers">
	<div class="header">
		<p class="heading">EMPLOYEE  WELLNESS  SURVEY</p>
	</div>
	<%
	
		String url="jdbc:mysql://localhost:3306/empsurvey";
		String sql="select * from emp";
		String user="root";
		String pass="nrs@23#sheshvel";	
		
		int i=0;
		String ques[]=new String[5]; 
		String str="";
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,user,pass);
			PreparedStatement st=con.prepareStatement(sql);
			ResultSet rs=st.executeQuery();
		
			
			while(rs.next()) 
			{
				
				 ques[i]=rs.getString(1);
				 i++;
		 	}
		}
		catch(Exception e)
		{
			
		}%> 
		
		
	
	<div class="questions">
	
		<label><% out.println(ques[0]); %></label><br>
		<div class="slider">
		<label class="labels">Dissatisfactory</label><label class="labels">Averagely Satisfactory</label>
		<label class="labels">Satisfactory</label><label class="labels">Highly Satisfactory </label>
	
			<input type="range" name="slider1" id="slider1" min="0" max="4" value="0" step="1">	
		 </div><br>
		
		
		 
		 <label><% out.println(ques[1]);%></label>
		 	<div class="slider">
	<label class="labels">Dissatisfactory</label><label class="labels">Averagely Satisfactory</label>
		<label class="labels">Satisfactory</label><label class="labels">Highly Satisfactory </label>
		
			<input type="range" name="slider2" id="slider2" min="0" max="4" value="0" step="1">	
		 </div><br>
		 
		
		
		  <label><% out.println(ques[2]); %></label>
		 	<div class="slider">
		<label class="labels">Dissatisfactory</label><label class="labels">Averagely Satisfactory</label>
		<label class="labels">Satisfactory</label><label class="labels">Highly Satisfactory </label>
		
			<input type="range" name="slider3" min="0" id="slider3" max="4" value="0" step="1">	
		 </div><br>
	
		  
		
		   <label><% out.println(ques[3]); %></label>
		 	<div class="slider">
		<label class="labels">Dissatisfactory</label><label class="labels">Averagely Satisfactory</label>
		<label class="labels">Satisfactory</label><label class="labels">Highly Satisfactory </label>
		
			<input type="range" name="slider4" min="0" max="4" id="slider4" value="0" step="1">	
		 </div>
		 
		 <br>
		 
		
		<label><% out.println(ques[4]); %></label>
		 <div class="slider">
		 	<textarea rows="7" name="txtarea" cols="50"></textarea>
		 	
		 </div><br><br>
		<div class="btn">
			<input type="submit" class="subbtn" onclick="sub()" value="SUBMIT">
			<input type="reset"	 class="resbtn" value="RESET">
			
		</div>
		
		 
		
	
		
	</div>
			
	</form>

</body>
</html>