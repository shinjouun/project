<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="./config/config.jsp"%>
<%
request.setCharacterEncoding("euc-kr");
String genre[] = request.getParameterValues("genre");
UserVO LoginVO = (UserVO)session.getAttribute("login");
if(LoginVO == null)
{
	response.sendRedirect("login.jsp");
	return;
}
DBManager db = new DBManager();
db.DBOpen();

for(int i = 0 ; i< genre.length ; i++)
{
	String sql="";
	sql ="insert into hobby(uno,hobby) ";
	sql +="values('" + LoginVO.getUno() + "','" + genre[i] + "' ) ";
	db.RunSQL(sql);
	
}
db.DBClose();

response.sendRedirect("index.jsp");
%>



