<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="lol.dbms.*" %>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>League of Legend Inven</title>
		<link rel="stylesheet" href="../css/popupstyle.css"/>	
		<script src="../js/jquery-3.6.0.js"></script>
	</head>
	<body>		
		<%
		String id =request.getParameter("id");
		
		
		DBManager dbms = new DBManager(); 
		
		dbms.DBOpen();
		
		String sql ="";
		sql += "select uid from user where uid = '" + id +"' ";
		
		String checkMsg = "";
		dbms.OpenQuery(sql); //db에서 셀렉트 구문을 실행을 해본는것 !
		if(dbms.GetNext() == false)
		{
			checkMsg = "사용가능한 아이디 입니다.";
			%>
			<!-- html   영역 -->
			<script>
				//alert("사용가능한 아이디 입니다."); 
				opener.isCheckID = true;
				$("#msg",opener.document).html("사용가능한 아이디 입니다.");
				//window.close();
			</script>		
			<% //jsp영역 ( 자바소스코드,if else조건문..입력할수있는영역)
		
		}else
		{
			checkMsg = "중복된 아이디 입니다.";
			%>
			<script>
				//alert("중복된 아이디 입니다.");
				opener.isCheckID = false;
				opener.isUseID = false;
				$("#msg",opener.document).css("color","red");
				$("#msg",opener.document).html("중복된 아이디 입니다.");
				//window.close();
			</script>
			<%
		}
		dbms.DBClose();
		%>
		<table border="0" style="border:none;width:100%">
			<tr>
				<td style="height:30px;text-align:center;background-color:#ffff0">
				<%=  checkMsg %>
				</td>
			</tr>
			<tr>
				<td id="upm_button" style="height:30px;text-align:center;background-color:#ffffff">
					<a href="javascript:window.close();">확인</a>
				</td>
			</tr>
		</table>
	</body>
</html>
