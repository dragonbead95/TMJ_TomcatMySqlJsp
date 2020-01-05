<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%
    	//결과 메시지를 처리하기 위한 변수 값 설정 및 파라메타 받기
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
			alert("아이디를 입력 하세요");
			frm.id.focus();
		}else if(frm.pw.value=="")
		{
			alert("암호를 입력하세요.");
			frm.pw.focus();
		}else
		{
			if(confirm("저장히시겠습니까?"))
			{
				frm.action = "./Dbinsert_save.jsp";
				frm.submit();
			}
		}
	}
	
	//페이지 재 호출시 파라메타를 받아 메시지 처리하는 스크립트
	function show_msg(msg)
	{
		if(msg==1)
		{
			alert("저장이 되었습니다.");
		}else if(msg==2)
		{
			alert("오류가 발생되었습니다.");	
		}
	}
</script>
</head>
<body onload="show_msg('<%=msg%>')">
<form name="formm" method="post">
아 이 디 : <input type="text" name="id"><br>
패스워드 : <input type="password" name="pw"><br>
<input type="button" value="확인" onclick="go_save()">
</form>
</body>
</html>