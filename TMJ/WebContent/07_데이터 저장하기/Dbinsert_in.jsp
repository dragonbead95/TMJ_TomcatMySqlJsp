<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%
    	//��� �޽����� ó���ϱ� ���� ���� �� ���� �� �Ķ��Ÿ �ޱ�
    	String msg = request.getParameter("msg");
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
				frm.action = "./Dbinsert_save.jsp";
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
</script>
</head>
<body onload="show_msg('<%=msg%>')">
<form name="formm" method="post">
�� �� �� : <input type="text" name="id"><br>
�н����� : <input type="password" name="pw"><br>
<input type="button" value="Ȯ��" onclick="go_save()">
</form>
</body>
</html>