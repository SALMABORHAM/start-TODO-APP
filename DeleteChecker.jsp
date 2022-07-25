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
           String TitleDeletedTodo =request.getParameter("delete");
         db.DeleteTodo(TitleDeletedTodo);
           request.getRequestDispatcher("List_of_Todos.jsp").include(request, response);
       %>
    </body>
</html>

