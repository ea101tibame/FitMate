<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"
    import="java.util.*"%>
 <%
 Class.forName("oracle.jdbc.driver.OracleDriver");
 String connURL = "jdbc:oracle:thin:@localhost:1521:XE";
 Connection conn = DriverManager.getConnection(connURL, "DAVID", "123456");
 

 String qryStmt = "SELECT * FROM EMPLOYEE";
 Statement stmt =null;
 stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
 ResultSet rs =stmt.executeQuery(qryStmt);
 rs.getRow();
 
 ResultSetMetaData rsmd = rs.getMetaData();
 HashMap hm = new HashMap();

 while (rs.next()) {
     for (int i = 0; i < 2; i++) {
    	 hm.put(rsmd.getColumnLabel(i + 1) ,rs.getString(i + 1) );
    	 out.print(hm);
     }
  
 }
 

 conn.close();
%>