<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/mainhead.jsp" %>
<script>
var isCheckID = false;
var IsUseID = false;

window.onload = function()
{
	$("#id").focus();
}

function DoUseID()
{	
	id = $("#id").val();
	if(id.length <= 5)
	{
		$("#msg").css("color","red");
		$("#msg").html("5~12자 이내로 입력하세요");
		IsUseID = false;
	}else if(id.length >= 12)
	{
		$("#msg").css("color","red");
		$("#msg").html("5~12자 이내로 입력하세요");
		IsUseID = false;
	}else
	{
		$("#msg").css("color","green");
		$("#msg").html("조건에 맞는 아이디입니다.");
		IsUseID = true;
	}	
}
function DoKey()
{
	var num1 = document.getElementById("num1").value.length;
	if(num1 == 3)
	{
		$("#num2").focus();
	}	
	var num2 = document.getElementById("num2").value.length;
	if(num2 == 4)
	{
		$("#num3").focus();
	}
}


function IDCheck()
{
	if(IsUseID == false)
	{
		alert("글자 수가 맞지 않습니다.!");
		return;
	}
	
	var uid = $("#id").val();
	if(uid == "")
	{
		alert("아이디를 입력하세요");
		$("#id").focus();
		return;
	}	
	window.open("idcheck.jsp","_idcheck", "width=500,height=500");
	
	isCheckID = true;
}

function DoUsePW()
{
	pw = $("#pw").val();
	pwcheck = $("#pwcheck").val();
	if(pwcheck != pw)
	{
		$("#pwmsg").css("color","red");
		$("#pwmsg").html("비밀번호가 일치하지 않습니다");
	}else
	{
		$("#pwmsg").css("color","green");
		$("#pwmsg").html("비밀번호가 일치합니다");
	}	
}
function DoCheck()
{

	//document.join.id.value -> $("#id").val() 이거랑 같음. 
	id = $("#id").val();
	if(id == "") //아이디가 비어있는지 체크
	{
		alert("아이디를 입력 해주세요");
		$("#id").focus();
		return false;
	}	
	if(isCheckID == false) // 중복검사를 실시했는지 체크!
	{
		alert("아이디 중복검사를 해주세요");
		$("#id").focus();
		return false;
	}	
	
	pw = $("#pw").val();
	if(pw == "") // 비밀번호 비어있는지 체크
	{
		alert("비밀번호를 입력 해주세요");
		$("#pw").focus();
		return false;
	}
	
	pwcheck = $("#pwcheck").val();
	if(pwcheck != pw) //비밀번호랑 확인비밀번호랑 같은지 체크
	{
		alert("비밀번호가 일치하지 않습니다");
		$("#pwcheck").focus();
		return false;
	}	
	
	if($("#nickname").val() == "") //닉네임 비어있는지 체크
	{
		alert("닉네임을 입력 해주세요");
		$("#nickname").focus();
		return false;
	}	
	
	if($("#name").val() == "") // 이름이 비었는지 체크
	{
		alert("이름을 입력 해주세요");
		$("#name").focus();
		return false;
	}	
	if($("#num1").val() == "" || $("#num2").val() == "" || $("#num3").val() == "") // 폰번호 비어있는지 체크
	{
		alert("휴대폰번호를 입력 해주세요");
		$("#num1").focus();
		return false;
	}	
	if($("#mail1").val() == "" || $("#mail2").val() == "") // 메일 비어있는지 체크
	{
		alert("이메일을을 입력 해주세요");
		$("#mail1").focus();
		return false;
	}	
	if(confirm("회원가입을 하시겠습니까?") != 1 ) // 회원가입 할건지 물어보는!
	{
		return false;
	}
	
	return document.location = "joinok.jsp";
}
</script>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<form method="post" id="join" action="joinok.jsp">
	<table border="center" align="center">
		<tr>
			<th colspan="2" align="center">회원가입</th>
		</tr>
		<tr>
			<td>*아이디:</td>
			<td><input type="text" id="id" name="id" onkeyup="DoUseID();"><input type="button" value="아이디 중복검사" onclick="IDCheck();">
			<span id="msg" style="color:red;">5~12자 이내로 입력하세요</span></td>
		</tr>
		<tr>
			<td>*비밀번호:</td>
			<td><input type="password" id="pw" name="pw"></td>
		</tr>
		<tr>
			<td>*비밀번호확인:</td>
			<td><input type="password" id="pwcheck" name="pwcheck" onkeyup="DoUsePW();">
			<span id="pwmsg"></span></td>
		</tr>
		<tr>
			<td>*닉네임:</td>
			<td><input type="text" id="nickname" name="nickname"></td>
		</tr>
		<tr>
			<td>*이름:</td>
			<td><input type="text" id="name" name="name"></td>
		</tr>
		<tr>
			<td>*휴대폰 번호:</td>
			<td><input type="text" id="num1" onkeyup="DoKey();" 
			oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
			-<input type="text" id="num2" onkeyup="DoKey();"  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
			-<input type="text"id="num3" maxlength="4"  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" /></td>
		</tr>
		<tr>
			<td>*이메일:</td>
			<td><input type="text" id="mail1">@<input type="text" id="mail2" placeholder="직접입력">
		</tr>
		<tr>
			<td colspan="2" align="center">
			<input type="checkbox" id="receive" name="receive" value="MAIL">메일수신동의&nbsp;
			<input type="checkbox" id="receive" name="receive" value="SMS">SMS동의
			</td>
		</tr>
	</table>
	<table border="0" align="center" width="350px">
		<tr class="joinbutton">
			<td width="40%" align="center"><a href="javascript:DoCheck();">회원가입</a></td>
			
			<td width="40%" align="center"><a href="../main/index.jsp">취소</a></td>
		</tr>
	</table>
</form>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<%@ include file="../include/maintail.jsp" %>