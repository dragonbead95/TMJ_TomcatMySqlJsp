<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@ page language="java" import="java.sql.*" %>
    <%@page import="db.DBConn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
int count=0;
try{
	Connection conn = DBConn.getMySqlConnection();
    Statement  stmt= conn.createStatement();
    String sql = "select count(*) from student";
    ResultSet rs = stmt.executeQuery(sql);

    if(rs.next())
    {
    	count = rs.getInt(1);
    }
    rs.close();
    stmt.close();	
}catch(SQLException e)
{
	e.printStackTrace();
}
%>
	총갯수 : <%= count%>
</body>
</html>