<%-- 
    Document   : ministatement
    Created on : Jan 6, 2021, 10:31:20 PM
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
        cname =request.getParameter("msbutton");

%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mini Statement</title>
        <style>
                  @import url('https://fonts.googleapis.com/css?family=Amarante');

html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video {
  margin: 0;
  padding: 0;
  border: 0;
  font-size: 100%;
  font: inherit;
  vertical-align: baseline;
  outline: none;
  -webkit-font-smoothing: antialiased;
  -webkit-text-size-adjust: 100%;
  -ms-text-size-adjust: 100%;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}
html { overflow-y: scroll; }
body { 
  background: #eee url('pictures/ministatement.jpg'); /* https://subtlepatterns.com/weave/ */
  font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
  background-repeat: no-repeat;
                background-size: cover;
  font-size: 62.5%;
  line-height: 1;
  color: #585858;
  padding: 22px 10px;
  padding-bottom: 55px;
}

::selection { background: #5f74a0; color: #fff; }
::-moz-selection { background: #5f74a0; color: #fff; }
::-webkit-selection { background: #5f74a0; color: #fff; }

br { display: block; line-height: 1.6em; } 

article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section { display: block; }
ol, ul { list-style: none; }

input, textarea { 
  -webkit-font-smoothing: antialiased;
  -webkit-text-size-adjust: 100%;
  -ms-text-size-adjust: 100%;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  outline: none; 
}

blockquote, q { quotes: none; }
blockquote:before, blockquote:after, q:before, q:after { content: ''; content: none; }
strong, b { font-weight: bold; } 

table { border-collapse: collapse; border-spacing: 0; }
img { border: 0; max-width: 100%; }

h1 { 
  font-family: 'Amarante', Tahoma, sans-serif;
  font-weight: bold;
  font-size: 4.0em;
  line-height: 1.7em;
  margin-bottom: 10px;
  text-align: center;
}


/** page structure **/
#wrapper {
  display: block;
  width: 570px;
  background: #fff;
  margin: 0 auto;
  padding: 10px 17px;
  -webkit-box-shadow: 2px 2px 3px -1px rgba(0,0,0,0.35);
}

#keywords {
  margin: 0 auto;
  font-size: 2.2em;
  margin-bottom: 15px;
}


#keywords thead {
  cursor: pointer;
  background: #c9dff0;
}
#keywords thead tr th { 
  font-weight: bold;
  padding: 12px 30px;
  padding-left: 42px;
}
#keywords thead tr th span { 
  padding-right: 20px;
  background-repeat: no-repeat;
  background-position: 100% 100%;
}

#keywords thead tr th.headerSortUp, #keywords thead tr th.headerSortDown {
  background: #acc8dd;
}

#keywords thead tr th.headerSortUp span {
  background-image: url('https://i.imgur.com/SP99ZPJ.png');
}
#keywords thead tr th.headerSortDown span {
  background-image: url('https://i.imgur.com/RkA9MBo.png');
}


#keywords tbody tr { 
  color: #000000;
}
#keywords tbody tr td {
  text-align: center;
  padding: 15px 10px;
}
tr:nth-child(odd) td {
  background:#a6a6a6;
}
.pointer {cursor: pointer;}
.container {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 10vh;
                padding: 0;
                margin: 0;
                }
                
a {
                font-size: 1.5rem;
                padding: 1rem 3rem;
                <!--color: #39FF14;-->
                color: #000000;
                text-transform: uppercase;
                }                
.btn {
                text-decoration: none;
                border: 2px solid rgb(146, 148, 248);
                position: relative;
                overflow: hidden;
                background-color: transparent;
                border-color: #39FF14;
                color: #39ff14;
                text-shadow: 2px 1px #000000;
                
                }

            .btn:hover {
                box-shadow: 5px 5px 25px 10px rgba(57, 255, 20, 0.4);
                }

            .btn:before {
                content: "";
                position: absolute;
                top: 0;
                left: -100%;
                width: 100%;
                height: 100%;
                background: linear-gradient(
                    120deg,
                    transparent,
                    rgba(57, 255, 20, 0.4),
                    transparent
                );
                transition: all 650ms;
                }

            .btn:hover:before {
                left: 100%;
                }


        </style>
    </head>
    <body>
    <center>
        <div id="wrapper">
        <table id="keywords" cellspacing="0" cellpadding="0">
            <thead>
            <th><span>Sender</span></th>
            <th><span>Receiver</span></th>
            <th><span>Amount</span></th>
            </thead>
            <tbody>
                
 <%
        ResultSet rs;
        String display ="select * from transaction where sender='"+cname+"' or receiver='"+cname+"'";
        rs = stmt.executeQuery(display);
        while(rs.next()) {
        out.println("<tr>");
        out.println("<td>"+rs.getString(1)+"</td>");
        out.println("<td>"+rs.getString(2)+"</td>");
        out.println("<td>"+rs.getString(3)+"</td>");
        out.println("</tr>");
       }
%>
                
    </tbody>
    </table>
    </div>
    <div class="pointer">
    <div class="container"><a href="index.html" class="btn">Home</a></div>
    </div>
    
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