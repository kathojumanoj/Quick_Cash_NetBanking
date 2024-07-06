<%@ page import="java.sql.*"%>
<%
    String nam=request.getParameter("uid");
    
		Connection c=null;
			try{
			Class.forName("oracle.jdbc.OracleDriver");
			c=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","2566");
			Statement st=c.createStatement();
            
			PreparedStatement pp=c.prepareStatement("delete from customers where username like ?");
            pp.setString(1,nam);
            int f=pp.executeUpdate();
            st.executeUpdate("commit");
            if(f>0)
                response.sendRedirect("getCustomersDetails.jsp");
            else
                out.println("failsed ");
			 
			}catch(Exception ee)
			{
				out.println("<h1> 3 Successfully registered with username"+ee+"</h1>");
			}
			finally{
				c.close();
			}
%>