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
    	//���̵� �޾Ƶ��̴� ����
    	String id=request.getParameter("id");
    	//��ȣ�� �޾Ƶ��̴� ����
    	String pw=request.getParameter("pw");
    	//���������� �ۼ��� ����
    	String sql_save ="";
    	//����� �����Ϸ��� ����
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
    	//insert���� �����ϰ� ��ȯ�Ǵ� ���� ���� ���� if���� �����Ѵ�.
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