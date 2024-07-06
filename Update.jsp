<%@page import="java.sql.*"%>
<%
    float bal=0;
    String uname,psw,email,addr,gen,phno,holdername,ano,bb,dob;
		holdername=request.getParameter("accname");
		ano=request.getParameter("ano");
		dob=request.getParameter("dob");
		phno=request.getParameter("pno");
		uname=request.getParameter("uname");
		psw=request.getParameter("pass");
		email=request.getParameter("email");
		addr=request.getParameter("address");
		gen=request.getParameter("gen");
		bb=request.getParameter("bal");
		bal=Float.parseFloat(bb);
		int flag=0;
		//out.println("<h1> 1 Successfully registered with username"+uname+"</h1>");
        java.sql.Connection c=null;
			try{
			Class.forName("oracle.jdbc.OracleDriver");
			c=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","2566");
			Statement st=c.createStatement();
			PreparedStatement pp = c.prepareStatement("update customers set acname=?,aadhar=?,dob=?,pno=?,gender=?,address=?,balance=?,email=? where username like '"+uname+"'");
			pp.setString(1,holdername);
			pp.setString(2,ano);
			pp.setDate(3,java.sql.Date.valueOf(dob));
			pp.setString(4,phno);
			pp.setString(5,gen);
			pp.setString(6,addr);
			pp.setFloat(7,bal);
			pp.setString(8,email);

			flag=pp.executeUpdate();
			//out.println("<h1> 2 Successfully registered with username"+uname+flag+"</h1>");
			
						
			if(flag>0){
				//RequestDispatcher rd = request.getRequestDispatcher("/index.html");
				response.sendRedirect("getCustomersDetails.jsp");
				//rd.include(request,response);
				//out.println("<a href='index.html'> Home </a>");
			}
        }

			catch(Exception ee)
			{
				RequestDispatcher rd = request.getRequestDispatcher("/index.html");
				out.println("<br> ERROR :"+ee+"</h1>");
				//rd.forward(request,response);
			}
            finally{
                c.close();
            }
			//out.println("<h1> 4 Successfully registered with username"+uname+flag+"</h1>");
			
%>