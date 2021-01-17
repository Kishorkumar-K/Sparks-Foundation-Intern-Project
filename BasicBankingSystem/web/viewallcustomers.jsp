<%-- 
    Document   : viewallcustomers
    Created on : Jan 5, 2021, 6:56:33 PM
    Author     : kisho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%try{
        Statement stmt;
        Class.forName("org.postgresql.Driver");
        Connection con =DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres","PassWord");
        stmt = con.createStatement();
        String sql="select * from customer" ;
        ResultSet rs = stmt.executeQuery(sql);
%>        


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Customers</title>
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
  width: 850px;
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


.detailsbutton {
	background-color:#4b3f39;
	font-family: 'Open Sans', sans-serif;
	font-size:12px;
	text-decoration:none;
	color:#fff;
	position:relative;
	padding:10px 20px;
	padding-right:50px;
	background-image: linear-gradient(bottom, rgb(62,51,46) 0%, rgb(101,86,78) 100%);
	border-radius: 5px;
	box-shadow: inset 0px 1px 0px #9e8d84, 0px 5px 0px 0px #322620, 0px 10px 5px #999;
}

.detailsbutton:active {
	top:3px;
	background-image: linear-gradient(bottom, rgb(62,51,46) 100%, rgb(101,86,78) 0%);
	box-shadow: inset 0px 1px 0px #9e8d84, 0px 2px 0px 0px #322620, 0px 5px 3px #999;
}

.detailsbutton::before {
	background-color:#322620;
	background-image:url('https://tympanus.net/Tutorials/CSSButtonsPseudoElements/images/right_arrow.png');
	background-repeat:no-repeat;
	background-position:center center;
	content:"";
	width:20px;
	height:20px;
	position:absolute;
	right:15px;
	top:50%;
	margin-top:-9px;
	border-radius: 50%;
	box-shadow: inset 0px 1px 0px #19120f, 0px 1px 0px #827066;
}

.detailsbutton:active::before {
	top:50%;
	margin-top:-12px;
	box-shadow: inset 0px 1px 0px #827066, 0px 3px 0px #19120f, 0px 6px 3px #382e29;
}

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
  <h1>All Customers</h1>
        <form action="customerdetails.jsp" method="POST">
    
        <table id="keywords" cellspacing="0" cellpadding="0">
            <thead>
                <tr>
            <th><span>S.No</span></th>
            <th><span>Name</span></th>
            <th><span>Balance</span></th>
            <th><span></span></th>
            </tr>
            </thead>
            <tbody>
<%          while(rs.next())
        {
            out.println("<tr>");
            out.println("<td>"+rs.getString(1)+"</td>");
            out.println("<td>"+rs.getString(2)+"</td>");
            out.println("<td>"+rs.getString(3)+"</td>");
            out.println("<td><button type='submit' class='detailsbutton' name='button1' value="+rs.getString(1)+">View</button></td>");
            out.println("</tr>");
        }
%>
        </tbody>
        </table>
    </form>
        </div><br/>
        <div class="container"><a href="index.html" class="btn">Home</a></div>
        
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