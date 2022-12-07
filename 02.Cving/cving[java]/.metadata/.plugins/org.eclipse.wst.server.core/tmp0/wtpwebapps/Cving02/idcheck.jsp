<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="./config/config.jsp" %> 
<%
String id = request.getParameter("id");

DBManager db = new DBManager();
db.DBOpen();
String sql = "";
sql += "select uid from user where uid = '"+ id +"' ";
db.OpenQuery(sql);
if(db.GetNext() == false)
{
	//중복된 아이디가 없을 때..
	out.print("SUCESS");
}
else
{
	//중복된 아이디가 있을 때..
	out.print("FALE");
}

db.CloseQuery();
db.DBClose();

%>