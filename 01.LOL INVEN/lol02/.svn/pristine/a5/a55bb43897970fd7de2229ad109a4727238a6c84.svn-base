<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>챔피언 수정</title>
		<link rel="stylesheet" href="../css/popupstyle.css"/>
		<script src="../js/jquery-3.6.0.js"></script>
	</head>
	<body>
	<script>
		window.onload = function()
		{
			document.cpmodify.cpname.focus();
		}
		function DoClick()
		{
			cpstdimg = document.cpmodify.cpstdimg.value;
			if(cpstdimg == "")
			{
				alert("챔피언 기본이미지를 입력 해주세요");
				document.cpmodify.cpstdimg.focus();
				return false;
			}	
			cpbkimg = document.cpmodify.cpbkimg.value;
			if(cpbkimg == "")
			{
				alert("챔피언 배경이미지를 입력 해주세요");
				document.cpmodify.cpbkimg.focus();
				return false;
			}
			
			if($("#cpinfo").val()=="")
			{
				alert("챔피언 설명을 입력 해주세요");
				$("#cpinfo").focus();
				return false;	
			}
			
			if(document.cpmodify.cpstory.value == "")
			{
				alert("챔피언 스토리를 입력 해주세요");
				document.cpmodify.cpstory.focus();
				return false;
			}
			//bolean <<
			//0은 false 1은 true
			if(confirm("등록하시겠습니까?") != 1)
			{
				return false;
			}	 
			alert("등록 되었습니다.");
			window.close();
			return true;
		}
	</script>
		<form name="cpmodify">
			<table  class="modify_name" border="1" align="center" width="500px">
				<tr>
					<td>챔피언 이름: 기존 챔피언 이름</td>
				</tr>	
				<tr>
					<td>챔피언 칭호: 기존 챔피언 칭호</td>		
				</tr>
				<tr>
					<td>챔피언 영문 이름: 기존 챔피언 영어이름</td>		
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
					<input type="checkbox" checked>&nbsp;&nbsp;전사&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="checkbox">&nbsp;&nbsp;마법사&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="checkbox">&nbsp;&nbsp;원거리
					</td>
				</tr>	
				<tr>
					<td align="center"><input type="button" value="등록" onclick="DoClick();"></td>
				</tr>	
			</table>	
		</form>
	</body>
</html>