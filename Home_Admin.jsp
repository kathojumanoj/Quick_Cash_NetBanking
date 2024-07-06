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
<link rel="stylesheet" type="text/css" href="loll.css">

    <title>QuickCash$</title>
</head>
<style>
    body{
        background-color: rgba(0, 0, 0, 0.973);
         
    }
    #hdiv{ 
        width:100%;

    }
    #aa{
        padding: 7px;
        margin-right: 8px;
        
        font-size: 12px;
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
        border-radius: 20px;
        height:120px;
    }
    #span{
        color:cornflowerblue;
    }
    * {
  box-sizing: border-box;
}

/* Create three equal columns that floats next to each other */
.row{
	 display: inline-block;
     margin: 0px 60px 0px 50px;
     width: auto;
    height: auto;
}
.column{
	 width: fit-content;
     border-radius: 20px;
     background-color: rgb(255, 233, 145);
    
}
.column img{
    width: 30vh;
    height:30vh; 
} 
.out-op
{
    margin: 0 5px;
}
img{
    align-items: center;
    border-radius: 150px;
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
            <h2 id="user">Admin <i class="fa fa-user"></i> : <% out.println(session.getAttribute("admin"));%></h2>
             <a id="aa" href="lg.jsp">Logout <i class="fa fa-sign-out"></i></a> 
        </div>
        <!-- <h1><img src="https://img.icons8.com/?size=512&id=13530&format=png" width="90px">Quick Cash </h1> -->
         <div class="logo">
        <h5><img id="im" src="logo.png"> <center>Best Net Banking Services</center></h5> 
        <!-- <p id="slog" align="center"> Transfer Money Easliy With More Privacy & Best Net Banking Services </p> -->
        </div>
    </div>
    <% 
    Connection c=null;
    try{
        String un=(String)session.getAttribute("admin");
        Class.forName("oracle.jdbc.OracleDriver");
        c=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","2566");
        Statement s=c.createStatement();
        ResultSet r=s.executeQuery("select * from adminqc where username like '"+un+"'");
        
        if(r.next())
        {
            fname=r.getString(1);
            
        }else{
           // out.println("<br><h1 style='color:rgb(212, 13, 13);' > Failed to lol as Customer</h1>");
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
        <h1>Hello <% out.println(fname);%></h1>
        <div class="wel">
            <h1> Manage Your Services !</h1>
        </div>
    </div>
    <div class="out-op">
        <div class="row">
            <div class="column" >
                <center><h2>View Accounts</h2></center>
            <a style="margin-left: 20px;" class="cilck" href="getCustomersDetails.jsp"><img align="center" src="https://i.pinimg.com/originals/07/95/4f/07954fd23792953a2aedc6f14287f05f.png"></a>
            <p align="center">You can transfer money from<br> one account  to other :)</p>
            </div>
        </div>
        <div class="row">
            <div class="column"  >
                <center><h2>Transcation History</h2></center>
                <a style="margin-left: 20px;" class="cilck" href="getTranscationAdmin.jsp"><img src="https://e7.pngegg.com/pngimages/768/199/png-clipart-indian-rupee-computer-icons-financial-transaction-finance-bank-funding-service-investment.png"></a>
                <p align="center">You can transfer money from<br> one account  to other :)</p>
            </div>
        </div>
        <div class="row">
            <div class="column"  >
                <center><h2>Provide Help </h2></center>
                <a style="margin-left: 20px;" class="cilck" href="viewHelpRequest.jsp"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXY2l2NSsMn7t2oGWvVj4_cZ_DMyYJyA9_ZX2yemgehJ31fm7iCrJ4LY07WZ7FTCxkIeg&usqp=CAU"></a>
                <p align="center">You can transfer money from<br> one account  to other :)</p>
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
            document.getElementById('ct').innerHTML = yy+" "+xx+" ";
            display_c();
    }
</script>
</html>