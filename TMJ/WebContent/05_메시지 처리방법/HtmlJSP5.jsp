<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String msg = request.getParameter("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<script lang="javascript">
	function show_msg(msg)
	{
		if(msg==1)
		{
			alert("아이디를 입력하세요.");
			document.formm.id.focus();
		}else if(msg==2)
		{
			alert("패스워드를 입력하세요.");
			document.formm.pw.focus();
		}
	}
</script>
</head>
<body onload="show_msg('<%=msg%>')">

<form name="formm" method="post" action="TestJSP5.jsp">
<input type="text" name="id">
<input type="password" name="pw">
<input type="submit" value="확인">
</form>
</body>
</html>