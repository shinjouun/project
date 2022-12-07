<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="lol.vo.*"  %>
<%@ page import="lol.dbms.*" %>        
<%
UserVO loginVO = (UserVO)session.getAttribute("logon");

String rno = request.getParameter("rno");
String cpno = request.getParameter("cpno");
if(loginVO == null || rno == null || cpno == null)
{
	response.sendRedirect("../main/index.jsp");
	return;
}

DBManager dbms = new DBManager();
dbms.DBOpen();

String sql = "";
sql += "delete from review where rno = " + rno;
dbms.RunSQL(sql);
dbms.DBClose();
%>
<script>
	alert("평가가 삭제 되었습니다.");
	document.location = "../champion/cpinfo.jsp?cpno= <%=cpno %> ";
</script>