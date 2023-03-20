<%-- 
    Document   : student.
    Created on : Mar 20, 2023, 11:02:30 AM
    Author     : 21cse067
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            table,th,td{
                 border: 1px solid black;
                 border-collapse:collapse;
                 padding:20px;
            }
            </style>
    </head>
    <body>
        <center>
            <h1> STUDENT DATABASE </h1>
            <table>
        <%
          Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/student");
          Statement st = con.createStatement();
          String query="SELECT count( * ) FROM student";
          ResultSet res = st.executeQuery(query);
          res.next();
                    int count = res.getInt(1);
                    out.println("<b><tr><td>The total number of students in the database :<b></td><td>"+count+"</td></tr>");
                    ResultSet res1= st.executeQuery("SELECT avg(student_id) from student");
                    res1.next();
                           double avg=res1.getDouble(1);
                           out.println("<b><br><tr><td>The average age of all students:<b></td><td>"+String.format("%.2f",avg)+"</td></tr>");
                                ResultSet res2=st.executeQuery("select stud_dept,count(student_id) as total from student group by stud_dept order by total Desc ");
                                   res2.next();
                                     int max=res2.getInt(2);
                                     out.println("<b><br><tr><td>The department with the highest number of student is:<b></td><td>"+res2.getString("stud_dept")+"</td></tr>");
       
        %>
        </center>

