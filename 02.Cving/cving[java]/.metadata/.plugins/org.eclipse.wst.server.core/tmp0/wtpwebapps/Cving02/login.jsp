<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="EUC-KR">
	<title>CVING</title>
	<link rel="stylesheet" href="css/cving.css">
	<script src="./jquery-3.6.0.js"></script>
	</head>
	
	<script>
	window.onload = function()
	{
		$("#btn_login").click(function(){
			DoLogin();
		});
		
		$("#btn_join").click(function(){
			document.location = "./join.jsp";
		});
		
		$("input").keyup(function(e){
			if(e.keyCode == 13) //13엔터키
			{
				DoLogin();	
			}
		});
	}
	function DoLogin()
	{
		if($("#id").val()== "")
		{
			alert("아이디를 입력하세요");
			$("#id").focus();
			return;		
		}
		if($("#pw").val() == "")
		{
			alert("비밀번호를 입력하세요");
			$("#pw").focus();
			return;
		}
		$("#login").submit();
	}
	</script>
	<body>
		<div class="container">
			<div class="login_box">
				<div class="login_in">
					<img src="./img/logoback.png" style="width:250px; height:100px; margin-left:120px;">
					<form id="login" name="login" method="post" action="./loginok.jsp">
						<div align="center" style="margin-top:20px;">
							<input type="text" id="id" name="id" placeholder="아이디"
								maxlength="15" value="" style="height:35px; width:350px;">
						</div>
						<br>
						<div align="center">
							<input type="password" id="pw" name="pw" placeholder="비밀번호"
								maxlength="16" style="height:35px; width:350px;" >
					    </div>
					    <br><br><br>
						<div align="center">
							<input type="button" id="btn_login" name="btn_login" value="로그인 하기"
								style="height:30px; width:360px;" >
					    </div>
					</form>
					    <br>
						<div align="center">
							<input type="button" id="btn_join" name="btn_login" id="btn_login" value="회원가입 하기"
								style="height:30px; width:360px;">
					    </div>
				</div>
			</div> 
			<footer>
				<article class="foot_menu">
				 	<hr style="background-color:white;">
					명칭: 주식회사 이젠 | 등록번호: 전북 소4048 | 등록연월일: 2022. 10. 14 | 제호: CVING<br>
					발행: C team  | 발행소: 전라북도 전주시 덕진구 금암동 이젠컴퓨터학원 4층 407호<br>
					CVING의 콘텐츠는 저작권법의 보호를 받으므로, 무단 전재, 복사, 배포 등을 금합니다.<br>
				</article>
			</footer>
		</div>
	</body>
</html>