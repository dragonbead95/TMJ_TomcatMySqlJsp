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
    	//수정 또는 삭제를 위한 PK를 받는 변수
    	String seq = request.getParameter("seq");
    
    	//저장, 수정, 삭제 구분
    	String save_mod_del = request.getParameter("save_mod_del");
    	
    	//아이디를 받아들이는 변수
    	String id = request.getParameter("id");
    	
    	//암호를 받아들이는 변수
    	String pw = request.getParameter("pw");
    	
    	//저장 쿼리를 작성할 변수
    	String sql_save="";
    	
    	//수정 쿼리를 작성할 변수
    	String sql_update = "";
    	
    	//삭제 쿼리를 작성할 변수
    	String sql_delete="";
    	
    	//결과를 리턴하려는 변수
    	int message=0;
    	
    	sql_save = "insert into test (id,pw) values ('"+id+"','"+pw+"')";
    	
    	sql_update = "update test set id ='"+id+"', pw='"+pw+"' where seq='"+seq+"'";
    	
    	sql_delete = "delete from test where seq='"+seq+"'";
    	
    	try{

    	    Connection Conn = DBConn.getMySqlConnection();
    	    Statement stmt = Conn.createStatement();
    	    
    	    //save_mod_del : 1->저장 2->수정 3->삭제
    	   	
    	    if(save_mod_del.equals("1"))
    	    {
    	    	message = stmt.executeUpdate(sql_save);
    	    }
    	    else if(save_mod_del.equals("2"))
    	    {
    	    	message = stmt.executeUpdate(sql_update);
    	    }else if(save_mod_del.equals("3"))
    	    {
    	    	message = stmt.executeUpdate(sql_delete);
    	    }
    	    
  			
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
    	if(message>0 && save_mod_del.equals("2"))
    	{
    %>
    		<form name="frm" method="post" action="Dbinsert.jsp">
    		
    		</form>
    		<script lang="javascript">
    			window.opener.document.formm.submit();
    			window.close();
    		</script>
    <%
    	}
    	else if(message>0 && save_mod_del.equals("1"))
    	{
    %>
    		<form name="frm" method="post" action="Dbinsert.jsp">
    		
    		</form>
    		<script lang="javascript">
	    		document.frm.submit();
    		</script>
    <%
    	}
    	else if(message>0 && save_mod_del.equals("3"))
    	{
	%>
	    	<form name="frm" method="post" action="Dbinsert.jsp">
    		
    		</form>
    		<script lang="javascript">
	    		document.frm.submit();
    		</script>
    <%    		
    	}
    %>
</body>
</html>