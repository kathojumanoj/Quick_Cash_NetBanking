<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="https://img.icons8.com/?size=512&id=13530&format=png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous"> -->
    <!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script> -->
<link rel="stylesheet" type="text/css" href="jaffa.css">

    <title>QuickCash$</title>
</head>
<style>
    
    body{
        background-color: rgb(104, 103, 103);
         
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
        margin-right: 6vh;
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
        color: rgb(171, 4, 218);
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
	font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    padding:0px 0px 10px 0px;
}
/* Create three equal columns that floats next to each other */
.row{
	 display: inline-block;
     margin: 0px 70px 20px 70px;
     width: auto;
    height: auto;
}
.column{
	 padding: 10px;
     border-radius: 20px;
     background-color: rgb(255, 253, 253);
}
.column img{
    width: 40vh;
    height: 40vh; 
} 
.out-op
{
    margin: 0 10px;
}
/* .cilck{
    
    text-decoration: none;
    padding: auto;
    margin: 0px;
    float: none;
    border-radius: 0px;
    background-color: white;
    
} */
img{
    border-radius: 150px;
}
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
           
          .em{
            margin: 90px;
          }
          #lol{
            color:chartreuse;
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
             <a id="aa" href="setpin.jsp"> set PIN <i class="fa fa-lock"></i></a> 
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
            <h1> Welcome to Our Services !</h1>
        </div><br>
        <h2> Cilck on to choose Operations :</h2>
    </div>
    <div class="out-op">
    <div class="row">
        <div class="column" >
            <h2>Transfer </h2>
            <a class="cilck" href="transfer.jsp" style="margin:0px;"><img src="https://www.pngitem.com/pimgs/m/191-1918880_money-transfer-icon-money-transfer-cartoon-icon-hd.png"></a>
             <p>You can transfer money from<br> one account  to other :)</p>
        </div>
    </div>
    <div class="row">
        <div class="column" >
         <h2>Statement </h2>
         <a  class="cilck" href="StatementUser.jsp"><img src="https://cdn4.iconfinder.com/data/icons/documents-15/144/rupee-banking-document-account-statement-report-user-512.png"></a>
          <p>You can Check your previous<br>Transcations History in Detail.. </p>
        </div>
    </div>
    <div class="row">
        <div class="column"  >
            <h2>Balance Enquiry</h2>
            <a  class="cilck" href="BalanceCheck.jsp"><img src="https://m.media-amazon.com/images/I/41eDlvdbNGL.png"></a>
            <p>Check your Balance in your Account<br> On single click Easily</p>
        </div>
    </div>
    <div class="row">
        <div class="column" >
         <h2>Profile </h2>
         <a  class="cilck" href="ProfileCusto.jsp"><img src="https://www.citypng.com/public/uploads/preview/profile-user-round-yellow-icon-symbol-free-png-11639594308nr1vrmbcv3.png"></a>
          <p>About your Account<br> Details  :)</p>
        </div>
    </div>
    <div class="row">
        <div class="column" >
            <h2>Help & Support </h2>
             <a class="cilck" href="contactus.jsp" style="margin:0px;"><img src="https://cdn-icons-png.flaticon.com/512/4961/4961759.png"></a>
             <p>We always help &<br> support for any problem</p>
        </div>
    </div>
    <div class="row">
        <div class="column" >
            <h2>About Us</h2>
            <a  class="cilck" href="AboutUs.jsp"><img src="data:image/jpeg;base64,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"></a>
            <p>Know About us and <br>Explore in our Services</p>
        </div>
    </div>
    </div>
    <br><br>
    <div class='bot' style="width:auto;height:100px;background-color:rgb(148, 240, 236);">
        <br><br><br>
        <p class="end" style="color: rgb(10, 15, 1);font-size:19px;"> &REG; Quick Cash &ensp;|  Website Terms of Use | Accessibility Information<br>

            &copy 2023. mightyDeveloper . All rights reserved.</p>
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