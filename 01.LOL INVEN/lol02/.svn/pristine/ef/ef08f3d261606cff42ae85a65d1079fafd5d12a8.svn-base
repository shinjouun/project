<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="lol.dbms.*" %>
<%@ page import="lol.vo.*" %>
<%
request.setCharacterEncoding("euc-kr");
UserVO loginVO = (UserVO)session.getAttribute("logon");


String uno = request.getParameter("uno");// 변수에 이름도 컬러명이름으로똑같이 주소이름 !

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>비밀번호 변경</title>
		<link rel="stylesheet" href="../css/popupstyle.css"/>
		<script src="../js/jquery-3.6.0.js"></script>
	</head>
	<body>
	<script>
		window.onload = function()
		{
			$("#curpw").focus();
			
			$("#btn_modify").click(function(){
				if($("#curpw").val() == "")
				{
					alert("현재 비밀번호를 입력하세요.");
					$("#curpw").focus();
					return;
				}
				if($("#mpw").val() == "")
				{
					alert("변경할 비밀번호를 입력하세요");
					$("#mpw").focus();
					return;
				}
				if($("#mpw").val() != $("#mpwckeck").val())
				{
					alert("변경할 비밀번호가 일치하지 않습니다.");
					$("#mpw").focus();
					return;
				}
				$("#upwpassword").submit(); // 수정을누르면 upwmodifyok로 넘어감
			});
			return;
		}
	</script>
		<form id="upwpassword" method="post" action="../user/upwmodifyok.jsp">
			<input type="hidden" id="uno" name="uno" value="<%= uno %>">
			<table id="upm_tbl">
				<tr>
					<th colspan="2">비밀번호 변경</th>
				</tr>
				<tr>
					<td colspan="2">현재 비밀번호:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="password" id="curpw" name="curpw"></td>
				</tr>
				<tr>
					<td colspan="2"> 새로운 비밀번호:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="password" id="mpw" name="mpw"></td> <!--  넘겨줄때는 name -->
				</tr>
				<tr>
					<td colspan="2"> 새로운 비밀번호 확인: <input type="password" id="mpwckeck" name="mpwckeck"></td>
				</tr>
				<tr>
					<td id="upm_button" align="right"><a id="btn_modify" href="#">수정</a>&nbsp;&nbsp;</td>
					<td id="upm_button" align="left"><a href="../user/uinfomodify.jsp?uno=<%= uno %>">취소</a>&nbsp;&nbsp;</td>
				</tr>
			</table>
		</form>
	</body>
</html>