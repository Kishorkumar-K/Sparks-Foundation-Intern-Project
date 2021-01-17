<%-- 
    Document   : transactionprocessing
    Created on : Jan 4, 2021, 11:01:19 AM
    Author     : kisho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*" %>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*,java.sql.PreparedStatement,java.sql.SQLException" %>

<% try{
        Statement stmt,stmt2,stmt3,stmt4,stmt5;
        String send,receive;
        int credit,asend,areceive,fsend,freceive;
        Class.forName("org.postgresql.Driver");
        Connection con =DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres","PassWord");
        stmt = con.createStatement();
        stmt2 = con.createStatement();
        stmt3 = con.createStatement();
        stmt4 = con.createStatement();
        stmt5 = con.createStatement();
        send =request.getParameter("dropdownlist");
        receive =request.getParameter("dropdownlist2");
        credit =Integer.parseInt(request.getParameter("amount"));

        

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv = "refresh" content = "2; url = viewallcustomers.jsp" />
        
        <title>Processing Transaction</title>
        <style>
  .loader {
  border: 16px solid #f3f3f3;
  border-radius: 50%;
  border-top: 16px solid #3498db;
  width: 100px;
  height: 100px;
  -webkit-animation: spin 2s linear infinite; /* Safari */
  animation: spin 1s linear infinite;
}

/* Safari */
@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
        </style>
    </head>
    <body>
    <center>
        <br/><h1>Transaction Processing in Progress</h1>
        You will be automatically redirected do not hit reload or stop<br/><br/><br/>
        <div class="loader"></div>

  

    
<%
        String sqlinsert ="INSERT INTO transaction(sender,receiver,amount)VALUES('"+send+"','"+receive+"','"+credit+"')";
        String retrivesender ="SELECT balance FROM customer where name ='"+send+"'";
        String retrivereceiver ="SELECT balance FROM customer where name ='"+receive+"'";
        ResultSet rs,rs2,rs3,rs4,rs5;
        rs= stmt.executeQuery(retrivesender);
        rs.next();
        asend =rs.getInt(1);
        rs.close();
        rs2 =stmt2.executeQuery(retrivereceiver);
        rs2.next();
        areceive =rs2.getInt(1);
        rs2.close();
        fsend =asend - credit;
        freceive =areceive + credit;
        String sqlupdate1 ="UPDATE customer SET balance ="+fsend+" WHERE name ='"+send+"'";
        String sqlupdate2 ="UPDATE customer SET balance ="+freceive+" WHERE name ='"+receive+"'";
        try {
            rs3=stmt3.executeQuery(sqlupdate2);
        rs3.close();
        }
        catch (SQLException ex){
            ex.printStackTrace();
        }
         try {
        rs4=stmt4.executeQuery(sqlupdate1);
        rs4.close();
         }
        catch (SQLException ex2){
            ex2.printStackTrace();
        }
         try { 
        rs5=stmt5.executeQuery(sqlinsert);
        rs5.close();
         }
         catch (SQLException ex3){
            ex3.printStackTrace();
        }
        stmt.close();
        stmt2.close();
        stmt3.close();
        stmt4.close();
        stmt5.close();
        con.close();
        System.out.println("");
        }
        catch(Exception e )
    {
        e.printStackTrace();
    }
%>
<h1>Transaction Successful</h1><br>
<a href="./index.html"><button value="Home">Home</button></a>
</center>
</body>
</html>