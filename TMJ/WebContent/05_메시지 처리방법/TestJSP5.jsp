<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	//메시지 처리를 구분하기 위한 변수정의
	int message=0;
	
	
	if(id.equals(""))
	{
		out.println("아이디가 잘못되었습니다.<br><a href='HtmlJSP4.html'>입력가기</a>");
	}
	if(!id.equals("") && pw.equals(""))
	{
		out.println("패스워드가 잘못되었습니다.<br><a href='HtmlJSP4.html'>입력가기</a>");
	}
	if(!"".equals(id) && !"".equals(pw))
	{
		out.println(id+"님 하이루~~~~!");
		
	}
%>