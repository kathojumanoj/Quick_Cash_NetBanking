<%
    String uid=(String)session.getAttribute("user");
    out.println("hi "+uid);
    
    %>
    <a href="lg.jsp">logout</a>