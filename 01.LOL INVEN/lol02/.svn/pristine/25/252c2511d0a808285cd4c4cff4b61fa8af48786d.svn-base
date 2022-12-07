<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="lol.dbms.*" %>
<%@ page import="lol.vo.*" %>
<%
request.setCharacterEncoding("euc-kr");

UserVO loginVO = (UserVO)session.getAttribute("logon");

String uno = request.getParameter("uno"); //회원번호
String nickname = request.getParameter("nickname"); // 닉네임
String num1 = request.getParameter("num1"); //폰번호
String num2 = request.getParameter("num2"); //폰번호
String num3 = request.getParameter("num3"); //폰번호
String mail1 = request.getParameter("mail1"); //메일
String mail2 = request.getParameter("mail2"); //메일
String agree_mail = request.getParameter("agree_mail"); //메일 수신동의
String agree_sms = request.getParameter("agree_sms");  //sms 수신동의

String phonenum = num1 + "-" + num2 + "-" + num3; // 휴대폰번호 완성본!
String email = mail1 + "@" + mail2; //이메일 완성본

if(nickname == null || uno == null || loginVO == null || !loginVO.getUno().equals(uno))
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

//update [테이블명] set [컬럼명] = '값', [컬럼명] = '값' where ~~~
String sql = "update user set ";
sql += "unickname = '"+ nickname +"', upnum = '"+ phonenum +"', umail = '"+ email +"', ";
sql += "umcheck = '"+ agree_mail +"', usmscheck = '"+ agree_sms +"' where uno = " + uno;
dbms.RunSQL(sql);
dbms.DBClose();
%>
<script>
	alert("수정이 완료되었습니다.");
	window.close();
</script>
    