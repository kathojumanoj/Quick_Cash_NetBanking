<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CreateAccount</title>
    <link rel="icon" type="image/x-icon" href="https://img.icons8.com/?size=512&id=13530&format=png">
</head>
<%!
    String fname="";
    int accno;
    float bal;
    String uname,psw,email,addr,gen,phno,holdername,ano,bb,pin;
    Date dob;
    
%>
<style>
     *{
            top:0;
            margin:0;
     }
     body{
        background-color: rgb(255, 226, 194);
     }
    
    td{
        padding: 20px;
    }
    input{
        padding: 5px;
        font-size: medium;
        /* border-top: none;
        border-right: none;
        border-left: none; */
    }
    #hdiv{
            background-color: rgba(248, 248, 248, 0.929);
        }
        #im{
            border-radius: 80px;
            width: 100px;
            height: 90px;
            padding-top: 30px;
            
            
        }
        /* #ct{
            float: right;
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
        } */
        .indiv{
            
            color:rgb(211, 181, 144);
            padding: 10vh;
            margin:auto;
            font-family: Verdana, Geneva, Tahoma, sans-serif;
        }
        #time{
            padding: 20px;
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
            float: right;
        }
        .wel{
            padding-left: 120px;
            padding-top: 2vh;
            color:aqua;
        }
        .inner{
           display: flex;
        }
        
        .logo{
            padding-left: 60px;
            font-size: 28px;
            font-weight: bold;
        }
        #slog{
            font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;}
        #refs{
            padding-left: 20vh;
            padding-top: 5vh;
            /* border: 2px solid rgb(226, 218, 196); */
            color:rgb(255, 116, 116);
            font-size: 20px;
            
        }
        a{
            border: 1px solid rgb(248, 252, 246);
            background-color: black;
            border-radius: 15px;
            padding: 13px;
            float: right;
            color: rgb(127, 238, 255);
            text-decoration: none;
            margin-right: 10vh;
        }
        a:hover{
            background-color: rgb(255, 74, 158);
        }
        .formdiv{
            padding: 12vh;
            margin-left: 16vh;
        }
        input[type="submit"],input[type="reset"]{
            
            padding: 10px;
            border: 1px solid pink;
        }
        input[type="submit"]:hover,input[type="reset"]:hover{
            background-color: rgb(239, 86, 86);
        }
        h1{
            color: rgb(7, 14, 0);
        }
</style>
<% 
    uname=request.getParameter("uid");
    java.sql.Connection c=null;
            fname=(String)session.getAttribute("admin");
              try{
              Class.forName("oracle.jdbc.OracleDriver");
             c=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","2566");
              Statement st=c.createStatement();
              ResultSet rs=st.executeQuery("select * from customers where username like '"+uname+"'");
 
              
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
            } catch(Exception ee)
            {
                out.println(ee);
            }
            finally 
            {
                c.close();
            }
        

%>
<body onload="display_ct()">
    <div id="hdiv">
        <div id="time">
            <h2 id="ct"></h2><br>
            <h4>Make EveryThing Easy!</h4>
        </div>
        <!-- <h1><img src="https://img.icons8.com/?size=512&id=13530&format=png" width="90px">Quick Cash </h1> -->
         <div class="logo">
        <h2><img id="im" src="logo.png"></h2>
        <p id="slog" align="center"> Transfer Money Easliy With More Privacy & Best Net Banking Services </p>
        </div>
    </div>
    <a href="getCustomersDetails.jsp">Back</a>
    <div class="formdiv">
        <h1 align="center" > Fill Form To Create Account </h1>
    <table align="center">
    <form action="Update.jsp" method="post" >
        <tr>
            <td><h3>Account Holder Name</h3></td>
            <td><input type="text" name="accname" value="<%=holdername%>"required></td>
             
            <td><h3>Aadhar Number </h3></td>
            <td><input type="text" name="ano" value="<%=ano%>"required readonly></td>
        </tr>
        <tr>
            <td><h3>Date of Birth </h3></td>
            <td><input type="date" name="dob" value="<%=dob%>" required></td>
             
            <td><h3>Phone Number </h3></td>
            <td><input type="text" name="pno" value="<%=phno%>" required></td>
        </tr>
        <tr>
            <td><h3>UserName :</h3></td>
            <td><input type="text" name="uname" value="<%=uname%>" readonly required></td>
            
            <td><h3>Password :</h3></td>
            <td><input type="password" name="pass" value="<%=psw%>" readonly required></td>
        </tr>
        <tr>
            <td><h3>Address :</h3></td>
            <td><input type="text" name="address" value="<%=addr%>" required></td>
            
            <td><h3>Gender :</h3></td>
            <td><input type="radio" name="gen" value="Male" required> Male &nbsp;<input type="radio" name="gen" value="Female"required> Female</td>
        </tr>
        <tr>
            <td><h3>Balance :</h3></td>
            <td><input type="text" name="bal" value="<%=bal%>" placeholder="Min ₹500" readonly required></td>
            <td><h3>Email :</h3></td>
            <td><input type="email" name="email" value="<%=email%>" placeholder="@" required></td>
            
            <!-- <td><h3>Gender :</h3></td>
            <td><input type="radio" name="gen" required> Male &nbsp;<input type="radio" name="gen" required> Female</td> -->
        </tr>
        <tr>
            <td><h3>Confirm </h3></td>
            <td><input type="submit" value="Update"></td>
        </tr>
    </form>
    </table>
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