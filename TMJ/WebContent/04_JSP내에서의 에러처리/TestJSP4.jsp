<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	if(id.equals(""))
	{
		out.println("���̵� �߸��Ǿ����ϴ�.<br><a href='HtmlJSP4.html'>�Է°���</a>");
	}
	if(!id.equals("") && pw.equals(""))
	{
		out.println("�н����尡 �߸��Ǿ����ϴ�.<br><a href='HtmlJSP4.html'>�Է°���</a>");
	}
	if(!"".equals(id) && !"".equals(pw))
	{
		out.println(id+"�� ���̷�~~~~!");
		
	}
%>