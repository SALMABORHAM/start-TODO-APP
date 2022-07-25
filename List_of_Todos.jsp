<%@page import="Database.TodoDB"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id = "db"   class  = "Database.TodoDB" scope = "application"></jsp:useBean>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
  
       <%
try {
Class.forName("org.apache.derby.jdbc.ClientDriver");
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection con = null;
Statement stmt = null;
ResultSet result = null;
%>
<h2 style="text-align: center;"><font><strong>List of Todos</strong></font></h2>
 <form action="AddTodo.jsp">
    <input type="submit" value="Add todo" style="color: white; background-color:#99cc00; border-color:#99cc00"/><br><br>
</form>
 
<table style="width:70%" align="left" cellpadding="5px" cellspacing="15">
<tr style="text-align: left;">
</tr>
<tr style="font-family:verdana;">
<td><b>Title</b></td>
<td><b>Target date</b></td>
<td><b>Status</b></td>
<td><b>Actions</b></td>

</tr>
<%
try{ 
con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample","password","password");
stmt =con.createStatement();
String sql ="Select * from Todo";

result = stmt.executeQuery(sql);
while(result.next()){
%>
<tr style="font-family: cursive;">

<td><%=result.getString("Title") %></td>
<td><%=result.getString("TargetDate") %></td>
<td><%=result.getString("Status") %></td>

<td><a href='EditTodo.jsp?edit_Todo=<%=result.getString("Title")%>'>Edit</a></td>
<td><a href='DeleteChecker.jsp?delete_Todo=<%=result.getString("Title")%>'>Delete</a></td>

</tr>

<% 
}

} catch (SQLException ex) {
	            Logger.getLogger(TodoDB.class.getName()).log(Level.SEVERE, null, ex);
	        }
	       
	       finally{
	            
	            try {
	                con.close();
	            } catch (SQLException ex) {
	                Logger.getLogger(TodoDB.class.getName()).log(Level.SEVERE, null, ex);
	            }
	        }
%>
</table>
    </body>
</html>


