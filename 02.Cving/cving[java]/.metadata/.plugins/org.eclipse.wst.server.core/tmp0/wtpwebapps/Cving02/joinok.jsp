<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="./config/config.jsp" %> 
<%
request.setCharacterEncoding("euc-kr");
String user_ID = request.getParameter("user_ID");
String user_PW1 = request.getParameter("user_PW1");
String user_name = request.getParameter("user_name");
String birth = request.getParameter("birth");
String gender = request.getParameter("gender");

DBManager db = new DBManager();
db.DBOpen();
String sql = ""; //한번 초기화 해주기 위해서 
sql ="insert into user(uid,upw,uname,ubirth,ugender) ";
sql +="values('"+ user_ID + "',md5('" + user_PW1 +"'),'" + user_name + "','" + birth + "','" + gender + "')";

db.RunSQL(sql);

db.DBClose();
%>
<script>
alert("회원가입 완료 !");
document.location = "login.jsp";
</script>
