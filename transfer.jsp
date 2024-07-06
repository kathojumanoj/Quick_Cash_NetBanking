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
    <h2  style="float:right; color:rgb(140, 255, 151); margin-right: 20px;">Avaliable Balance : &#8377; <span id="money">XXXX</span><button style="margin:10px; padding:6px;" onclick="bal()"><i style="font-size:24px" id="faf" class="fa">&#xf06e;</i></button></h2>
    <br>
    <!-- <h1 id="resp1" style="color:#ff0808"></h1>
    <h1 id="resp2" style="color:#fa0a0a"></h1> -->
    <div class="container">
        <h2 align="center">Transfer Details </h2><br>
        <form class="fff" action="Moneytrasfer.jsp" name="myform" onsubmit="return valid()">
         
          
          <label for="fname">Send To(Acc No)&nbsp;&nbsp;&nbsp;</label>
          <input type="text" id="fname" name="r_accno" placeholder="account No"><br>
          <p id="resp1" style="color:#fa0a0a; font-size:22px;"></p>


          <label for="fname">Name of Receiver&nbsp;&nbsp;&nbsp;</label>
          <input type="text" id="fname" name="uname" placeholder="name"><br>

          <label for="fname">Amount &#8377;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</label>
          <input type="text" id="fname" name="amount" placeholder="amount"><br>
          
          <p id="resp2" style="color:#fa0a0a; font-size:22px;"></p>
           
          <label > Captcha  &nbsp;&nbsp;&nbsp;:</label> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<label id="cap" for="lname" style="font-size:27px;"></label><br><br>
          <label for="fname">Enter Captcha &nbsp;&nbsp;&nbsp;</label>
          <input type="text" id="fname" name="cappu" placeholder="Captcha"><br>
          <p id="resp3" style="color:#ff0808; font-size:22px;"></p>

          <label for="lname"> PIN  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</label>
          <input type="password" id="lname" name="pin" placeholder="Security Pin"><br>
          <p id="resp4" style="color:#ff0808; font-size:22px;"></p>
            
          <input type="reset" value="Reset"> 
          <input type="submit" value="Submit">
        </form>
    <!-- <br><br>
    <div class='bot' style="width:auto;height:100px;background-color:rgba(0, 209, 198, 0.447);">
        <br><br><br>
        <p class="end" style="color: rgb(198, 255, 106);font-size:19px;">Quick Cash &ensp;|  Website Terms of Use | Accessibility Information<br>

            &copy 2023. mightyDeveloper . All rights reserved.</p>
    </div> -->
    

     
    
   
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
    function  valid() {
		// body...
		let p=document.myform.cappu.value;
        let bb=document.myform.amount.value;
        let accnumber=document.myform.r_accno.value;
        let upin=document.myform.pin.value;

        // <%
        // try{
         
        // Class.forName("oracle.jdbc.OracleDriver");
        // Connection c=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","2566");
        // Statement s=c.createStatement();
        //     ResultSet rc=s.executeQuery("select * from customers where accno like '"+accnumber+"'");
        //     if(rc.next())
        //     {
        //         flag=1;
        //     }
        // }catch(Exception ee)
        // {
        //     out.println("<h1>ee</h1>");   
        // }
        // %>
        let checkacc=<% out.println(flag); %>;
        if(checkacc==0)
        {
            document.getElementById('resp1').innerHTML = "* Account Number Not Valid *"+accnumber;
        }
        else{
            document.getElementById('resp1').innerHTML = "";

        }
        if(bb==0 || bb=="")
        {
            document.getElementById('resp2').style.color="red";
            document.getElementById('resp2').innerHTML = "* Check  Balance Once *";
            return false;

        }
        else if(avbb<bb || avbb<0)
        {
            document.getElementById('resp2').style.color="red";
            document.getElementById('resp2').innerHTML = "* Insufficient Balance *";
            return false;
            
        }
        else{
            document.getElementById('resp2').style.color="green";
            document.getElementById('resp2').innerHTML = "Ok!";

        }
        if(p!=cip)
		{
            document.getElementById('resp3').style.color="red";

			document.getElementById('resp3').innerHTML = "* Invalid Captcha *";
            return false;
		}
        else{
            document.getElementById('resp3').style.color="green";
			document.getElementById('resp3').innerHTML = "Ok!";
            
        }
        if(pinn!=upin)
        {
            document.getElementById('resp4').style.color="red";
			document.getElementById('resp4').innerHTML = "* Invalid set PIN *";
            return false;
        }
        else{
            document.getElementById('resp4').style.color="green";
			document.getElementById('resp4').innerHTML = "Ok!";

        }
        
         
	}
</script>
</html>