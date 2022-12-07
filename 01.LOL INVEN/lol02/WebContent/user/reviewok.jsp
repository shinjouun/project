<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="lol.dbms.*" %>
<%@ page import="lol.vo.*" %>
<% 
UserVO loginVO = (UserVO)session.getAttribute("logon");

request.setCharacterEncoding("euc-kr");
//넘어온 input 타입 데이터를 문자열로 받는다.
String cpno = request.getParameter("cpno");
String rnote = request.getParameter("cpreview");
String rscore = request.getParameter("cpscore");
if(loginVO == null || cpno == null || rnote == null || rscore == null)
{
	response.sendRedirect("../main/index.jsp");
	return;
}
System.out.println(cpno);
System.out.println(rnote);
System.out.println(rscore);

DBManager dbms = new DBManager(); 

dbms.DBOpen();

String sql = "";
sql += "insert into review (uno, cpno, rnote, rscore) ";
sql += "values('" + loginVO.getUno() + "','" + cpno + "','" + dbms.ts_form(rnote) + "','" + rscore +"') ";
dbms.RunSQL(sql);

dbms.DBClose();

%>
<script>
	alert("평가 작성이 완료되었습니다.");
	document.location = "../champion/cpinfo.jsp?cpno=" + <%= cpno %>;
</script>
