<%@ page import="java.sql.*" %>
<%
  int accno=8712;
  
 String uname,email,phno,sub,msg;
    	phno=request.getParameter("pno");
    	uname=(String)session.getAttribute("user");
    	email=request.getParameter("email");
    	sub=request.getParameter("subject");
    	msg=request.getParameter("message");


		int flag=0;
		java.sql.Connection c=null;
		//out.println("<h1> 1 Successfully registered with username"+uname+"</h1>");
			try{
			Class.forName("oracle.jdbc.OracleDriver");
			c=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","2566");
			Statement st=c.createStatement();
			ResultSet rs=st.executeQuery("select count(*) from customercare");
			
			if(rs.next())
			{
				accno=accno+rs.getInt(1);
				//out.println(rs.getInt(1));
				//out.println(dob+" "+bal);
			}
			//out.println(accno);
			PreparedStatement pp = c.prepareStatement("insert into customercare values(?,?,?,?,?,?)");
			pp.setInt(1,accno);
			pp.setString(2,uname);
			pp.setString(3,email);
			pp.setString(4,sub);
			pp.setString(5,phno);
			pp.setString(6,msg);
			flag=pp.executeUpdate();
			//out.println("<h1> 2 Successfully registered with username"+uname+flag+"</h1>");
			
						
			if(flag>0){
				//RequestDispatcher rd = request.getRequestDispatcher("/index.html");
				out.println("<h1> your ( "+uname+" ) Query Recorded, we will solve issue as soon as Possible... </h1>");
				//rd.include(request,response);
				//out.println("<a href='index.html'> Home </a>");
			}
			
			
			// else{
				// out.println("<h1> Failed to register </h1>");
				// RequestDispatcher rd = request.getRequestDispatcher("/index.html");
				// rd.include(request,response);
				// //out.println("<a href='index.html'> Home </a>");
			// }
			 // st.executeUpdate("commit");
			 // st.executeUpdate("delete from customers");
			}catch(Exception ee)
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