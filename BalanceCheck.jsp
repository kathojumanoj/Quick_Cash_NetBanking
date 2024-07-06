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
        background-color: rgb(12, 12, 12);
         
    }
    #hdiv{ 
        width:100%;

    }
    #aa{
        
        border: 1px solid rgb(248, 252, 246);
	background-color: rgb(13, 12, 12);
	border-radius: 10px;
	padding: 7px;
	float: right;
	color: rgb(45, 227, 255);
	text-decoration: none;
	margin-right: 10vh;
    margin-top: 4px;
    }
    #time{
        /* background-color: blueviolet; */
        padding: 0px 15px;
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
 
        .bot {
            position: relative;
            bottom: 0;
            color:white;
            left: 0;
            width: auto;
            background-color: #f1f1f1;
            text-align: center;
            padding: 10px;
          }
          #lol{
            color: rgb(88, 255, 160);
          }
        input[type=text],input[type=password],select, textarea {
   
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            margin-top: 6px;
            margin-left: 14px;
            margin-bottom: 16px;
            resize: vertical;
        }
 
 input[type=submit],input[type=reset] {
   background-color: #04AA6D;
   color: white;
   padding: 12px 20px;
   border: none;
   margin:20px 35px;
   border-radius: 4px;
   cursor: pointer;
 }
 
 input[type=submit]:hover {
   background-color: #45a049;
 }
 input[type=reset]:hover {
   background-color: #ff0b0b;
 }
 
 .container {
   border-radius: 5px;
    margin:auto;
   /* width:  ; */ 
   height: auto;
   margin-top: 50px;
   background-color: #f2f2f2;
   padding: 50px;
 }
 label{
    font-size: large;
 }
 /* #btn{
    padding: 5px;
    width: auto;
    position: absolute;
    background-color: #45a049;
 } */
 /* .fff{
    margin-left: 60vh;
 } */
 #bala{
    color: #f2f2f2;
    font-size: 38px;
    text-align: center;
 }
 h4{
    color: #f2f2f2;
    font-size: 28px;
    text-align: center;
 }
 table {
            margin: 40px 0px;
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
            background-color: rgb(248, 243, 246);
            }
            th{
                background-color: rgb(129, 234, 255);
            }
            td, th {
            border: 1px solid #000000;
            text-align: left;
            padding: 8px;
            } 
</style>
</head>
<%!
    String fname="";
    float bal;
    int sendaccno;
    int flag=1;
    String pin;
