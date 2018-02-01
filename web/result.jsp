<%-- 
    Document   : result
    Created on : 9 Apr, 2016, 1:06:04 AM
    Author     : Elcot
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JAVA-QUIZZER result</title>
    </head>
    
        <%
    
try
{
String s1=request.getParameter("subject");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project?"+"user=root&password=nivi");
PreparedStatement pst=con.prepareStatement("select * from qna where topic=?");
pst.setString(1,s1);
ResultSet rs=pst.executeQuery();
int number=0;
int score=0;

while(rs.next()){
    number=number+1;
    String check=rs.getString(1);
    String s2=(String)request.getParameter(check);
    out.println("");
    
%> <br> 
        <%=number%>
        <%=rs.getString(3)%><br>
        a)<%=rs.getString(4)%><br>
        b)<%=rs.getString(5)%><br>
        c)<%=rs.getString(6)%><br>
        d)<%=rs.getString(7)%><br>
<%        
if(s2.equals(rs.getString(8)))
{
 out.print("your answer: "+s2+"is correct");
 score=score+1;
           }
else{
%><br>
           <%
                   out.print("your answer: "+s2+"is wrong");
                   
%><br>
<%out.println("correct answer is:"+rs.getString(8));
   }
}%><br>
<%
out.println("score:"+score+"out of 5");
}
catch(Exception e){
out.println(e);
}
%>
   >
    
</html>
             
        