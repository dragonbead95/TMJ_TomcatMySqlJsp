<%@page import="db.DBConn"%>
<%@page import="java.sql.*, java.lang.*, java.util.* "%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    
        <%
    	//��ũ��Ʈ���� �Ѱܿ��� �Ķ��Ÿ�� �޴� ����
    	String seq = request.getParameter("seq");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<script lang="javascript">
	//���� �� ���̵�� ��ȣ �Է� ���θ� üũ�ϴ� ��ũ��Ʈ
	function go_mod(seq)
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
			if(confirm("�����Ͻðڽ��ϱ�?"))
			{
				frm.action = "./Dbinsert_save.jsp?seq="+seq+"&save_mod_del=2";
				frm.submit();
			}
		}
	}
	
</script>
</head>
<body>
<body>
<form name="formm" method="post">
�� �� �� : <input type="text" name="id"><br>
�н����� : <input type="password" name="pw"><br>
<input type="button" value="Ȯ��" onclick="go_mod(<%=seq%>)">
</form>
</body>
</html>