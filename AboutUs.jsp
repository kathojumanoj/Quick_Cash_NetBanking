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
        background-color: rgb(249, 248, 248);
        font-family: Arial, Helvetica, sans-serif;
  margin: 0;
    }
    #hdiv{ 
        width:100%;
        height: 190px;
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

 

html {
  box-sizing: border-box;
}

*, *:before, *:after {
  box-sizing: inherit;
}

.column {
   
  width: 100%;
  margin-bottom: 16px;
  padding: 10px 8px;
  
}

.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  margin: auto;

}

.about-section {
  padding: 50px;
  text-align: center;
  background-color: #6d9bff;
  color: rgb(3, 3, 3);
}

.container p,h2{
  padding: 10px 16px;
}
 
.title {
  color: rgb(240, 14, 14);
}

.button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
}

.button:hover {
  background-color: #555;
}

@media screen and (max-width: 650px) {
  .column {
    width: 100%;
    display: block;
  }
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
<br>
    <div class="about-section">
        <h1>Quick Cash</h1>
        <p>We are the Developers , <br>Quick Cash was an excellent Online Banking Platform.
            We provide you simple and safer money transfer and easy to manage your Account.

        </p>
        <!-- <p>Resize the browser window to see that this page is responsive by the way.</p> -->
      </div>
      <br>
      <div class="about-section">
        <h1>What is Net Banking ?</h1>
        <p>Net-banking, also known as internet banking, is an electronic system managed by banks which enables customers to access financial as well as non-financial banking products online. Earlier, customers had to visit the banks even for a small service. However, after the arrival of internet banking, almost all the services and products can be accessed online. From fund transfer to requesting demand draft, net-banking facilities, and all banking essentials. It is not just convenient but also a secure method of banking.

        </p>
        
      </div>
      
      <br>
      <div class="about-section">
        <h1> How does Net Banking Work ?</h1><br>
        <p align="left">To benefit from net-banking, customers are required to register for internet banking at the bank.
            
        </p>
        <ul style="text-align: left;">
            <li>Individuals having a savings account or current account at any bank can register for internet banking</li>
            <li>For net-banking to work properly, you need a personal computer, laptop or mobile, and good internet connection</li>
            <li>After registering, a unique customer ID and password are issued by the bank using which one can log-in to the net-banking portal</li>
        </ul>
        
      </div>
<br>
      <div class="about-section">
        <h1> Features of Net Banking</h1><br>
        <p align="left">Given below are some of the key features of Net Banking:
            
        </p>
        <ul style="text-align: left;">
            <li>Individuals having a savings account or current account at any bank can register for internet banking</li>
            <li>For net-banking to work properly, you need a personal computer, laptop or mobile, and good internet connection</li>
            <li>After registering, a unique customer ID and password are issued by the bank using which one can log-in to the net-banking portal</li>
        </ul>
        
      </div>
      <h2 style="text-align:center">My Project</h2>
      <center>
      <div class="row">
        <div class="column">
          <div class="card">
            <img src="ManojPic.jpg" alt="Manoj" style="width:30%">
            <div class="container">
              <h2>Kathoju Manoj</h2>
              <p class="title">Developer</p>
              <p>Pursuing Btech in LBRCE.</p>
              <p>kathojumanoj48@gmail.com</p>
              <p><a class="button" href="https://mail.google.com/">Contact</a></p>
            </div>
          </div>
        </div>
    </center>
         
    
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