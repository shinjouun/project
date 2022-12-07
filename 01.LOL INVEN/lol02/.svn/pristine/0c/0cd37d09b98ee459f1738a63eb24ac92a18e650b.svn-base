<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="lol.dbms.*" %>
<%@ page import="lol.vo.*" %>
<%
UserVO loginVO = (UserVO)session.getAttribute("logon");

String uno = request.getParameter("uno");

if(loginVO == null || uno == null)
{
	%>
	<script>
		document.location = "../main/index.jsp";
	</script>
	<%
	return;
}

DBManager dbms = new DBManager();
dbms.DBOpen();
String sql = "delete from user where uno = " + uno;
dbms.RunSQL(sql);
dbms.DBClose();
session.removeAttribute("logon");
%>
<script>
	alert("Å»Åð°¡ ¿Ï·á µÇ¾ú½À´Ï´Ù.");
	opener.parent.location.reload();
	window.close();
</script>