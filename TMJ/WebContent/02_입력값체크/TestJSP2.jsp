<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	if(!id.equals("kumdong"))
	{
		out.println("���̵� �߸��Ǿ����ϴ�.");
	}
	if(!pw.equals("kumdong"))
	{
		out.println("�н����尡 �߸��Ǿ����ϴ�.");
	}
	if(id.equals("kumdong") && pw.equals("kumdong"))
	{
		out.println(id+"�� ���̷�~~~~!");
		
	}
%>