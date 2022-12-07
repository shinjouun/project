<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="lol.vo.*"  %>

<%
UserVO loginVO = (UserVO)session.getAttribute("logon");
if(loginVO == null || !loginVO.getUadmin().equals("A"))
{
	response.sendRedirect("../main/index.jsp");
	return;
}

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>챔피언 등록</title>
		<link rel="stylesheet" href="../css/popupstyle.css"/>
		<script src="../js/jquery-3.6.0.js"></script>
	</head>
	
	<body>
	<script>
		var iscpnamecheck = false;
		
		window.onload = function()
		{
			$("#cpname").focus();
			//btn_add를 클릭했을때 DoClick를 동작한다.
			$("#btn_add").click(function(){
				DoClick();
			});
		}
		
		function DoClick()
		{
			//챔피언 이름이 공백일때
			if($("#cpname").val() == "")
			{
				alert("챔피언 이름을 입력 해주세요");
				$("#cpname").focus();
				return;
			}
			
			//챔피언 닉네임이 공백일때
			if($("#cpnickname").val() == "")
			{
				alert("챔피언 칭호를 입력 해주세요");
				$("#cpnickname").focus();
				return;
			}
			
			//챔피언 영어이름이 공백일때
			if($("#cpename").val() == "")
			{
				alert("챔피언 영문이름을 입력 해주세요");
				$("#cpename").focus();
				return;
			}	
			
			//챔피언 기본이미지가 없을때
			if($("#cpstdimg").val() == "")
			{
				alert("챔피언 기본이미지를 입력 해주세요");
				$("#cpstdimg").focus();
				return;
			}	
			
			//챔피언배경이미지가 없을때
			if($("#cpbkimg").val() == "")
			{
				alert("챔피언 배경이미지를 입력 해주세요");
				$("#cpbkimg").focus();
				return;
			}	
			
			//챔피언 스토리가 공백일때
			if($("#cpstory").val() == "")
			{
				alert("챔피언 스토리를 입력 해주세요");
				$("#cpstory").focus();
				return;
			}
			
			//bolean <<
			//0은 false 1은 true
			if(confirm("등록하시겠습니까?") != 1) //등록안할때
			{
				return;
			}
			$("#cpadd").submit();
		}
	</script>
		<form id="cpadd" name="cpadd" method="post" action="../admin/cpaddok.jsp" enctype="multipart/form-data">
			<table class="cpaddlist"  border="1" align="center" width="500px">
				<tr>
					<td>챔피언 이름:<input type="text" id="cpname" name="cpname" value=""></td>
				</tr>
				<tr>
					<td>챔피언 칭호:<input type="text" id="cpnickname" name="cpnickname"></td>		
				</tr>	
				<tr>
					<td>챔피언 영문 이름:<input type="text" id="cpename" name="cpename"></td>		
				</tr>
				<tr>
					<td>챔피언 기본이미지:<input type="file" id="cpstdimg" name="cpstdimg"></td>		
				</tr>
				<tr>	
					<td>챔피언 배경 이미지:<input type="file" id="cpbkimg" name="cpbkimg"></td>	
				</tr>
				<tr>		
					<td>챔피언 설명:<textarea rows="5" style="width:95%" id="cpinfo" name="cpinfo"></textarea></td>
				</tr>
				<tr>	
					<td>챔피언 스토리:<textarea rows="5" style="width:95%" id="cpstory" name="cpstory"></textarea></td>
				</tr>
				<tr>
					<td align="center">
					<%
						String pos[] = { "001:전사", "002:마법사", "003:원거리" };
						for(int i=0; i < pos.length; i++)
						{
							String ary[] = pos[i].split(":");
							if(i == pos.length-1)
							{
								%>
								<input type="checkbox" id="position" name="position" value="<%= pos[i] %>" >&nbsp;&nbsp;<%=ary[1] %>
								<%
							}
							else
							{
								%>
								<input type="checkbox" id="position" name="position" value="<%= pos[i] %>" >&nbsp;&nbsp;<%=ary[1] %>&nbsp;&nbsp;&nbsp;&nbsp;
								<%
							}
						}
					%>
					</td>
				</tr>	
				<tr>
					<td align="center"><input type="button" value="등록" id="btn_add" name="btn_add"></td>
				</tr>	
			</table>	
			</form>
		</body>
</html>