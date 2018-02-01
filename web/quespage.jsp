<%-- 
    Document   : reult
    Created on : 3 Apr, 2016, 7:51:26 PM
    Author     : Elcot
--%>
 <%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="post" action="result.jsp">
<table bordercolor="red" border="1">
<%
    
try
{
    String tp=request.getParameter("topic");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project?"+"user=root&password=nivi");
PreparedStatement pst=con.prepareStatement("select * from qna where topic=?");
pst.setString(1,tp);
ResultSet rs=pst.executeQuery();

int number=0;
while(rs.next())
{
//String q=rs.getString("question");
    number=number+1;
ResultSetMetaData rsmd=rs.getMetaData();
//out.println(colcount);
    %>
 
<tr><td><%=number%>
    </td><td><%=rs.getString(3)%></td>

<td><INPUT TYPE=RADIO NAME="<%=rs.getString(1)%>" VALUE="a" >(a)<code><%=rs.getString(4)%></code><br></td>
<td><INPUT TYPE=RADIO NAME="<%=rs.getString(1)%>" VALUE="b" >(b)<code><%=rs.getString(5) %></code><br></td>
<td><INPUT TYPE=RADIO NAME="<%=rs.getString(1)%>" VALUE="c" >(c)<code><%=rs.getString(6) %></code><br></td>
<td><INPUT TYPE=RADIO NAME="<%=rs.getString(1)%>" VALUE="d" >(d)<code><%=rs.getString(7) %></code><br></td></tr>
<%
}
}
catch(Exception e)
{
out.println("err");
}
%>

<tr><td><input type="submit" value="submit" ></td></tr>
</table>
<INPUT TYPE=HIDDEN Name="subject" value="<%=request.getParameter("topic")%>" >
        </form>
 </body>
</html>


