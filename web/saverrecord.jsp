<%-- 
    Document   : saverrecord
    Created on : 8 Apr, 2016, 12:16:34 PM
    Author     : Elcot
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    Document   : validate
    Created on : 2 Apr, 2016, 9:49:45 PM
    Author     : Elcot
--%>
<%@pageimport="java.sql.*"%>
    <form action="qespage.jsp" method="post">
<%
try{
         String uname=request.getParameter("username");
         String upassword=request.getParameter("userpassword");
         String em=request.getParameter("email");
         Class.forName("com.mysql.jdbc.Driver");
         Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project?"+"user=root&password=nivi");
         PreparedStatement pst=conn.prepareStatement("insert into udetails value(?,?,?)");
         pst.setString(1,uname);
         pst.setString(2,upassword);
         pst.setString(3,em);
         pst.executeUpdate();

}
catch(Exception e){
out.println("Something went wrong !! Please try again");
}
%>
You have successfully signed in..
<br>
<input type="submit" name="topic" value="inheritance">
<input type="submit" name="topic" value="servlet and jsp">
<input type="submit" name="topic" value="jdbc">
    </form>
