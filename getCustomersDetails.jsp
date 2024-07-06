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
    margin-top: 3px;
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
            padding: 50px;
            margin: 40px 0px;
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
           
            background-color: rgb(210, 250, 255);
            }
            th{
                background-color: rgb(148, 253, 83);
                padding: 10px 0px;
                text-align: center;
            }
            td, th {
            border: 1px solid #fd4949;
            text-align: left;
            padding: 10px 0px;
            text-align: center;
            }
            button{
                padding: 2px;
                background-color: rgb(255, 29, 74);
                text-align: center;
            }
            button:hover{
                background-color: rgb(204, 187, 1);
            }
           
</style>
</head>
<%!
    String fname="";
    int accno;
    float bal;
    String uname,psw,email,addr,gen,phno,holdername,ano,bb,pin;
    Date dob;
%>
<body onload="display_ct()"> 
    <div id="hdiv">
        <div id="time"><br>
            <h2 id="ct"></h2> 
            <br>
            <h2 id="user">Admin <i class="fa fa-user"></i> : <% out.println(session.getAttribute("admin"));%></h2><br>
             <a id="aa" href="lg.jsp">Logout <i class="fa fa-sign-out"></i></a> 
             <a id="aa" href="Home_Admin.jsp">Home</a>
        </div>
        <!-- <h1><img src="https://img.icons8.com/?size=512&id=13530&format=png" width="90px">Quick Cash </h1> --> 
         <div class="logo">
        <h5 id="slog"><img id="im" src="logo.png"> <center>Best Net Banking Services</center></h5> 
        <!-- <p id="slog" align="center"> Transfer Money Easliy With More Privacy & Best Net Banking Services </p> -->
        </div>
    </div>
    <div style="float:right; padding:10px;">
     
    <label  style="padding:3px;">Search :</label><input id="sea" placeholder="username" style="padding:3px;" type="text"><button  style="padding:3px;" onclick="search()"><i class="fa fa-search"></i></button>
 
    </div>
    <table>
        <tr>
            <th>Holder Name</th>
            <th>Account Number</th>
            <th>DOB</th>
            <th>Aadhar No</th>
            <th>Pno</th>
            <th>Username</th>
            <th>Gender</th>
            <th>Address</th>
            <th>Balance</th>
            <th>Email</th>
            <th>Update</th>
            <th>Delete</th>
            
        </tr>
    <%
   
          int flag=0;
          java.sql.Connection c=null;
            fname=(String)session.getAttribute("admin");
              try{
              Class.forName("oracle.jdbc.OracleDriver");
             c=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","2566");
              Statement st=c.createStatement();
              ResultSet rs=st.executeQuery("select * from customers order by accno desc");
//              out.println(fname);
              
              while(rs.next())
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
            %>

                    <tr>
                        <td><% out.println(holdername); %></td>
                        <td><% out.println(accno); %></td>
                        <td><% out.println(dob); %></td>
                        <td><% out.println(ano); %></td>
                        <td><% out.println(phno); %></td>
                        <td><% out.println(uname); %></td>
                        <td><% out.println(gen); %></td>
                        <td><% out.println(addr); %></td>
                        <td><% out.println(bal); %></td>
                        <td><% out.println(email); %></td>
                        <td><button style="background-color: rgb(19, 218, 138);cursor: pointer;" onclick="hi('<%= uname %>')">Update</button></td>
                        <td><button onclick="dell('<%=uname%>')">Delete</button></td>
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
    var fool= "<%=fname%>";
    function display_c()
    {
            mytime=setTimeout('display_ct()',1000)
    }

    function display_ct() {
            var x = new Date();
            var xx=x.toLocaleTimeString();
            var yy=x.toLocaleDateString();
            document.getElementById('ct').innerHTML = yy+" "+xx+" ";
             
            display_c();
    }
    function dell(username_dd)
    {
 
        if(confirm("Are you sure to Delete the Account ?")==true)
        {
            window.location.replace("deleteCustomers.jsp?uid="+username_dd);
        }
        else{
            var c=1;
        }
 
        
    }
    function hi(username_dd)
    {
        alert("go to update");
        window.location.replace("updateCustomerBYAdmin.jsp?uid="+username_dd);
    }

    function search()
    {
        //alert("hi");
        var usern = document.getElementById("sea").value;
        //document.getElementById('hii').innerHTML=usern; 
         window.location.replace("searchCus.jsp?unn="+usern);
    }
</script>

</html>
