<%@page import="db.DBConn"%>
<%@page import="java.sql.*, java.lang.*, java.util.* "%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    
        <%
    	//스크립트에서 넘겨오는 파라메타를 받는 변수
    	String seq = request.getParameter("seq");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<script lang="javascript">
	//수정 시 아이디와 암호 입력 여부를 체크하는 스크립트
	function go_mod(seq)
	{
		var frm = document.formm;
		if(frm.id.value=="")
		{
			alert("아이디를 입력 하세요");
			frm.id.focus();
		}else if(frm.pw.value=="")
		{
			alert("암호를 입력하세요.");
			frm.pw.focus();
		}else
		{
			if(confirm("수정하시겠습니까?"))
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
아 이 디 : <input type="text" name="id"><br>
패스워드 : <input type="password" name="pw"><br>
<input type="button" value="확인" onclick="go_mod(<%=seq%>)">
</form>
</body>
</html>