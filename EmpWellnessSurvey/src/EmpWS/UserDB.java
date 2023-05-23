package EmpWS;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UserDB")
public class UserDB extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String  empid=request.getParameter("userid");
		String username=request.getParameter("usertxt");  		
		String url="jdbc:mysql://localhost:3306/empsurvey";
		String sql1="select * from user where empid=?";  
		String sql2="insert into user values(?,?)";			
		String sql3="select * from employee where emp_id=?"; 	
		String user="root";
		String pass="nrs@23#sheshvel";	
		
		try
		{
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,user,pass);	
			PreparedStatement st1=con.prepareStatement(sql1);
			PreparedStatement st3=con.prepareStatement(sql3);
			st1.setString(1,empid);
			st3.setString(1,empid);
			ResultSet rs1=st1.executeQuery();
			ResultSet rs3=st3.executeQuery();
			
			
			if(rs3.next()) 
			{
				if(rs1.next())
				{
					 out.println("<script>alert('You have already submitted your response! Thank you');</script>");
					 out.println("<script>location='User.jsp';</script>");
					 
				}
				else
				{
					PreparedStatement st2=con.prepareStatement(sql2);
					st2.setString(1,empid);
					st2.setString(2, username);
					st2.executeUpdate();
					response.sendRedirect("ObjQues.jsp");
				}
			}
			else
			{
				out.println("<script>alert('Employee does not exist!!');</script>");
				 out.println("<script>location='User.jsp';</script>");
			}
		
		}	
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
