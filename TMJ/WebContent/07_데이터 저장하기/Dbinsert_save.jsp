<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page language="java" import="java.sql.*" %>
        <%@ page import="db.DBConn" %>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
    <%
    	//아이디를 받아들이는 변수
    	String id=request.getParameter("id");
    	//암호를 받아들이는 변수
    	String pw=request.getParameter("pw");
    	//저장쿼리를 작성할 변수
    	String sql_save ="";
    	//결과를 리턴하려는 변수
    	int message=0;
    	
    	sql_save = "insert into test (id,pw) values ('"+id+"','"+pw+"')";
    	
    	try{

    	    Connection Conn = DBConn.getMySqlConnection();
    	    Statement stmt = Conn.createStatement();
    	    
    	    message = stmt.executeUpdate(sql_save);
  			
    	    stmt.close();
    	    Conn.close();
    	   
    	}catch(SQLException e)
    	{
    		out.println(e);
    	}catch(Exception e)
    	{
    		out.println(e);
    	}
    	//insert문을 실행하고 반환되는 리턴 값에 따라 if문을 실행한다.
    	if(message>0)
    	{
    %>
    		<form name="frm" method="post" action="Dbinsert_in.jsp">
    		<input type="hidden" name="msg" value="1">
    		</form>
    		<script lang="javascript">
    			document.frm.submit();
    		</script>
    <%
    	}
    	else
    	{
    %>
    		<form name="frm" method="post" action="Dbinsert_in.jsp">
    		<input type="hidden" name="msg" value="2">
    		</form>
    		<script lang="javascript">
    			document.frm.submit();
    		</script>
    <%
    	}
    %>
</body>
</html>