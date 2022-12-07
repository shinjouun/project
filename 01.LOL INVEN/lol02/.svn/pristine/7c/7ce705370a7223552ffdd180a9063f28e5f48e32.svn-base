<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="lol.dbms.*" %>
<%@ page import="lol.vo.*" %>

<%
UserVO loginVO = (UserVO)session.getAttribute("logon");
String pw = request.getParameter("pw");
String uno = request.getParameter("uno");

if(loginVO == null || pw == null)
{
	response.sendRedirect("../main/index.jsp");
	return;
}

DBManager dbms = new DBManager();
dbms.DBOpen();

String sql = "select * from user where uno = '"+ uno +"' and upw = md5('"+ pw +"') ";
dbms.OpenQuery(sql);
if( dbms.GetNext() == true)
{
	//로그인한 아이디의 비밀번호가 맞으면!
	out.print("SUCCESS");
}
else
{
	//로그인한 아이디의 비밀번호가 다르면!
	out.print("FAIL");
}
dbms.CloseQuery();
dbms.DBClose();
%>