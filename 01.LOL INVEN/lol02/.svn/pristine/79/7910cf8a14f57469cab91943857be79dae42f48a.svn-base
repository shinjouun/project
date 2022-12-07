<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="lol.vo.*" %>    
<%
UserVO loginVO = (UserVO)session.getAttribute("logon");
String uno = request.getParameter("uno");
if( loginVO == null || uno == null)
{
	response.sendRedirect("../main/index.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/popupstyle.css"/>
<script src="../js/jquery-3.6.0.js"></script>
</head>
<body>
	<script>
	window.onload = function()
	{
		$("#pw").keydown(function(e) {
			
			if (e.keyCode == 13) 
			{
				//엔터키가 눌렸을 때
				MoveToQuit();
			}
		});
	 
		$("#pw").focus();
		$("#btn_quit").click(function(){
			 MoveToQuit();
		});
	}
	function MoveToQuit()
	{
		if($("#pw").val() == "")
		{	
			alert("비밀번호를 입력 해주세요");
			$("#pw").focus();
			return;
		}
		$.ajax({
			type: "post",
			url: "../user/upwcheck.jsp",
			dataType: "html",
			data :
			{
				pw : $("#pw").val(),
				uno : "<%= uno %>",
			},
			success : function(data)
			{
				data = data.trim();
				if( data == "SUCCESS")
				{
					if(confirm("정말 탈퇴 하시겠습니까?"))
					{
						document.location = "../user/uquit.jsp?uno=<%= uno %>" ;	
					}
					else
					{
						window.close();
					}
				}
				else
				{
					alert("비밀번호가 일치하지 않습니다!");
				}
			},
			error : function(xhr, status, error)
			{
				// 통신 오류 발생시
			}
		});
	}
	</script>
	<form method="post" id="check" action="../user/uquit.jsp" onsubmit="return false;">
		<table style="width:480px; height:180px;" border="0">
			<tr>
				<td align="center" valign="bottom">비밀번호를 입력 해주세요<br><input type="password" id="pw"></td>
			</tr>
			<tr>
				<td align="center" valign="top"><input type="button" id="btn_quit" value="확인"></td>
			</tr>
		</table>
	</form>	
</body>
</html>