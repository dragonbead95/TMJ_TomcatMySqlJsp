<%@page import="db.DBConn"%>
<%@page import="java.sql.*, java.lang.*, java.util.* "%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    
    <%
    	//��� �޽����� ó���ϱ� ���� ���� �� ���� �� �Ķ��Ÿ �ޱ�
    	String msg = request.getParameter("msg");

    	
    	int num=1;	//����Ʈ�� ���������� ���� ����
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script lang="javascript">
	function go_save()
	{
		var frm = document.formm;
		if(frm.id.value=="")
		{
			alert("���̵� �Է� �ϼ���");
			frm.id.focus();
		}else if(frm.pw.value=="")
		{
			alert("��ȣ�� �Է��ϼ���.");
			frm.pw.focus();
		}else
		{
			if(confirm("�������ðڽ��ϱ�?"))
			{
				frm.action = "./Dbinsert_save.jsp?save_mod_del=1";
				frm.submit();
			}
		}
	}
	
	//������ �� ȣ��� �Ķ��Ÿ�� �޾� �޽��� ó���ϴ� ��ũ��Ʈ
	function show_msg(msg)
	{
		if(msg==1)
		{
			alert("������ �Ǿ����ϴ�.");
		}else if(msg==2)
		{
			alert("������ �߻��Ǿ����ϴ�.");	
		}
	}

	function go_mod(seq)
	{
		var url = "./Dbinsert_mod.jsp?seq="+seq;
		window.open(url,"_blank",'menubar=no, resizable=no, toolbar=no, scrollbars=yes, status=no, width=420, height=310');
	}
	
	function go_del(seq)
	{
		var frm = document.formm;
		if(confirm("�����Ͻðھ��ϱ�?"))
		{
			frm.action="./Dbinsert_save.jsp?seq="+seq+"&save_mod_del=3";
			frm.submit();
		}
	}
	

</script>
</head>
<body onload="show_msg('<%=msg%>')">
<form name="formm" method="post">
�� �� �� : <input type="text" name="id"><br>
�н����� : <input type="password" name="pw"><br>
<input type="button" value="Ȯ��" onclick="go_save()">
<br>
<table border="1">
	<tr>
		<td>��ȣ</td>
		<td>���̵�</td>
		<td>�н�����</td>
		<td>����</td>
	</tr>
	<%
	try{
    	String db_list = "select * from test";
    	Connection Conn=DBConn.getMySqlConnection();
    	Statement stmt = Conn.createStatement();
    	ResultSet rs = stmt.executeQuery(db_list); 
		while(rs.next())
		{
	%>
		<tr>
			<td><%= num %></td>
			<td><a href="#" onClick="javascript:go_mod('<%= rs.getString(1)%>')"><%= rs.getString(2) %></a></td>
			<td><%= rs.getString(3) %></td>
			<td><a href="#" onClick="javascript:go_del('<%= rs.getString(1)%>')">����</a></td>
		</tr>	
	<% 	
			num++;
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
	
	if(num==1)
	{
		%>
		<tr>
			<td colspan="4">����� �����Ͱ� �����ϴ�.</td>
		</tr>
		<% 	
	}
		%>
</table>
</form>
</body>
</html>