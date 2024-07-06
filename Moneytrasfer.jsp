<%@ page import="java.sql.*"%>
<%@ page import="java.time.*"%>

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
        background-color: rgb(2, 2, 2);
         
    }
    #hdiv{ 
        width:100%;

    }
    #aa{
        padding: 7px;
        margin-right: 8px;
        font-size: 12px;
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
    #aa:hover{
        background-color: coral;
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
        padding: 10px;
        right: 0px;
        /* margin-right: 400px; */
        height:100px;
    }
    #span{
        color:cornflowerblue;
    }
 
    #slog{
	font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
     
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
          h1{
            color:rgb(11, 239, 255);
          }
          table {
            margin: 40px 0px;
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
            background-color: rgb(243, 255, 251);
            }
            th{
                border: 1px solid #dddddd;
            text-align: center;
            padding: 8px;
            background-color: rgb(97, 255, 100);
;
            }
            td {
            border: 1px solid #050c0a;
            background-color: rgb(187, 243, 255);

            text-align: center;
            padding: 8px;
            }

            #loader {
  position: absolute;
  left: 50%;
  top: 50%;
  z-index: 1;
  width: 120px;
  height: 120px;
  margin: -76px 0 0 -76px;
  border: 16px solid #f3f3f3;
  border-radius: 50%;
  border-top: 16px solid #3498db;
  -webkit-animation: spin 2s linear infinite;
  animation: spin 2s linear infinite;
}

@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

/* Add animation to "page content" */
.animate-bottom {
  position: relative;
  -webkit-animation-name: animatebottom;
  -webkit-animation-duration: 1s;
  animation-name: animatebottom;
  animation-duration: 1s
}

@-webkit-keyframes animatebottom {
  from { bottom:-100px; opacity:0 } 
  to { bottom:0px; opacity:1 }
}

@keyframes animatebottom { 
  from{ bottom:-100px; opacity:0 } 
  to{ bottom:0; opacity:1 }
}

#myDiv {
  display: none;
 
}

           
</style>
</head>
<%!
    String fname="";
    Timestamp instant;
