package Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class TodoDB {
Connection con = null;
    public TodoDB(){
 
 try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
             con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample", "password", "password");
            Statement stm = con.createStatement();
            stm.executeUpdate("create table Todo (Title varchar(20) ,Describtion varchar(20),Status varchar(20),TargetDate varchar(20) , primary key(Title))");  
        }
        catch (SQLException ex) {
            Logger.getLogger(TodoDB.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TodoDB.class.getName()).log(Level.SEVERE, null, ex);
        }        finally{
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(TodoDB.class.getName()).log(Level.SEVERE, null, ex);
            }
        }          
    }
public int insert_Todo_data(String Title,String Description,String Status,String TargetDate)
	{
            int Insert =0;
		try { 
	         con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample","password","password");
	         PreparedStatement pstmt=con.prepareStatement("insert into Todo values(?,?,?,?)");
                 pstmt.setString(1, Title);
	         pstmt.setString(2, Description);
	         pstmt.setString(3, Status);
	         pstmt.setString(4, TargetDate);
	        Insert = pstmt.executeUpdate();
	     } catch (SQLException ex) {
	    Logger.getLogger(TodoDB.class.getName()).log(Level.SEVERE, null, ex);
	     }
	     finally
	     {
	         try {
	             con.close();
	         } catch (SQLException ex) {
	             Logger.getLogger(TodoDB.class.getName()).log(Level.SEVERE, null, ex);
	         }
	     }
                return Insert;
	 }


public void DeleteTodo(String Title){
    try { 
	         con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample","password","password");
	         PreparedStatement pstmt=con.prepareStatement("DELETE FROM Todo WHERE Title=?");
	         pstmt.setString(1, Title);
	        pstmt.executeUpdate();
	     } catch (SQLException ex) {
	    Logger.getLogger(TodoDB.class.getName()).log(Level.SEVERE, null, ex);
	     }
	     finally
	     {
	         try {
	             con.close();
	         } catch (SQLException ex) {
	             Logger.getLogger(TodoDB.class.getName()).log(Level.SEVERE, null, ex);
	         }
	     }
   
    }
	
public int Edit_Todo (String Description,String Status,String TargetDate,String Title) {
int Edit =0;		
    try{
	      con= DriverManager.getConnection("jdbc:derby://localhost:1527/sample","password","password");
       PreparedStatement pstmt = con.prepareStatement("UPDATE Todo set Describtion =? ,Status=? ,TargetDate=? where Title=?");
             pstmt.setString(1, Description);
             pstmt.setString(2, Status);
             pstmt.setString(3, TargetDate);
             pstmt.setString(4, Title);
             Edit = pstmt.executeUpdate();
		}    catch (SQLException ex) {
         Logger.getLogger(TodoDB.class.getName()).log(Level.SEVERE, null, ex);
     }
    
    finally{
         
         try {
             con.close();
         } catch (SQLException ex) {
             Logger.getLogger(TodoDB.class.getName()).log(Level.SEVERE, null, ex);
         }
     }	
                return Edit;
	}

 public static void main(String[] args)
    {
      TodoDB todo = new TodoDB();
    }   
}
