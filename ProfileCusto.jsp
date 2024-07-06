<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="https://img.icons8.com/?size=512&id=13530&format=png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="jaffa.css">

    <title>transfer$</title>
</head>
<style>
    
    body{
        background-color: black;
         
    }
    #hdiv{ 
        width:100%;

    }
    #aa{
       
        border: 1px solid rgb(248, 252, 246);
	background-color: black;
	border-radius: 10px;
	padding: 7px;
	float: right;
	color: rgb(45, 227, 255);
	text-decoration: none;
	margin-right: 10vh;
    margin-top: 8px;
    }
    #time{
        /* background-color: blueviolet; */
        padding: 0px 12px;
    }
    /* #user{

    } */
    #user:hover{
        /* background-color: black; */
        color: rgb(8, 248, 12);
    }
    #im{
        border-radius: 30px;
        /* padding: 10px; */
        /* float:left; */
        height:100px;
    }
    #span{
        color:cornflowerblue;
    }
 
    #slog{
	font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;}
/* Create three equal columns that floats next to each other */
 
 
          #lol{
            color: rgb(88, 255, 160);
          }

          table {
            margin: 40px 0px;
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
            background-color: rgb(243, 255, 251);
            }
            th{
                border: 1px solid #dddddd;
            text-align: center;
            padding: 8px;
            background-color: rgb(249, 213, 107);
;
            }
            td {
            border: 1px solid #050c0a;
            background-color: rgb(255, 164, 249);

            text-align: center;
            padding: 8px;
            }

           
           
</style>
</head>
<%!
    //String fname=(String)session.getAttribute("user");
    int accno;
    float bal;
    String uname,psw,email,addr,gen,phno,holdername,ano,bb,pin;
    Date dob;
%>
<body onload="display_ct()"> 
    <div id="hdiv">
        <div id="time"><br>
            <h2 id="ct"></h2> 
            <!-- <h5>Make EveryThing Easy!</h5> --><br>
            <h2 id="user">User <i class="fa fa-user"></i> : <% out.println(session.getAttribute("user"));%></h2>
             <a id="aa" href="lg.jsp">Logout <i class="fa fa-sign-out"></i></a> 
             <a id="aa" href="Home_Customer.jsp">Home</a>
        </div>
        <!-- <h1><img src="https://img.icons8.com/?size=512&id=13530&format=png" width="90px">Quick Cash </h1> -->
         <div class="logo">
        <h5 id="slog"><img id="im" src="logo.png"> <center> Best Net Banking Services</h5> </center>
        <!-- <p id="slog" align="center"> Transfer Money Easliy With More Privacy & Best Net Banking Services </p> -->
        </div>
    </div>
    
    <%
   
          int flag=0;
          String fname=(String)session.getAttribute("user");
          java.sql.Connection c=null;
              try{
              Class.forName("oracle.jdbc.OracleDriver");
              c=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","2566");
              Statement st=c.createStatement();
              ResultSet rs=st.executeQuery("select * from customers where username like '"+fname+"'");
              
              if(rs.next())
              {
                   holdername=rs.getString(1);
                   ano=rs.getString(2);
                   dob=rs.getDate(3);
                   phno=rs.getString(4);
                   uname=rs.getString(5);
                   psw=rs.getString(6);
                   gen=rs.getString(7);
                   addr=rs.getString(8);
                   bal=rs.getFloat(9);
                   accno=rs.getInt(10);
                   email=rs.getString(11);
                   pin=rs.getString(12);
                   
              }
            
              }catch(Exception ee)
              {
                 // RequestDispatcher rd = request.getRequestDispatcher("/index.html");
                  out.println("<br> ERROR :"+ee+"</h1>");
                  //rd.forward(request,response);
              }
              finally{
                c.close();
            }
              
              
  %>
  <table>
    <tr>
        <th>Catergories</th>
        <th>Details</th>
      </tr>
   
    <tr>
      <td>Account Holder Name</td>
      <td><% out.println(holdername); %></td>
    </tr>
    <tr>
        <td>Aadhar Card Number </td>
        <td><% out.println(ano); %></td>
    </tr>
    <tr>
        <td>Date of Birth </td>
        <td><% out.println(dob); %></td>
    </tr>
    <tr>
        <td>Phone Number</td>
        <td><% out.println(phno); %></td>
    </tr>
    <tr>
        <td>Username</td>
        <td><% out.println(uname); %></td>
    </tr>
    <tr>
        <td>Password</td>
        <td><% out.println(psw); %></td>
    </tr>
    <tr>
        <td>Gender</td>
        <td><% out.println(gen); %></td>
    </tr>
    <tr>
        <td>Address</td>
        <td><% out.println(addr); %></td>
    </tr>
    <tr>
        <td>Balance( &Rupee; )</td>
        <td>&#8377;<% out.println(bal); %></td>
    </tr>
    <tr>
        <td>Account Number </td>
        <td><% out.println(accno); %></td>
    </tr>
    <tr>
        <td>Email @ </td>
        <td><% out.println(email); %></td>
    </tr>
    <tr>
        <td>Security PIN </td>
        <td><% out.println(pin); %></td>
    </tr>
  </table>
    
   
</body>
<script type="text/javascript"> 
    function display_c(){
            mytime=setTimeout('display_ct()',1000)
    }

    function display_ct() {
            var x = new Date();
            var xx=x.toLocaleTimeString();
            var yy=x.toLocaleDateString();
            document.getElementById('ct').innerHTML = yy+" "+xx+" ";
            // if(24>=x.getHours() && x.getHours()>=18)
            // {
            //     document.getElementById('spp').innerHTML = "Evening ";
            // }
            // else if(12>=x.getHours() && x.getHours()>=0)
            // {
            //     document.getElementById('spp').innerHTML = "Morning ";
            // }
            // else{
            //     document.getElementById('spp').innerHTML = "AfterNoon ";
            // }
            // document.getElementById('ct').innerHTML = yy+" "+xx+" ";
            display_c();
    }
</script>
</html>