<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
			$("#btn_modify").click(function(){
				if($("#mpw").val() == "")
				{
					alert("비밀번호를 입력하세요");
					$("#mpw").focus();
					return;
				}
				if($("#mpw").val() != $("#mpwckeck").val())
				{
					alert("비밀번호가 일치하지 않습니다.");
					$("#mpw").focus();
					return;
				}
				document.location = "upwmodifyok.jsp";
			});
			return;
		}
	</script>
		<form id="upwpassword" method="post" action="upwmodifyok.jsp">
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
					<input type="password" id="mpw" name="mpw"></td>
				</tr>
				<tr>
					<td colspan="2"> 새로운 비밀번호 확인: <input type="password" id="mpwckeck" name="mpwckeck"></td>
				</tr>
				<tr>
					<td id="upm_button" align="right"><a id="btn_modify" href="#">수정</a>&nbsp;&nbsp;</td>
					<td id="upm_button" align="left"><a href="uinfomodify.jsp">취소</a>&nbsp;&nbsp;</td>
				</tr>
			</table>
		</form>
	</body>
</html>