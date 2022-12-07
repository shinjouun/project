<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="lol.dbms.*" %>    
<%
//해당 챔피언 번호의 포지션을 얻기위한 곳.
String cpno = request.getParameter("cpno");

DBManager dbms = new DBManager();
dbms.DBOpen();
String sql = "select pname from position where cpno = " + cpno;
dbms.OpenQuery(sql);
String position = "";
while(dbms.GetNext())
{
	String pname = dbms.GetValue("pname");
	
	if(position != "") position += ",";
	position += pname;
}
//문자열을 만들어서 넘겨준다. ex : 마법사  or  전사,마법사....
out.print(position);
dbms.CloseQuery();
dbms.DBClose();

%>