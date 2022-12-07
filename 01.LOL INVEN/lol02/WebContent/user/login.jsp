<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/mainhead.jsp" %>
<%
if(loginVO != null)
{
	response.sendRedirect("../main/index.jsp");
	return;
}
%>
<script>
window.onload = function()
{
	$("#userid").focus();
	$("#userpw, #userid").keydown(function(e) {
		
		if (e.keyCode == 13) 
		{
			//엔터키가 눌렸을 때
			DoLogin();
		}
	});
	$("#btn_login").click(function(){
		DoLogin();
	});
 
}
function DoLogin()
{
	if($("#userid").val() == "")
	{
		alert("아이디를 입력하세요");
		$("#userid").focus();
		return;
	}
	if($("#userpw").val() == "")
	{
		alert("비밀번호를 입력하세요");
		$("#userpw").focus();
		return;
	}

	$("#login").submit(); // 아이디 비밀번호를 입력하면 폼을 전송한다.
}
</script>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<table border="0" style="background-color:white; width:100%; height:500px">
	<tr>
		<td align="center" valign="middle">
			<div class="loginborder">
				<form id="login" method="post" action="../user/loginok.jsp">
				&nbsp;&nbsp;아이디&nbsp;&nbsp;<input type="text" id="userid" name="userid">
				<br>
				비밀번호&nbsp;<input type="password" id="userpw" name="userpw">
				<br>
				<br>
				&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" id="btn_login">로그인하기</a>
				&nbsp;&nbsp;&nbsp;&nbsp;<a href="../main/index.jsp">취소</a>
				</form>
			</div>
		</td>
	</tr>
</table>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<%@ include file="../include/maintail.jsp" %>