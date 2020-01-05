<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    %>
<%
	request.setCharacterEncoding("euc-kr");
	String id = request.getParameter("id");
	out.println(id);
%>