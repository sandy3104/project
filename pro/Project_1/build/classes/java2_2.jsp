<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@  page import = "java.io.*"%>
<%@  page import="java.sql.*"%>
<%@  page import ="javax.servlet.*"%>
<%   PrintWriter p=response.getWriter();
     Class.forName("com.mysql.jdbc.driver");
     Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/sandhya","root","sANDHYA_1117");
     Statement s=c.createStatement();
     String s1="select year,sum(funds) as name from table1_2 group by year order by year;";
     ResultSet r=s.executeQuery(s1);
     out.println("<h1>Grants received from Government and non-governmental agencies for research projects, endowments, Chairs in the institution during the last five years</h1>");%>
     <table border="1" style="background-color: #ffffcc;">
     <tr>
     <th> YEAR</th><th>INR in lakhs</th></tr>
     <% while (r.next()) {%>
     <TR>
       <TD><%=r.getString(2)%></TD>
       <TD><%=r.getString(3)%></TD>
     </TR>
     <% } %>
     </TABLE>  
     int  count1=0,count2=0;
     while(r.next() && count1<=5)
     { 
    	 int c1 =Integer.parseInt(r.getString("name"));
    	 count2=count2+ c1;
    	 count1=count1+1;
     }
     count2=(count2%5)*100;
     out.println();
     out.println("e-copies of the grant award letters for research projects sponsored by non-government");
     out.println("List of project and grant details");
  </body>
</html>
