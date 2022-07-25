<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id = "Data_base"   class  = "Database.TodoDB" scope = "application"></jsp:useBean>
0
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            PrintWriter pw = response.getWriter(); 
            String t = request.getParameter("title");
            String d = request.getParameter("description");
            String z = request.getParameter("status");
            String T = request.getParameter("TargetDate").toString();
            String str =null;
            if("InProgress".equals(z)){str = "false"; }
            else{str ="true";}
            ServletContext app = request.getServletContext();
            app.setAttribute("title",t );
            int insertChecker = Data_base.insert_Todo_data(t,d,str,T);
        if(insertChecker > 0){
            pw.println("<html>" );
            pw.println("<body>");
            request.getRequestDispatcher("List_of_Todos.jsp").forward(request, response);
        }
        %>
    </body>
</html>

