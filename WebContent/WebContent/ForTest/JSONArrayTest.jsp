<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" import="org.json.*"%>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String connURL = "jdbc:oracle:thin:@localhost:1521:XE";
	Connection conn = DriverManager.getConnection(connURL, "DAVID", "123456");

	String qryStmt = "SELECT * FROM EMPLOYEE";

	PreparedStatement stmt = conn.prepareStatement(qryStmt);
	ResultSet rs = stmt.executeQuery();

	ResultSetMetaData metaData = (ResultSetMetaData) rs.getMetaData();
	int columnCount = metaData.getColumnCount();
	
	JSONArray Jsa = new JSONArray();
	while (rs.next()) {
		JSONObject myString = new JSONObject();
		for (int i = 1; i <= columnCount; i++) {
			String columnName = metaData.getColumnLabel(i);
			String value = rs.getString(columnName);
			myString.put(columnName, value);
		}Jsa.put(myString);
	}
	out.print(Jsa);
	conn.close();
%>