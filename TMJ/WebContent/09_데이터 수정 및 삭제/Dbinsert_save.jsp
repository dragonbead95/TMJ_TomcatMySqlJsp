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
    	//���� �Ǵ� ������ ���� PK�� �޴� ����
    	String seq = request.getParameter("seq");
    
    	//����, ����, ���� ����
    	String save_mod_del = request.getParameter("save_mod_del");
    	
    	//���̵� �޾Ƶ��̴� ����
    	String id = request.getParameter("id");
    	
    	//��ȣ�� �޾Ƶ��̴� ����
    	String pw = request.getParameter("pw");
    	
    	//���� ������ �ۼ��� ����
    	String sql_save="";
    	
    	//���� ������ �ۼ��� ����
    	String sql_update = "";
    	
    	//���� ������ �ۼ��� ����
    	String sql_delete="";
    	
    	//����� �����Ϸ��� ����
    	int message=0;
    	
    	sql_save = "insert into test (id,pw) values ('"+id+"','"+pw+"')";
    	
    	sql_update = "update test set id ='"+id+"', pw='"+pw+"' where seq='"+seq+"'";
    	
    	sql_delete = "delete from test where seq='"+seq+"'";
    	
    	try{

    	    Connection Conn = DBConn.getMySqlConnection();
    	    Statement stmt = Conn.createStatement();
    	    
    	    //save_mod_del : 1->���� 2->���� 3->����
    	   	
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
    	
    	//insert���� �����ϰ� ��ȯ�Ǵ� ���� ���� ���� if���� �����Ѵ�.
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