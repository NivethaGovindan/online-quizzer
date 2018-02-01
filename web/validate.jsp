<%-- 
    Document   : validate
    Created on : 2 Apr, 2016, 9:49:45 PM
    Author     : Elcot
--%>
<%@pageimport="java.sql.*"%>
    <form action="quespage.jsp" method="post">
<%
try{
String username=request.getParameter("username");
String password=request.getParameter("password");
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project?"+"user=root&password=nivi");
PreparedStatement pst=conn.prepareStatement("Select * from udetails where uname=? and upassword=?");
pst.setString(1,username);
pst.setString(2,password);
ResultSet rs=pst.executeQuery();
if(rs.next()){
    out.println("you have successfully logged in");
%>

<input type="submit" name="topic" value="inheritance">
<input type="submit" name="topic" value="servlet and jsp">
<input type="submit" name="topic" value="jdbc">
<%    
}
else{
out.println("invalid login");
}
}
catch(Exception e){
out.println("connection problem try again..");
}
%>
