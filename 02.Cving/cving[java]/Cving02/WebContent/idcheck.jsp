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
	//�ߺ��� ���̵� ���� ��..
	out.print("SUCESS");
}
else
{
	//�ߺ��� ���̵� ���� ��..
	out.print("FALE");
}

db.CloseQuery();
db.DBClose();

%>