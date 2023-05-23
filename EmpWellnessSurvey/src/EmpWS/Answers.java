package EmpWS;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

@WebServlet("/Answers")
public class Answers extends HttpServlet {

	
	public static int score;
	int flag;
	HttpSession session;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int ans1,ans2,ans3,ans4,wc;
		String lans="";
		score=0;
		session=request.getSession();
		PrintWriter out=response.getWriter();
		ans1=Integer.parseInt(request.getParameter("slider1"));
		ans2=Integer.parseInt(request.getParameter("slider2"));
		ans3=Integer.parseInt(request.getParameter("slider3"));
		ans4=Integer.parseInt(request.getParameter("slider4"));
		
		System.out.println(ans1+" "+ans2+" "+ans3+" "+ans4);
		if(ans1==0 || ans2==0 || ans3==0 || ans4==0)
		{		
			   out.println("<script>alert('Please enter your response!');</script>");
			   out.println("<script>location='ObjQues.jsp';</script>");
		}
	
		String url="jdbc:mysql://localhost:3306/empsurvey";
		String user="root";
		String pass="nrs@23#sheshvel";	
		String sqlins="insert into result values(?,?,?,?)";
		try
		{
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,user,pass);	
			PreparedStatement stins=con.prepareStatement(sqlins);
			stins.setInt(1,ans1);
			stins.setInt(2,ans2);
			stins.setInt(3,ans3);
			stins.setInt(4,ans4);	
			stins.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	/*	lans=request.getParameter("txtarea");*/
		
		
		wc=wordCount(lans);
		
		
		if(wc<1)
		{
			out.println("<script>alert('Please enter your response!');</script>");
			out.println("<script>location='ObjQues.jsp';</script>");

		}
		/*else
		{
			if(wc<=3)
				score+=2;
			else
				score+=5;
			
		}*/
		
		
		RequestDispatcher rd=request.getRequestDispatcher("DisplayQuesAns.jsp");
	    rd.include(request, response);
	
	}
	
//	public void points(int ans)
//	{
//		
//		if(ans==4)
//			score+=4;
//		else if(ans==3)
//			score+=3;
//		else if(ans==2)
//			score+=2;
//		else if(ans==1)
//			score+=1;
//			
//	}
	
	public static int wordCount(String str)									
	{
		String[] w=str.split(",");
		return w.length;
	}
			
}


