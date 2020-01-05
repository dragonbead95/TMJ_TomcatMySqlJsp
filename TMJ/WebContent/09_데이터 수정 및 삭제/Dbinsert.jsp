<%@page import="db.DBConn"%>
<%@page import="java.sql.*, java.lang.*, java.util.* "%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    
    <%
    	//결과 메시지를 처리하기 위한 변수 값 설정 및 파라메타 받기
    	String msg = request.getParameter("msg");

    	
    	int num=1;	//리스트이 연변증가를 위한 변수
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
				frm.action = "./Dbinsert_save.jsp?save_mod_del=1";
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

	function go_mod(seq)
	{
		var url = "./Dbinsert_mod.jsp?seq="+seq;
		window.open(url,"_blank",'menubar=no, resizable=no, toolbar=no, scrollbars=yes, status=no, width=420, height=310');
	}
	
	function go_del(seq)
	{
		var frm = document.formm;
		if(confirm("삭제하시겠씁니까?"))
		{
			frm.action="./Dbinsert_save.jsp?seq="+seq+"&save_mod_del=3";
			frm.submit();
		}
	}
	

</script>
</head>
<body onload="show_msg('<%=msg%>')">
<form name="formm" method="post">
아 이 디 : <input type="text" name="id"><br>
패스워드 : <input type="password" name="pw"><br>
<input type="button" value="확인" onclick="go_save()">
<br>
<table border="1">
	<tr>
		<td>번호</td>
		<td>아이디</td>
		<td>패스워드</td>
		<td>삭제</td>
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
			<td><a href="#" onClick="javascript:go_del('<%= rs.getString(1)%>')">삭제</a></td>
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
			<td colspan="4">저장된 데이터가 없습니다.</td>
		</tr>
		<% 	
	}
		%>
</table>
</form>
</body>
</html>