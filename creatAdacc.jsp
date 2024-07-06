<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="icon" type="image/x-icon" href="https://img.icons8.com/?size=512&id=13530&format=png">
    <title>creation</title>
</head>
<%@ page import="java.sql.*"%>
 <style>
        *{
            top:0;
            margin:0;
        }
        body{
            /* background-image: url(https://cdn.wallpapersafari.com/25/62/w8sEeg.jpg); */
            background-color: rgba(0, 0, 0, 0.808);
            background-size: 100%;
            background-position: fixed;
        }
        #hdiv{
            background-color: rgba(255, 159, 159, 0.929);
        }
        #im{
            border-radius: 10px;
            width: 100px;
            height: 90px;
            padding-top: 30px;
            
            
        }
        /* #ct{
            float: right;
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
        } */
        .indiv{
            
            color:bisque;
            padding: 10vh;
            margin:auto;
            font-family: Verdana, Geneva, Tahoma, sans-serif;
        }
        #time{
            padding: 20px;
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
            float: right;
        }
        .wel{
            padding-left: 120px;
            padding-top: 2vh;
            color:aqua;
        }
        .inner{
           display: flex;
        }
        
        .logo{
            padding-left: 60px;
            font-size: 28px;
            font-weight: bold;
        }
        #slog{
            font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;}
        #refs{
            padding-left: 20vh;
            padding-top: 5vh;
            /* border: 2px solid rgb(226, 218, 196); */
            color:rgb(255, 116, 116);
            font-size: 20px;
            
        }
        a{
            border: 1px solid rgb(248, 252, 246);
            border-radius: 15px;
            padding: 13px;
            color: rgb(127, 238, 255);
            text-decoration: none;
            margin-right: 10vh;
        }
        a:hover{
            background-color: rgb(255, 74, 158);
        }
    </style>
<body onload="display_ct()">
<div id="hdiv">
        <div id="time">
            <h2 id="ct"></h2><br>
            <h4>Make EveryThing Easy!</h4>
        </div>
       
         <div class="logo">
        <h2><img id="im" src="logo.png"></h2>
        <p id="slog" align="center">  Best Net Banking Services </p>
        </div>
    </div>
    <div class="indiv">
        <h1>Hello Good <span id="spp">hii</span></h1>
        <div class="wel">
            <h1> Welcome to Our Services !</h1>
            
             
<%
  String adminKey ="QU2176";
 String uname,psw,email,addr,gen,phno,holdername,adkey,bb,dob;
		holdername=request.getParameter("accname");
		adkey=request.getParameter("adminkey");
		//dob=request.getParameter("dob");
		phno=request.getParameter("pno");
		uname=request.getParameter("uname");
		psw=request.getParameter("pass");
		email=request.getParameter("email");
		addr=request.getParameter("address");
		gen=request.getParameter("gen");
		//bb=request.getParameter("bal");
		//bal=Float.parseFloat(bb);
		int flag=0;
		//out.println("<h1> 1 Successfully registered with username"+uname+"</h1>");
        java.sql.Connection c=null;
			try{
			Class.forName("oracle.jdbc.OracleDriver");
			c=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","2566");
			Statement st=c.createStatement();
			if(adminKey.equals(adkey)){
			PreparedStatement pp = c.prepareStatement("insert into adminqc values(?,?,?,?,?,?,?,?)");
			pp.setString(1,holdername);
			pp.setString(2,phno);
			pp.setString(3,uname);
			pp.setString(4,psw);
			pp.setString(5,addr);
			pp.setString(6,gen);
			pp.setString(7,adkey);
			pp.setString(8,email);
			flag=pp.executeUpdate();
			//out.println("<h1> 2 Successfully registered with username "+uname+"</h1>");
			
						
                if(flag>0){
				//RequestDispatcher rd = request.getRequestDispatcher("/index.html");
				out.println("<h1> Successfully registered with username : "+uname+"</h1>");
				//rd.include(request,response);
				//out.println("<a href='index.html'> Home </a>");
                }
			}
            else{
                out.println("<h1> InValid Admin Key </h1>");
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
			<div id="refs">

                <p>If you haven't Created Account ,</p><br>
                <a href="CreateAcc.html"> Create </a><br><br>

                <p>Login Here ,</p><br>
                <a href="login.html"> Login</a><br>
             </div>
        </div>
    </div>
</body>
<script type="text/javascript"> 
        function display_c(){
                mytime=setTimeout('display_ct()',1000)
        }

        function display_ct() {
                var x = new Date();
                var xx=x.toLocaleTimeString();
                var yy=x.toLocaleDateString();

                if(24>=x.getHours() && x.getHours()>=18)
                {
                    document.getElementById('spp').innerHTML = "Evening ";
                }
                else if(12>=x.getHours() && x.getHours()>=0)
                {
                    document.getElementById('spp').innerHTML = "Morning ";
                }
                else{
                    document.getElementById('spp').innerHTML = "AfterNoon ";
                }
                document.getElementById('ct').innerHTML = yy+" "+xx+" ";
                display_c();
        }
</script>
</html>