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
    margin-top: 7px;
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
  input[type=text],input[type=password],select, textarea {
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}

input[type=submit],input[type=reset] {
  background-color: #04AA6D;
  color: white;
  padding: 12px 20px;
  border: none;
  margin:0px 30px;
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
  margin-top: 50px;
  background-color: #f2f2f2;
  padding: 20px;
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
            <h2 id="user">User <i class="fa fa-user"></i> : <% out.println(session.getAttribute("user"));%></h2>
             <a id="aa" href="lg.jsp">Logout <i class="fa fa-sign-out"></i></a> 
             <a id="aa" href="Home_Customer.jsp">Home</a>
        </div>
        <!-- <h1><img src="https://img.icons8.com/?size=512&id=13530&format=png" width="90px">Quick Cash </h1> -->
         <div class="logo">
        <h5 id="slog"><img id="im" src="logo.png"> <center>Best Net Banking Services</center></h5> 
        <!-- <p id="slog" align="center"> Transfer Money Easliy With More Privacy & Best Net Banking Services </p> -->
        </div>
    </div>
    
    <div class="container">
  <form action="setValidpin.jsp">
    <h4 align="center">Set Your PIN</h4>
    <label for="fname">Username :</label>
    <input type="text" id="fname" name="uname" placeholder="username"><br>

    <label for="lname">Password :</label>
    <input type="password" id="lname" name="pass" placeholder="Password"><br>
    <label for="lname">Set PIN  &nbsp;:</label>
    <input type="password" id="lname" name="pin" placeholder="Security Pin"><br>

    <input type="reset" value="Reset"> 
    <input type="submit" value="Submit">
  </form>
    
    
    
      
     
    
   
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