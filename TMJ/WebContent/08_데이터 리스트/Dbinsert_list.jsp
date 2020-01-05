<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@ page language="java" import="java.sql.*, java.lang.*, java.util.* " %>
        <%@ page import="db.DBConn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	Connection Conn = DBConn.getMySqlConnection();
	Statement stmt = Conn.createStatement();
	ResultSet rs;
	String db_list = "";
	db_list = "select * from test";
%>
<table border="1">
	<tr>
		<td>번호</td>
		<td>아이디</td>
		<td>패스워드</td>
	</tr>
	<%
	try{
		
	
		rs = stmt.executeQuery(db_list);
		while(rs.next())
		{
	%>
		<tr>
			<td><%= rs.getString(1) %></td>
			<td><%= rs.getString(2) %></td>
			<td><%= rs.getString(3) %></td>
		</tr>	
	<% 	
		}
		rs.close();
		stmt.close();
		Conn.close();
	}catch(SQLException e)
	{
		out.println(e);
	}catch(Exception el)
	{
		out.println(el);
	}
	%>
</table>
</body>
</html>