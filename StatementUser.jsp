<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>

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
        background-color: rgb(0, 0, 0);
         
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
	font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    padding:0px 0px 10px 0px;
}
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
            font-size: large;
            border-collapse: collapse;
            width: 100%;
            background-color: rgb(0, 119, 255);
            color:aliceblue;
            background-color: rgb(0, 0, 0);
            
            }
            th{
                background-color: rgb(61, 192, 0);
                color:rgb(6, 7, 7);
                text-align: center;
            }
            td, th {
            border: 1px solid #0e0e0e;
            text-align: center;
            padding: 8px;
            }
           
</style>
</head>
<%!
    String fname="";
    int accnumber=0;
    float bal;
    String data,time;
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
        <h5 id="slog"><img id="im" src="logo.png"><center> &nbsp;  Best Net Banking Services</center></h5> 
        <!-- <p id="slog" align="center"> Transfer Money Easliy With More Privacy & Best Net Banking Services </p> -->
        </div>
    </div>
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
    
    <%
   
    int flag=0;
    String fname=(String)session.getAttribute("user");
    java.sql.Connection c=null;
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

        ResultSet rs=st.executeQuery("select * from transcations where senderacc='"+accnumber+"'  or receiveracc='"+accnumber+"' order by tid desc");
        
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
                  <td style="color:rgb(0, 119, 255);">&#8377;<% out.println(rs.getFloat(9)); %>/-</td>

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
                  <td style="color:rgb(21, 213, 247);">&#8377;<% out.println(rs.getFloat(8)); %>/-</td>

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