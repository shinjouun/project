<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="lol.dbms.*" %>
<%@ page import="lol.vo.*" %>
<%
request.setCharacterEncoding("euc-kr");
//넘어온 input 타입 데이터를 문자열로 받는다.
String id = request.getParameter("userid");
String pw = request.getParameter("userpw");

DBManager dbms = new DBManager();
dbms.DBOpen();
String sql = "";
sql += "select uno, uid, uname, uadmin from user ";
sql += "where uretire = 'N' and uid = '"+ id +"' and upw = md5('"+ pw +"') ";
dbms.OpenQuery(sql);

if(dbms.GetNext() == true)
{
	//로그인이 성공
	UserVO vo = new UserVO();
	
	vo.setUid(dbms.GetValue("uid"));
	vo.setUadmin(dbms.GetValue("uadmin"));
	vo.setUname(dbms.GetValue("uname"));
	vo.setUno(dbms.GetValue("uno"));
	
	session.setAttribute("logon", vo);
	
	//해당하는 url로 이동! jsp!
	response.sendRedirect("../main/index.jsp");
}
else
{
	//로그인 실패
	%>
	<script>
		alert("아이디와 비밀번호가 일치하지 않습니다!");
		document.location = "../user/login.jsp";
		//스크립트에서 지정한 url로 이동!
	</script>
	<%
}
dbms.CloseQuery();
dbms.DBClose();
%>