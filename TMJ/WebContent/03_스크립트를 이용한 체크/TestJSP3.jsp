<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	if(!id.equals("kumdong"))
	{
		out.println("아이디가 잘못되었습니다.");
	}
	if(!pw.equals("kumdong"))
	{
		out.println("패스워드가 잘못되었습니다.");
	}
	if(id.equals("kumdong") && pw.equals("kumdong"))
	{
		out.println(id+"님 하이루~~~~!");
		
	}
%>