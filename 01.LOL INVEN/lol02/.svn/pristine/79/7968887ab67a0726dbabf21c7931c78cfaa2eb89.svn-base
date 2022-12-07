<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="lol.dbms.*" %>
<%@ page import="lol.vo.*" %>
<%
request.setCharacterEncoding("euc-kr");
UserVO loginVO = (UserVO)session.getAttribute("logon"); // 로그인한 정보를 세션에 등록하고, 등록한 세션을 UserVO로 가져온다.


String uno   = request.getParameter("uno");// 변수에 이름도 컬러명이름으로똑같이 주소이름 !
String curpw = request.getParameter("curpw"); // 현재 비밀번호
String mpw   = request.getParameter("mpw");  // 바꿀 비밀번호
if( uno == null || curpw == null || mpw == null || loginVO == null || !loginVO.getUno().equals(uno))
{
	response.sendRedirect("../main/index.jsp");
	return;
}

DBManager dbms = new DBManager();
dbms.DBOpen();
String sql = "";
sql += "select uno from user where uno = '"+ uno +"' and upw = md5('"+ curpw +"') "; //현재 나의 계정 비밀번호가 맞는지 체크!
dbms.OpenQuery(sql);
if( dbms.GetNext() == false )
{
	//너 비밀번호 틀렷어 다시 입력해..
	%>
	<script>
		alert("현재 비밀번호가 일치하지 않습니다!");
		document.location = "upwmodify.jsp?uno=<%= uno %>";
	</script>
	<%
	return;
}
dbms.CloseQuery();

sql = "update user set upw = md5('"+ mpw +"') where uno = " + uno;
dbms.RunSQL(sql);
dbms.DBClose();
%>
<script>
	alert("비밀번호 변경이 완료되었습니다!");
	document.location = "uinfomodify.jsp?uno=<%= uno %>";
</script>
