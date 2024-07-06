<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>loginValid</title>
	<link rel="stylesheet" type="text/css" href="loll.css">
</head>
<%@ page import="java.sql.*"%>


<body onload="display_ct()">
	<div id="hdiv">
		<div id="time">
			<h2 id="ct"></h2><br>
			<h4>Make EveryThing Easy!</h4>
		</div>
		 
		 <div class="logo">
		<h2><img id="im" src="logo.png"></h2>
		<p id="slog" align="center"> Best Net Banking Services </p>
		</div>
	</div>
	<a href="index.html">Home</a>
	 
	<%
   String uname,psw;
			uname=request.getParameter("uname");
			psw=request.getParameter("pass");
		int flag=0;
		Connection c=null;
		//out.println("<h1> "+uname+ " "+psw+"</h1>");
			try{
			Class.forName("oracle.jdbc.OracleDriver");
			c=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","2566");
			Statement s=c.createStatement();
			ResultSet r=s.executeQuery("select * from adminqc where username like '"+uname+"'and pass like '"+psw+"'");
			//out.println("<h1> 2 Successfully registered with username"+uname+flag+"</h1>");
			if(r.next())
			{
				//out.println("<h1> 1111Successfully Logged in with username :"+uname+"</h1>");
				//RequestDispatcher rd = request.getRequestDispatcher("/login.html");
				//out.println("<h1> 1111Successfully Logged in with username :"+uname+"</h1>");

                // WE NEED SHOW HERE FORWARD TO ADMIN HOME OF BANK >>>>
				out.println("<h1> Ok!...</h1>");

				session.setAttribute("admin",uname);
				response.sendRedirect("Home_Admin.jsp");
				//out.println("<a href='index.html'> Home </a>");
				
			}else{
				out.println("<br><h1 style='color:rgb(50, 68, 255);' > Failed to Login as ADMIN</h1>");
				//RequestDispatcher rd = request.getRequestDispatcher("/login.html");
				//rd.include(request,response);
				//out.println("<a href='index.html'> Home </a><br><br>");
				//out.println("<a href='login.html'> Login </a><br><br>");
				//out.println("<a href='register.html'> Register </a><br><br>"); 
			}
			}catch(Exception ee)
			{
				out.println("<h1> 3 Successfully registered with username"+ee+flag+"</h1>");
			}
			finally{
				c.close();
			}
			//out.println("<h1> 4 Successfully registered with username"+uname+flag+"</h1>");
%>
	<br>
	<h1 id="fed"></h1>
	  <div class="form-body">
		<div class="button-bd">
		  <div id="btn"></div>
		  <button type="button" class="toggle" onclick="login()">Login</button>
		  <button type="button" class="toggle" onclick="reg()">Admin</button>
		</div>
		
		<form id="login" class="formcss" action="loginvalid.jsp" name="myform" onsubmit="return(valid())">
		  <input class="inputcss" type="text" name="uname" placeholder="username" > 
		  <input class="inputcss" type="password" name="pass" placeholder="password" >
		   
		 <input class="sub" type="submit" name="check" value="Login"> 
		</form>
		<form id="reges" class="formcss" action="loginAdminvalid.jsp">
		  <input class="inputcss" type="text" name="uname" placeholder="username" required>
		  <input class="inputcss" type="password" name="pass" placeholder="password" required> 
		  <input class="sub" type="submit" name="check" value="Login as Admin"> 
		</form>
	  </div>



</body>
	<script src="pro.js"></script>
</html>