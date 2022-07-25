<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
      
    </head>
    <body>
       
        <form action="InsertChecker.jsp" method="post">
         <fieldset>
        <h2 style="font-family:verdana;">Add New Todo</h2>
          <p style="font-family:courier;">Todo Title</p>
          <input type="text" name="title" size="35" style="background-color: aliceblue; border-color:cyan"/>
          
      
          <p style="font-family:courier;">Todo Description</p>
          <input type="text" name="description" size="35" style="background-color: aliceblue ; border-color:cyan"/>
          <p style="font-family:courier;">Todo Status</p>
          
          
         <select name="status" style="width: 220px; height: 30px;">
          <option value="InProgress" > In Progress </option> 
          <option value="Completed" > Completed </option> 
        </select>
          
          
          <p style="font-family:courier;">Todo Target Date</p>
          <input type="date" name="TargetDate" size="35"><br><br>
          
          <input type="submit" value="Save" style="color: white; background-color:#99cc00; border-color:#99cc00"/>
          </fieldset>
  </form>
    </body>
</html>

