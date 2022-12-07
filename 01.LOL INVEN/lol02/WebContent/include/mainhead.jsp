<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="lol.vo.*" %>
<%@ page import="lol.dbms.*"  %>    
<%
UserVO loginVO = (UserVO)session.getAttribute("logon");

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>League of Legend Inven</title>
		<link rel="stylesheet" href="../css/style.css"/>	
		<script src="../js/jquery-3.6.0.js"></script>
	</head>
	<body style="padding:0 0 0 0; margin: 0 0 0 0;">
	<script>
		function DoModify()
		{
			<%
			if(loginVO != null)
			{
				%>	
				window.open("../user/uinfomodify.jsp?uno=<%= loginVO.getUno() %>", "_uinfomodify",
				"width=538,height=360,left=700,top=400");		
				<%
			}
			%>
		}
		function DoQuit()
		{
			<%
			if(loginVO != null)
			{
				%>
				window.open("../user/uquitcheck.jsp?uno=<%= loginVO.getUno() %>", "_uquitcheck",
				"width=500,height=200,left=800,top=500");
				<%
			}
			%>
				
		}
		function DoLogout()
		{
			document.location = "../user/logout.jsp";
		}
	</script>
		<!-- 상단 리그오브레전드 이미지부분 -->
		<table width="900px" align="center" style="border-collapse :collapse;" >
			<tr>
				<td align="center">
					<a href="../main/index.jsp">
					<div style="display:block;">
					<img src="../img/lol1.png" width="800" height="200" align="middle" style="">
					</div>
					</a>
				</td>
			</tr>
		</table>
		<table border="1" border-collapse=collapse border-spacing=0px width="1200px" height="800px" align="center">
			<tr>
				<td colspan="3" style="text-align:right; height:30px;">
				<div class="topmenu" style="height:32px; padding-top:10px;">
					<%
					if(loginVO != null)
					{
						//로그인이 되어 있을 때!!!
						%>
						<span style="color:darkred;"><%= loginVO.getUname() %></span> <span style="color:lightgray;">님 반갑습니다!</span>
						<a href="javascript:DoLogout();">로그아웃</a>
						<a href="javascript:DoModify();">회원정보수정</a>
						<a href="javascript:DoQuit();">회원탈퇴</a>&nbsp;&nbsp;&nbsp;
						<%
					}else
					{
						//로그인이 안되어 있을 때 
						%>
						<a href="../user/join.jsp">회원가입</a>
						<a href="../user/login.jsp">로그인</a>
						&nbsp;&nbsp;
						<%
					}
					%>
				</div>
				</td>
			</tr>
			<tr>
				<td class="leftmenu" style="width:200px;" valign="top">
						<a href="../main/index.jsp">홈</a>
						<br>
						<a href="../champion/cplist.jsp">챔피언 목록</a>
						<br>
						<a href="../champion/cpreview.jsp">챔피언 평가</a>		
						<br>
				</td>
				<td valign="top">