%>
<body onload="display_ct()"> 
    <div id="hdiv">
        <div id="time"><br>
            <h2 id="ct"></h2> 
            <!-- <h5>Make EveryThing Easy!</h5> --><br>
            <h2 id="user">User <i class="fa fa-user"></i> : <% out.println(session.getAttribute("user"));%></h2><br>
             <a id="aa" href="lg.jsp">Logout <i class="fa fa-sign-out"></i></a> 
             <a id="aa" href="Home_Customer.jsp">Home</a>
            
        </div>
        <!-- <h1><img src="https://img.icons8.com/?size=512&id=13530&format=png" width="90px">Quick Cash </h1> -->
         <div class="logo">
        <h5 id="slog"><img id="im" src="logo.png"><center>Best Net Banking Services</center></h5> 
        <!-- <p id="slog" align="center"> Transfer Money Easliy With More Privacy & Best Net Banking Services </p> -->
        </div>
    </div>
    <% 
    Connection c=null;
    try{
        String un=(String)session.getAttribute("user");
        Class.forName("oracle.jdbc.OracleDriver");
        c=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","2566");
        Statement s=c.createStatement();
        ResultSet r=s.executeQuery("select * from customers where username like '"+un+"'");
        
        if(r.next())
        {
            fname=r.getString(1);
            bal=r.getFloat(9);
            sendaccno=r.getInt(10);
            pin=r.getString(12);
            session.setAttribute("pin",pin);
            
        }else{
            out.println("<br><h1 style='color:rgb(212, 13, 13);' > Failed to Login as Customer</h1>");
            //out.println("<a href='index.html'> Home </a><br><br>");
            //out.println("<a href='login.html'> Login </a><br><br>");
            //out.println("<a href='register.html'> Register </a><br><br>"); 
        }
        }catch(Exception ee)
        {
            out.println("<h1>ee</h1>");
        }
        finally{
            c.close();
        }
    %>
    <div class="indiv">
        <h1>Good <span id="spp"></span><span id="lol"><% out.println(fname);%></span>,</h1>
        <div class="wel">
            <h1> Transfer Your Money to Others Account </h1>
        </div>
    </div>
    <h2  id="bala">Avaliable Balance : &#8377; <span id="money">XXXX</span><button style="margin:10px; padding:6px;" onclick="bal()"><i style="font-size:24px" id="faf" class="fa">&#xf06e;</i></button></h2>
    <br>
    <h4> Last 5 Transcations ...</h4>

    <table>
        <tr>
            <th>Transcation ID</th>
            <th>Account</th>
            <th>Name</th>
            <th>Amount &#8377;</th>
            <th>Date </th>
            <th> Time </th>
            <th> Current Balance &#8377;</th>
        </tr>
        <%!
       
        int accnumber=0;
        
        String data,time;
    %>
    <%
   
    int flag=0;
    String fname=(String)session.getAttribute("user");
    //java.sql.Connection c=null;
        try{
        Class.forName("oracle.jdbc.OracleDriver");
        c=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","2566");
        Statement st=c.createStatement();
        ResultSet rrr=st.executeQuery("select accno,balance from customers where username like '"+fname+"'");
        if(rrr.next())
        {
            accnumber=rrr.getInt(1);
            bal=rrr.getFloat(2);
        }
        else{
            out.println("failed ");
        }

        ResultSet rs=st.executeQuery("select  * from transcations where (senderacc='"+accnumber+"'  or receiveracc='"+accnumber+"') and rownum<=5 order by tid desc ");
        
        while(rs.next())
        {
            if(rs.getInt(5)==accnumber)
            {
                //out.println("HII...");
                    // + creditedd....
      %>
              <tr>
                  <td><% out.println(rs.getInt(1)); %></td>
                  <td><% out.println(rs.getInt(2)); %></td>
                  <td><% out.println(rs.getString(3)); %></td>
                  <td style="color:rgb(35, 255, 11)">&#8377; + <% out.println(rs.getFloat(4)); %>CR</td>
                  <td><% 
                     data=rs.getTimestamp(7).toString();
                    out.println(data.substring(0,11)); %></td>
                    <td><%
                        out.println(data.substring(11,19));    %></td>
                  <td style="color:rgb(8, 8, 8);">&#8377;<% out.println(rs.getFloat(9)); %>/-</td>

              </tr>
               
            
          <%
            }
            else{
                    //out.println("else ihihi");
            %>
            <tr>
                  <td><% out.println(rs.getInt(1)); %></td>
                  <td><% out.println(rs.getInt(5)); %></td>
                  <td><% out.println(rs.getString(6)); %></td>
                  <td style="color:#fa0202">&#8377; - <% out.println(rs.getInt(4)); %>DR</td>
                  <td><% 
                     data=rs.getTimestamp(7).toString();
                    out.println(data.substring(0,11)); %></td>
                    <td><%
                        out.println(data.substring(11,19));    %></td>
                  <td style="color:rgb(10, 10, 10);">&#8377;<% out.println(rs.getFloat(8)); %>/-</td>

              </tr>
                <%
            }
             
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
 
    </table>
</body>

<script type="text/javascript">
    var t=0;
    var avbb=<% out.println(bal); %>;
    var pinn=<% out.println(pin); %>;
    //  var cip="#QCM$7B1A5";
     var cip = Math.random().toString(36).substring(2,10);
    function display_c(){
            mytime=setTimeout('display_ct()',1000)
    }
    document.getElementById('cap').innerHTML = cip;
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
    function bal()
    {
         
        if(t%2==0)
        {
        document.getElementById('money').innerHTML = <% out.println(bal); %>;
        document.getElementById('faf').innerHTML =  "&#xf070;";

            t=t+1;
        }
        else{
            document.getElementById('money').innerHTML = "XXXX";
            document.getElementById('faf').innerHTML =  "&#xf06e;";
            t=t+1;
        }
    }
     
</script>
</html>