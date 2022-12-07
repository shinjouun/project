<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="lol.dbms.*" %>
<%@ page import="lol.vo.*" %>
<%
request.setCharacterEncoding("euc-kr");
UserVO loginVO = (UserVO)session.getAttribute("logon");

String uno = request.getParameter("uno");// 변수에 이름도 컬러명이름으로똑같이 주소이름 !
if( loginVO == null || uno== null || !loginVO.getUno().equals(uno))
{
	response.sendRedirect("../main/index.jsp");
	return;
}

DBManager dbms = new DBManager();
dbms.DBOpen();
String sql = "select uname, uid, unickname, umail, upnum, umcheck, usmscheck from user where uno = " + uno;
dbms.OpenQuery(sql);
if(dbms.GetNext() == false)
{
	response.sendRedirect("../main/index.jsp");
	return;
}

String uname = dbms.GetValue("uname");
String uid = dbms.GetValue("uid");
String unickname = dbms.GetValue("unickname");
String umail[] = dbms.GetValue("umail").split("@");
String upnum[] = dbms.GetValue("upnum").split("-");
String umcheck = dbms.GetValue("umcheck");
String usmscheck = dbms.GetValue("usmscheck");

dbms.DBClose();
%>
<!-- 친절version
<script>
//alert("잘못된 접근입니다!");
//document.location="../main/index.jsp";
</script>
 -->
<script>
	window.onload = function()
	{
		$("#btn_uinfomodify").click(function(){
			if(confirm("정말 수정 하시겠습니까?") == 1)
			{
				//확인이 눌렸으면..
				$("#uinfomodify").submit();
			}
		});
	}
</script>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>회원정보 수정</title>
		<link rel="stylesheet" href="../css/popupstyle.css"/>
		<script src="../js/jquery-3.6.0.js"></script>
	</head>
	<body>
		<form id="uinfomodify" method="post" action="../user/uinfomodifyok.jsp">
			<input type="hidden" id="uno" name="uno" value="<%= uno %>">
			<table class="uinfo_a"  border="1">
				<tr>
					<th align="center" colspan="3">회원 정보 수정</th>
				</tr>
				<tr>
					<td align="left">이름:
						<%= uname %></td>
				</tr>
				<tr>
					<td align="left">아이디:
					<%= uid %></td>
				</tr>
				<tr>
					<td align="center"><a href="upwmodify.jsp?uno=<%= uno %>">비밀번호 변경</a></td> <!-- 비밀번호변경 클릭시   넘겨받은 회원번호를 넘겨주는부분 -->
				</tr>
				<tr>
					<td align="left">닉네임:
					<input type="text" id="nickname" name="nickname" value="<%= unickname %>"></td>
				</tr>
				<tr>
					<td align="left">이메일:
					<input type="text" id="mail1" name="mail1" value="<%= umail[0] %>">
					@
					<input type="text" id="mail2" name="mail2" value="<%= umail[1] %>">
					</td>
				</tr>
				<tr>
					<td align="left">휴대폰:
					<input type="text" size="3" id="num1" name="num1" value="<%= upnum[0] %>">
					-
					<input type="text" size="5" id="num2" name="num2" value="<%= upnum[1] %>">
					-
					<input type="text" size="5" id="num3" name="num3" value="<%= upnum[2] %>">
					</td>
				</tr>
				<tr>
					<td align="left">수신동의:
					<input type="checkbox" id="agree_mail" name="agree_mail" value="Y" <%= (umcheck.equals("Y")) ? "checked":"" %>>메일수신동의
					<input type="checkbox" id="agree_sms" name="agree_sms" value="Y" <%= (usmscheck.equals("Y")) ? "checked":"" %>>SMS동의
					</td>
				</tr>
				<tr>
					<td align="center" colspan="3"><a href="#" id="btn_uinfomodify">수정</a></td>
				</tr>
			</table>
		</form>
	</body>
</html>