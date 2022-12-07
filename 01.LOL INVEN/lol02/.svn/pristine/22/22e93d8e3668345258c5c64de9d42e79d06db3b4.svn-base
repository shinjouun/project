<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="lol.dbms.*" %>
<%
request.setCharacterEncoding("euc-kr");

String rnote = request.getParameter("rnote");
String rno = request.getParameter("rno");
String cpno = request.getParameter("cpno");
String cpscore = request.getParameter("cpscore");

DBManager dbms = new DBManager();
dbms.DBOpen();

String sql ="";
sql += "update review set ";
sql += "rnote = '" + dbms.ts_form(rnote) + "', ";
sql += "rscore = '" + cpscore + "', "; 
sql += "rmdate = now() ";
sql += "where rno = " +rno;
dbms.RunSQL(sql);
dbms.DBClose();
%>
<script>
	alert("수정이 완료 되었습니다.");
	opener.parent.location.reload();
	window.close();
</script>