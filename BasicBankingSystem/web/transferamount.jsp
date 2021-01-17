<%-- 
    Document   : transferamount
    Created on : Jan 3, 2021, 7:58:52 PM
    Author     : kisho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<% try{
        Statement stmt;
        Statement stmt2;
        Class.forName("org.postgresql.Driver");
        Connection con =DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres","PassWord");
        stmt = con.createStatement();
        stmt2 = con.createStatement();
        String sql="select * from customer" ;
        ResultSet rs1 = stmt.executeQuery(sql);
        ResultSet rs2 = stmt2.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transfer Amount</title>
        <style>
            
            h1{
                font-size: 40px;
            }
            html {
    box-sizing: border-box;
    font-family: 'Open Sans', sans-serif;
  }
  
  *, *:before, *:after {
    box-sizing: inherit;
  }
  
  .background {
    position: relative;
    background: url('pictures/alltransactions.jpg');
    background-repeat: no-repeat;
                background-size: cover;
  
  }
  
  
  
 
  
  .container {
    margin: 0 auto;
    padding: 100px;
    max-width: 980px;
    width: 100%;
  }
  
  .panel {
    background-color: #fff;
    border-radius: 10px;
    padding: 15px 25px;
    position: relative;
    width: 100%;
    z-index: 10;
  }
  
  .pricing-table {
    box-shadow: 0px 10px 13px -6px rgba(0, 0, 0, 0.08), 0px 20px 31px 3px rgba(0, 0, 0, 0.09), 0px 8px 20px 7px rgba(0, 0, 0, 0.02);
    display: flex;
    flex-direction: column;
  }
  
  @media (min-width: 900px) {
    .pricing-table {
      flex-direction: row;
    }
  }
  
  .pricing-table * {
    text-align: center;
    text-transform: uppercase;
  }
  
  .pricing-plan {
    border-bottom: 1px solid #e1f1ff;
    padding: 25px;
  }
  
  .pricing-plan:last-child {
    border-bottom: none;
  }
  
  @media (min-width: 900px) {
    .pricing-plan {
      border-bottom: none;
      border-right: 1px solid #e1f1ff;
      flex-basis: 100%;
      padding: 25px 50px;
    }
  
    .pricing-plan:last-child {
      border-right: none;
    }
  }
  

  
  .pricing-header {
    color: #888;
    font-weight: 600;
    letter-spacing: 1px;
  }
  
  .pricing-features {
    color: #016FF9;
    font-weight: 600;
    letter-spacing: 1px;
    margin: 50px 0 25px;
  }
  
  .pricing-features-item {
    border-top: 1px solid #e1f1ff;
    font-size: 18px;
    line-height: 1.5;
    padding: 15px 0;
  }
  
  .pricing-features-item:last-child {
    border-bottom: 1px solid #e1f1ff;
  }
  
  
  .pricing-button {
    border: 1px solid #9dd1ff;
    border-radius: 10px;
    color: #348EFE;
    display: inline-block;
    margin: 25px 0;
    padding: 15px 35px;
    text-decoration: none;
    transition: all 150ms ease-in-out;
  }
  
  .pricing-button:hover,
  .pricing-button:focus {
    background-color: #e1f1ff;
  }
  
  .pricing-button.is-featured {
    background-color: #48aaff;
    color: #fff;
  }
  
  .pricing-button.is-featured:hover,
  .pricing-button.is-featured:active {
    background-color: #269aff;
  }
  
  .pointer {cursor: pointer;}
.contain {
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
.btn1 {
                text-decoration: none;
                border: 2px solid rgb(146, 148, 248);
                position: relative;
                overflow: hidden;
                background-color: transparent;
                border-color: #39FF14;
                color: #39ff14;
                text-shadow: 2px 1px #000000;
                
                }

            .btn1:hover {
                box-shadow: 5px 5px 25px 10px rgba(57, 255, 20, 0.4);
                }

            .btn1:before {
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

            .btn1:hover:before {
                left: 100%;
                }

        </style>
        <script type="text/javascript">
                                    function check(){
var name1=document.getElementById("amount").value;
if(name1.length<1)
{
windows.alert("Field should be filled");
f1=0;
}
}
                                </script>
    </head>
    <body>
        <form action="http://localhost:8080/BasicBankManagementSystem/transactionprocessing.jsp" name="f1" method="POST">                 
        <div class="background">
            <div class="container">
                <div class="panel pricing-table">

                    <div class="pricing-plan">
                    
                        <h2 class="pricing-header"><h1>Transaction Page</h1></h2>
                        <div class="pricing-features">
                            <div class="pricing-features-item">
                                Senders Name :
                                <select name="dropdownlist" id="sendername">
                                    <% while(rs1.next())
                                        {
                                        out.println("<option value='"+rs1.getString(1)+"'>"+rs1.getString(1)+"</option>");
                                        }
                                    %>
                                  </select>
                            </div>
                            <div class="pricing-features-item">
                                Receivers Name :
                                <select name="dropdownlist2" id="receivername">
                                    <% while(rs2.next())
                                        {
                                        out.println("<option value='"+rs2.getString(1)+"'>"+rs2.getString(1)+"</option>");
                                        }
                                    %>
                                  </select>
                            </div>
                            <div class="pricing-features-item">
                                Amount :
                                <input type="number" id="amount" name="amount" >
                                
                            </div>
                        </div>
                                   <input type="submit" onclick="check()" value="Transfer" class="pricing-button" ></a>
                    </div>
                </div>
                    <div class="pointer">
    <div class="contain"><a href="index.html" class="btn1">Home</a></div>
    </div>
            </div>
        </div>
        </form>
    </body>
</html>
<% rs1.close();
   rs2.close();
        stmt.close();
        stmt2.close();
        con.close();        
                                
        }
        catch(Exception e)
    {
        e.printStackTrace();
    }
%>