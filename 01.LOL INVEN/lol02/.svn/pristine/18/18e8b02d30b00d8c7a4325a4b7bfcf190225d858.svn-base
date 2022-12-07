<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="lol.vo.*"  %>
<%@ page import="lol.dbms.*" %>
<%@ page import="java.io.*"%>
<%
String cpno[] = request.getParameter("cpno").split(","); // 20,19,18
//cpno[0] = 20 .....

DBManager dbms = new DBManager();
dbms.DBOpen();
String sql = "";
for(int i = 0 ; i < cpno.length ; i++)
{
	sql = "delete from position where cpno = " + cpno[i];
	dbms.RunSQL(sql);
	
	sql = "delete from champion where cpno = " + cpno[i];
	dbms.RunSQL(sql);
}
dbms.DBClose();
%>
<script>
	alert("챔피언 삭제가 완료되었습니다!");
	opener.parent.location.reload();
	window.close();
</script>