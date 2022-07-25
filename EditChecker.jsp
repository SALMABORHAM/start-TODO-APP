<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id = "Data_base"   class  = "Database.TodoDB" scope = "application"> </jsp:useBean>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> JSP Page</title>
    </head>
    <body>
        <%
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String status = request.getParameter("status");
            String TargetDate = request.getParameter("TargetDate");
            
            String string =null;
            if("InProgress".equals(status)){string = "false";}
            
            else{string="true";}
             int edit_Checker_Todo = Data_base.Edit_Todo(description,string,TargetDate,title);
           
           if (edit_Checker_Todo > 0) {
        request.getRequestDispatcher("List_of_Todos.jsp").include(request, response); } 
        %>
    </body>
</html>
