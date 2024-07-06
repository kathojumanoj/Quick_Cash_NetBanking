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
        background-color: rgb(238, 235, 235);
         
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
    margin-top: 5px;
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

          table {
            margin: 40px 0px;
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
            background-color: rgb(220, 255, 190);
            }
            th{
                background-color: rgb(255, 177, 109);
            }
            td, th {
            border: 1px solid #f70707;
            text-align: left;
            padding: 8px;
            }
           
           
</style>
</head>
<%!
    String fname="";
%>
<body onload="display_ct()"> 
    <div id="hdiv">
        <div id="time"><br>
            <h2 id="ct"></h2> 
            <!-- <h5>Make EveryThing Easy!</h5> --><br>
            <h2 id="user">User <i class="fa fa-user"></i> : <% out.println(session.getAttribute("admin"));%></h2>
             <a id="aa" href="lg.jsp">Logout <i class="fa fa-sign-out"></i></a> 
             <a id="aa" href="Home_Admin.jsp">Home</a>
        </div>
        <!-- <h1><img src="https://img.icons8.com/?size=512&id=13530&format=png" width="90px">Quick Cash </h1> -->
         <div class="logo">
        <h5 id="slog"><img id="im" src="logo.png"><center>Best Net Banking Services</center></h5> 
        <!-- <p id="slog" align="center"> Transfer Money Easliy With More Privacy & Best Net Banking Services </p> -->
        </div>
    </div>
    
    <table>
        <tr>
            <th>Transcation ID</th>
            <th>Sender Acc No</th>
            <th>Sender Name</th>
            <th>Amount &#8377;</th>
            <th>Receiver Acc No</th>
            <th>Receiver Name</th>
            <th>Date & Time </th>
             
        </tr>
    <%
   
        int flag=0;
        String fname=(String)session.getAttribute("admin");
        java.sql.Connection c=null;
            try{
            Class.forName("oracle.jdbc.OracleDriver");
            c=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","2566");
            Statement st=c.createStatement();
            ResultSet rs=st.executeQuery("select * from transcations order by tid desc");
            
            while(rs.next())
            {
          %>
                  <tr>
                      <td><% out.println(rs.getInt(1)); %></td>
                      <td><% out.println(rs.getInt(2)); %></td>
                      <td><% out.println(rs.getString(3)); %></td>
                      <td>&#8377;<% out.println(rs.getInt(4)); %></td>
                      <td><% out.println(rs.getInt(5)); %></td>
                      <td><% out.println(rs.getString(6)); %></td>
                      <td><% out.println(rs.getTimestamp(7)); %></td>
                      
                  </tr>
                   
                
              <%
                 
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
    function display_c(){
            mytime=setTimeout('display_ct()',1000)
    }

    function display_ct() {
            var x = new Date();
            var xx=x.toLocaleTimeString();
            var yy=x.toLocaleDateString();
            document.getElementById('ct').innerHTML = yy+" "+xx+" ";
             
            display_c();
    }
</script>
</html>