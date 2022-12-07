<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>League of Legend Inven</title>
		<link rel="stylesheet" href="../css/popupstyle.css"/>
	</head>
	<body>
	<script type="text/javascript">
	function DoSubmit()
	{
		if(confirm("수정 하시겠습니까?") == true)
		{
			window.close();
		}
	}
	</script>
		<table class="review_md" border="0" width="500px" height="150px">
			<tr>
				<td>챔피언사진</td>
				<td>
				<textarea class="story" >수정할 평가내용입니다.수정할 평가내용입니다.수정할 평가내용입니다.
수정할 평가내용입니다.수정할 평가내용입니다.
수정할 평가내용입니다.수정할 평가내용입니다.</textarea>
				</td>
				<td>작성날짜</td>
				<td><input type="button" onclick="DoSubmit();" value="수정"></td>
			</tr>
		</table>
	</body>
</html>