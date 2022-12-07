<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="lol.dbms.*" %>
<%
request.setCharacterEncoding("euc-kr");

String id = request.getParameter("id"); //회원가입 아이디
String pw = request.getParameter("pw"); // 회원가입 비밀번호
String nickname = request.getParameter("nickname"); // 닉네임
String name = request.getParameter("name"); //이름
String num1 = request.getParameter("num1"); //폰
String num2 = request.getParameter("num2"); 
String num3 = request.getParameter("num3"); 
String mail1 = request.getParameter("mail1"); //메일
String mail2 = request.getParameter("mail2");
String agree_mail = request.getParameter("agree_mail"); //메일 수신동의
String agree_sms = request.getParameter("agree_sms"); //sms 수신동의

if(id == null || pw == null || name == null || nickname == null)
{
	response.sendRedirect("../main.index.jsp");
	return;
}


if(agree_mail == null || !agree_mail.equals("Y") )
{
	agree_mail = "N";
}
if(agree_sms == null || !agree_sms.equals("Y") )
{
	agree_sms = "N";
}

DBManager dbms = new DBManager();

dbms.DBOpen();


String sql  = "";
sql += "insert into user ";
sql += "(uid, upw, unickname, uname, upnum, umail, umcheck, usmscheck) ";
sql += "values ('" + id + "', md5('" + pw + "'), '" + nickname + "', '" + name + "', '" + num1 + "-" + num2 + "-" + num3 + "', ";
sql += " '"+ mail1 + "@" + mail2 + "', '"+ agree_mail +"', '"+ agree_sms + "')";

dbms.RunSQL(sql);

dbms.DBClose();

%>
<script>
window.onload = function()
{
	alert("회원가입이 완료되었습니다.");
	document.location = "../user/login.jsp";
}
</script>
