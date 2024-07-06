<%@ page import="java.sql.*"%>
<%
   	String uname,psw,upin;
			uname=request.getParameter("uname");
			psw=request.getParameter("pass");
			upin=request.getParameter("pin");
            
		int flag=0;
		//out.println("<h1> "+uname+ " "+psw+"</h1>");
		Connection c=null;
			try{
			Class.forName("oracle.jdbc.OracleDriver");
			c=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","2566");
			Statement s=c.createStatement();
			ResultSet r=s.executeQuery("select * from customers where username like '"+uname+"'and pass like '"+psw+"'");
			//out.println("<h1> 2 Successfully registered with username"+uname+flag+"</h1>");
			if(r.next())
			{
                PreparedStatement pp = c.prepareStatement("update customers set pin=? where username like '"+uname+"'and pass like '"+psw+"'");
                pp.setString(1,upin);
                pp.executeUpdate();
                out.println("set Successfully");
				//session.setAttribute("user",uname);
				//response.sendRedirect("Home_Customer.jsp");
			
				
			}else{
				out.println("<br><h1 style='color:rgb(212, 13, 13);' > Failed to Login as Customer</h1>");
				//out.println("<a href='index.html'> Home </a><br><br>");
				//out.println("<a href='login.html'> Login </a><br><br>");
				//out.println("<a href='register.html'> Register </a><br><br>"); 
			}
			}catch(Exception ee)
			{
				out.println("<h1> 3 Successfully registered with username"+ee+flag+"</h1>");
			}

			//out.println("<h1> 4 Successfully registered with username"+uname+flag+"</h1>");
	 finally{
                c.close();
            }


%>