%>
<body onload="myFunction()">
    <div id="loader"></div>
    <div style="display:none;" id="myDiv" class="animate-bottom"> 
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
        <h5 id="slog"><img id="im" src="logo.png"><center> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Best Net Banking Services</center></h5> 
        <!-- <p id="slog" align="center"> Transfer Money Easliy With More Privacy & Best Net Banking Services </p> -->
        </div>
    </div>
    
    <%
   
        String  recno,recname,amount,sendname="",rname="",spin="";
        int tid=1580,sendaccno=0,fromacc=0;
         
        
	     

		recno=request.getParameter("r_accno");
		recname=request.getParameter("uname");
		amount=request.getParameter("amount");
        float am=Float.parseFloat(amount);
        java.sql.Connection c=null;
	try{

            String un=(String)session.getAttribute("user");
			Class.forName("oracle.jdbc.OracleDriver");
			c=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","2566");
			Statement st=c.createStatement();
            ResultSet rs=st.executeQuery("select count(*) from transcations");
            if(rs.next())
            {
                tid=tid+rs.getInt(1);
                
            }
			ResultSet r=st.executeQuery("select * from customers where username like '"+un+"'");
			if(r.next())
			{
                sendname=r.getString(1);
                fromacc=r.getInt(10);
                spin=r.getString(12);
			}
            
            ResultSet result=st.executeQuery("select * from customers where accno ='"+Integer.parseInt(recno)+"'");
        if(result.next())
        {
            //out.println("<h1>Valid acc & username :"+result.getInt(10)+" "+result.getString(5)+"<h1>");
            rname=result.getString(5);
            sendaccno=result.getInt(10);

           
			 
            //out.println(session.getAttribute("pin"));
            String upin=(String)session.getAttribute("pin");
            if(spin.equals(upin))
            {
                PreparedStatement pp = c.prepareStatement("update customers set balance=(balance-?) where username like '"+un+"'");
                pp.setFloat(1,am);
                int qq=pp.executeUpdate();
                PreparedStatement pq = c.prepareStatement("update customers set balance=(balance+?) where username like '"+rname+"'");
                pq.setFloat(1,am);
                int ww=pq.executeUpdate();

			
						
                    if(qq>0 && ww>0 )
                    {
                        float revbal=0,senbal=0;
                        instant= Timestamp.from(Instant.now());  
                        //String stime=instant.toString();
                        //out.println("<h1> Successfully Debited& Creadited with username :<br>tid "+tid+" "+un+" "+fromacc+" "+ am +" "+" "+rname+" "+sendaccno+" "+" -->"+fname+"</h1>");
                        ResultSet results=st.executeQuery("select balance from customers where accno ='"+Integer.parseInt(recno)+"'");
                        if(results.next())
                        {
                            revbal=results.getFloat(1);
                        }
                        ResultSet resu=st.executeQuery("select balance from customers where accno ='"+fromacc+"'");
                        if(resu.next())
                        {
                            senbal=resu.getFloat(1);
                        }
                        PreparedStatement psp=c.prepareStatement("insert into transcations values(?,?,?,?,?,?,?,?,?)");
                        psp.setInt(1,tid);
                        psp.setInt(2,fromacc);
                        psp.setString(3,un);
                        psp.setFloat(4,am);
                        psp.setInt(5,sendaccno);
                        psp.setString(6,recname);
                        psp.setTimestamp(7,instant);
                        psp.setFloat(8,senbal);
                        psp.setFloat(9,revbal);

                        int fed =psp.executeUpdate();
                        session.setAttribute("pin","@!");
                        if(fed>0)
                        {
                        int resss=1;
                        }
                        else
                            out.println("<h1> failed stored :) </h1>");

                    }
            }
           // else{
             //       out.println("are you refreshed;");
            //}
            %>
            <br>
          <center><img src="https://www.nicepng.com/png/full/362-3624869_icon-success-circle-green-tick-png.png" width="100px"></center>
            <table>
                <tr>
                    <th>Catergories</th>
                    <th>Details</th>
                </tr>

                <tr>
                <td>Transcation Id :</td>
                <td><% out.println(tid); %></td>
                </tr>
                <tr>
                    <td>Sender Acc NO</td>
                    <td><% out.println(fromacc); %></td>
                </tr>
                <tr>
                    <td>Sender Name </td>
                    <td><% out.println(sendname); %></td>
                </tr>
                <tr>
                    <td>Amount ( &#8377; )</td>
                    <td>&#8377;<% out.println(am); %></td>
                </tr>
                <tr>
                    <td>Receiver Acc NO</td>
                    <td><% out.println(sendaccno); %></td>
                </tr>
                <tr>
                    <td>Receiver Name </td>
                    <td><% out.println(recname); %></td>
                </tr>
                <tr>
                    <td>Date & Time :</td>
                    <td><% out.println(instant); %></td>
                </tr>
                
            </table>
  <%
        }
        else{

            %>
            <center><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAwFBMVEX////YRT45OTnYQzw2NjbXPDQuLi4oKCjWMinYQjvWNi3XPTXXPzjWNy7WMSgyMjLj4+MfHx/R0dErKyv229rdZF8bGxtaWlrq6urVLSN6enojIyPbV1H44uH99vbifXmCgoL88vLd3d3onJnmko/heXXxxcPuuLbeamXaT0n00dAUFBTkiYXrqab66OjcXVfttLKoqKjCwsJHR0ewsLDjhIDqpKJoaGiJiYlvb29TU1OZmZn11dTfcGwAAAC8vLwUJVoBAAAOeklEQVR4nNWdaWPauBaGbYTBO6SEJBQDJYCJGbZOS9omZe7//1fXNpvl7RwZCZv3w70zhGn89JXOOVosSZJwDQeL+Woy3e27G8eTZdnznO5+NJ2s3MVgKP7XC9XAfR85sqrqlmIYpqYRQnxC/3+JZpqGYum2Lm927+6g7ActorU73fRUSzG1ACpbPqtiqXZ36q7LfmQGrecjolqGlotGSzMsVZ5t78JMd+n1LDPfuAw7TcUmS7fSXXM8n1m6UYTuTGno+n5eVUh3ZhczL26lpc7csmGSelxaunk13RlSt5aPZSNRmm/sqxpnCqRhO9uysU4aTG2LJW4ipakVcfFxZit87TuIWNUAfHzrcet9NKBaidz4uLfF8FXEwcFMkH+BgxUAHC5F+VcRB7eWIoqvEg4uPEtE/DwCVsDBpS0g/50By3fQNcQ1UB9QLx1wZ4troFUAXGgiDaxAE50KNbB8B8cbSyRf+Q66lrAcfwAsO02894S20PIdnKlC+Urvg2NHaAwt38FHXWAVEwKW7OBCbJIoH3AuOMaU3kRXPbF8paeJiS0asGQHxQOW7SC3NBgsGx5FIv267CDzzsHBYIlQt1VD9pxNt9vdbBzPsINl02CVo2wHV1cCBuuCPW80mS/W4+iK0nA8cLeTEempJffB7TVRlJiW7e22uQTDv+VO/LrFATVFNXbzqq9c/y1ayRDD9iZ/y358WGu1GKCpK8s7wPPlFSm2idF7q+ACbqrejAJ8ir6sxJoRRhO9AJ89GZf93GgVCKOGPq3qJooUrZnXJbTerOq5gZLDOKtGLOc+wudJU8ZJGdNelf3IbHLZqlGidu+qgfrFItvmCk2tzMYXrGZMmVBx7sxASZqzjHmJPS37eZk1ZClHNXte9vOya8TQRk3jbmq0ixYMcVRx7qdIu0jGjyisfdkPW0Tv+DVQfVf2wxbRGj+sV+8viAbCh5k7BXxEh5k7BZTesEMKfVn2oxYTOlMoo7IftaA2yExhbsp+0oJaIAtSTb6j2QpKDs5CYvMu1V6fXjn/ienCWsi92H7t1Pttzn9mqpCB1OKdJ16b9Vq9eQMXkbmQe5QJAGs3QRyhLCQ65xG930RrtZsgjnFTwLw7Ybt5ALwB4jtqAtGY8f2t7cYJMEAUG25QK01E55sJ2/0LIGcXEw/6FxVndL4Tv1EHUS4ymOzEV9eXmGGT5jBD5D7vEw0IIn7/71/sn91V42MD1EpMj/PaxNdmjQXx+0PtAYnYVYhFf+JiVgtNzmEmFbGTifj9yf/5Ewqx64dNnV6KniGSIVH5T24zuOg7GAjj4puS8GOMKUkVEcN6tItHQIyL3UPiU6Ph1EXMsBFbyOQoEvEMCLv4dszsVrSZYhqpEAslJGIEEHKxeypdzMhExBARSXn2wleKIK0vxlI/BVir//eCAJSj0RQTSQ1+878vjRr1iGC4oQFr/3zBAPrRdHH+GJPue9wG9n6xXW9BiP2Ii2GauKiPBJSNS9L34EaqdbkBtvxKps7g4ift4BMWUNa80+drxMBJ57WV61iL1usg4msaYB3tYNDuTqFjC+cKYvACbB1rUYSLIeJnn/r0gQFQtk6DWUSuMDilijMgFjHmIBPgJV8QuBvafPYqU8MlRENtx6IoSxMNWp58+NEaLtkuffY6wBY1XIJdbDSof8cHmaOOORxRsikTLoDN2HgQTBq0GB2Uz4XbFM6GfDbUP3cSJkEuRoVN9FFnDuGjC87QEI0HoCR9NOJPzeAiu4PnLA5nQ4PXauFzEhHrInMfDNULfjyA56Asbju3UxChiHr4VhEHfYXn+CDKbo4jw2KIjHnworAUg6eCuU6xFUEsDCgrwfQnvF7BrRsWRSzYRH2ZwZgPXhe1+K5VsIaberEgE0oLVsrgmo3362UpiHTS+EYhFnfwULcN4ZqtxxeQ0cW8RL8BY4g+lAYgIaeiFEDMcDE3TUjA8a9yWJkuwGRhCtg8A4abE2JeH8SM+/SFNAfrbuWdPyHSxXwHJWkCtlK/WFnBXxKy0RnjYm4eDISwZyVNwJGFusj/NcIQ+xAgoh7zx33w2MkuOhXczl/ShRsqBIgIk8YUUdIUXdlut55+5T4j6CIoeEXJL2reoJKGkIKA/oi+1f/4HxtigwkRfrtH20sb6DukWDo8zsnU+7XvTIhsLsogYVdywO8UGllE9sl0+p+ZT32ti+BsPdnA3yk0n0/PqjX6X7PWrq90ERw2EEcMYbsTm1XLDjpgRM0VuOfX72PANwoRxvfJhIxZQSeJ2GqifxM8iyaEMA0w8KaZHnTiiGAlw0QoCyBMNNHLs3c6v1NaYAwRqEWZCT2QkHFDaWzqPqbGw9dkpUMh5o8mYsL0QzjSMGaL9CYa6WUPzwmGCCKLg5hY6iHyIWPG/0zM3ScaazLonBHzRvQpAndU+tkCrmlkNsJhlLCebmi92fpOV7sHRGg8mBBY05CutAf/FhTGyvv3pcnVP577GYzxoBMiMvVBCVmXwmML1hnvl8jWif7Lvz/ia2onNZ6ooPPcYHZQGoMrEuZIWsKErPtM/rTOFK0/kvSzldUzWw+/Itubnhn7oIQZH5pTxBhfZx3jv0Y2FzwENn02E3XLqbH2f1yCDjMgYoxvTITM0zxHtqc/Bx8Mf/dbWYzN+vfCm8fhXSTKCjOZw7zE/W/UxIMzL1+fMhk7zbRKByP4hBLLFTNf+iNi4sfxs/avh8xaoPH0pxAhar4U7qyYhNimZ+V/Rmbl++dg8uUjsxhgDzKh4MuX1AFq3QLsJ+1mix7URWrTeu3y8WdGxGFOEwcN4QX6YKMwh7WnoNimx63R0q358/TplwxA1kR/0l9c+4OLVyghHoZLFOIw0kzr9RNg4v2Kqxz0Qym8fB0MjKCiBjxf9DTgpRAjpVutcxj4fumn8uVuxssXXI+FURJYxwePwL2M6KPTZO3ohrR+CBgNpa0WB0DEvthwVSl/0xd4gGp0RF/vXxAjpVut8RkDbP7+dioBrgBcI/fJ5KYL2MHoiL757fKDL5SJQxrQ/97rIT0WDTKB4GLlWFPnhFzYwWYGIFW61eq/olH0+L0vH3320URUiLde7fCL2XMdxR2U6NKtVk8CBl9pXAOIeBvtOIuWuVMfjqLZDvqqpeeGxPeKCs6Gp63NWc0ZBqQc/Br/8c/ULWrcADEHAx6HRRmhBm6inVxAqnQTAAjP0Zz3CKfXbXCQaQCAaVUoR0BEIz2PGdLGIAyJPgb4cq7Thw8CATEv+pzHfSnlHVOipwFbH+d//tYQByghDne0Tgc6JvfQXuGgX56eEdt0JdrhCYhI95d3ZhJ9tniifwlSROOMGC3dwnk3fkKcFhQZusea9DUOhkiN5+O/U6VbdCh8tQaId7Ui+2LpSTmiQ+PBZj5gxMWPaMLo5OxZYBXmnJLINCj1Dil6PHhoenQfPH/8cYiodOnW4gaIOS+eWJHZl/3lb4Qt0UdbXgSw1vpxHEdRpVvnkxch5qBj6nX1S2BiS/Q+yq90wNNfH1269TkdHII6aoaayT6vcLAFmdCXX3mAsdKt8ZsPIea1XkK9j39qpvCVKK3EzPUB8aWeDhgr3f7hYiLq1obYGReHZoq4lihln0WAmOWg/xP8m/Ro7TEHPsXf69Wxl9q8JEcMnT/nNJEA9Eu3yKQTH8AFphcSPfZf7QyZ4F4UTdlM0upkOShFZ93+4QOIOzkv8RrMo4q+dyl3O0nrR+L7p9KNk4PSCnVMbtIuD/+qb/aWoKSD0rl049QHkcfkpuwCWjGcH5TpYoqD0rF04+Ug8mhA68qT8DNcTHNQOpRu3AC3qNMdiX3t70l1sZ4OGCyYXjGzTQt5lDOHV7PT9h92staqf/7HCxB5AimXo2ZSEFvPGd8d8mqi0hJ3tQifF5lSGmojC5GX5siDjjkdNZMSbgQjDpD3oZq8jsO/tYtjA3lgPKdTPKSbu+ghTxs33/j9zpu6iL4mrcfzrd4bujjC3tBk8H0j9GYu7tDXUhR+1y5DKXlRBOISfdEd/5PzbtJQd2hA5i3NCN3AxRH+qkJdxPVaibODeCPu8VfDcD4m96Q0Fz/g/wypscNwzx2/ZE8r6eI1+2RoPSoMNxUqwm4Wibl43T4ZSltkLRqK13FPaaJd5DbglZZMdxLbYl6sPyjqIr8RPUsXFNlGQ13yIjfArc10JbHINhrqhMgryKzfGC+VtoVfhXpA5OXgu81426su4oSSmIJwU3DXfVwLj/W+Xp6jwmy1O3wcXO/ZeqAcnLB6mwuMXnnMqq13KmMDlfmf+S9Q62WvwJ3n93Of7eNMLcAnK/dyF6PbZQ2gB93JNWmPU1NnjS8HadodXJP2OPFstqukLwI3cZWusbs0VKWYfQFgtcPoYL50bB07mZ2qXumXLne93cr9ux5G+8pwPFjMJzuvp1pGYfOOgKXniTdFMxRLtS1Tdjabbre72Tieodq6pZhXwgWy+V7QVAjw9CyEaCchzkhHqlchQCGqkoNCVIU+KJKPVCCKCgbkdgh3NQE1zD7DewY0Zf43iFUKUNmUXmyLBVTLHw8KBSTlZwmxacJURE7e4yTUQb0r5Iq7ygBq9g0mfssEVEgFhrsCATVb7OoSTgIBFbn8ECMS0LQF3THJJmGARN1UYkZNFCBRjNJHSqFEARrqpPQyNJQgQLO3LD/HhxIDaNqz0sdJRwkBNHuzSgSYQAIAiaKOKsMnAFCz7GlV2qcvh3FnCCRi2k75g8CoFktLL7S4mSrTUkelzzMl5c5sCz6qERQxLXs/r0b6S2jszqzrVsqIoVv7bUWyX4bcpdcrZiUxFZss3Yq6R2m9HRHVUuALtS7SDEuVZ9vqpAZYa3fyptq6YgKcRDMVS+1tpvMKJQa81ovVyCGqqluKYZjBsmGI6/+fZpqGYumqbXj7ybyCYZNJw8FivppMd/vuxvFkInues9mPlpOVuxiMxfe6/wOZeDg5uxxFAgAAAABJRU5ErkJggg==" width="100px"></center>
        
   
                <a id="aa" style="float:left; margin:20px 50px;padding: 10px; background-color: #9f0b01;" href="transfer.jsp">Go Back</a>
   <%
        }
	}
    catch(Exception ee)
    {
        //RequestDispatcher rd = request.getRequestDispatcher("/index.html");
        out.println("<h1><br> ERROR :Transcation Falied .."+ee+"</h1>");
        //rd.forward(request,response);
    }
	finally{
        c.close();
    }
			
%>


     
      
</div>
    
   
</body>
<script type="text/javascript"> 
// window.addEventListener('beforeunload',()=>{

//     event.preventDefault();
//     event.returnValue = "";
// }

//)
function myFunction() {
  myVar = setTimeout(showPage, 2500);
  display_c();
}
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
    function showPage() {
    document.getElementById("loader").style.display = "none";
    document.getElementById("myDiv").style.display = "block";
    }
</script>
</html>