<%-- 
    Document   : customerdetails
    Created on : Jan 6, 2021, 12:16:13 AM
    Author     : kisho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*" %>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*,java.sql.PreparedStatement,java.sql.SQLException" %>

<% try{
        Statement stmt;
        String cname;
        Class.forName("org.postgresql.Driver");
        Connection con =DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres","PassWord");
        stmt = con.createStatement();
        cname =request.getParameter("button1");

%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Details</title>
        <style>
            body {
                
                background-image: url('pictures/customer.jpg');
                background-repeat: no-repeat;
                background-size: cover; 
                color: #fff
                }
                table {
                    font-size: 2.5rem;
                    border-collapse: collapse;
                }
            .a_demo_two {
	background-color:#6fba26;
	padding:15px;
	position:relative;
	font-family: 'Open Sans', sans-serif;
	font-size:1.6rem;
	text-decoration:none;
	color:#fff;
	background-image: linear-gradient(bottom, rgb(100,170,30) 0%, rgb(129,212,51) 100%);
	box-shadow: inset 0px 1px 0px #b2f17f, 0px 6px 0px #3d6f0d;
	border-radius: 5px;
}

.a_demo_two:active {
	top:7px;
	background-image: linear-gradient(bottom, rgb(100,170,30) 100%, rgb(129,212,51) 0%);
	box-shadow: inset 0px 1px 0px #b2f17f, inset 0px -1px 0px #3d6f0d;
	color: #156785;
	text-shadow: 0px 1px 1px rgba(255,255,255,0.3);
	background: rgb(44,160,202);
}
            
        </style>
    </head>
    <body>
    <center>
        <table border="5">
            
            
            
            
            <%
        ResultSet rs;
        String display ="select * from customer where name='"+cname+"'";
        rs = stmt.executeQuery(display);
        rs.next();
        out.println("<tr>");
        out.println("<td><b>Name</b></td>");
        out.println("<td>"+rs.getString(1)+"</td>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<td><b>Email ID</b></td>");
        out.println("<td>"+rs.getString(2)+"</td>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<td><b>Balance</b></td>");
        out.println("<td>"+rs.getString(3)+"</td>");
        out.println("</tr>");
        out.println("</table>");
        out.println("<br/>");
        out.println("<form action='ministatement.jsp' method='POST'");
        out.println("<a href='ministatement.jsp'>");
        out.println("<button type='submit' class='a_demo_two' name ='msbutton' value="+cname+">Mini Statement</button>");
        out.println("</a>");
        out.println("</form>");
%>
<p>
        <a href="transferamount.jsp">
        <button type="submit" class="a_demo_two" name ="Transfer Amount">Transfer Amount</button>
        </a>
</p>
<p>
        <a href="index.html">
        <button type="submit" class="a_demo_two" name ="Home" >Home</button>
        </a></p>
</center>
    </body>
</html>
<%      rs.close();
        stmt.close();
        con.close();        
                                
        }
        catch(Exception e)
    {
        e.printStackTrace();
    }
%>