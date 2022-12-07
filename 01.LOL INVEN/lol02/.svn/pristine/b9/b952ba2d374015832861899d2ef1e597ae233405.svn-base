<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="lol.dbms.*" %>
<%@ page import="lol.vo.*" %>
<%
request.setCharacterEncoding("euc-kr");
//넘어온 input 타입 데이터를 문자열로 받는다.
String cpno = request.getParameter("cpno");
UserVO loginVO = (UserVO)session.getAttribute("logon");
if(loginVO == null || !loginVO.getUadmin().equals("A") || cpno == null )
{
	response.sendRedirect("../main/index.jsp");
	return;
}

//넘어온 챔피언 번호에 있는 정보를 DB에서 가져온다.
DBManager dbms = new DBManager();
dbms.DBOpen();
String sql = "";
sql +="select cpkname, cpnickname, cpename, cpbkimg, cpstdimg, cpinfo, cpstory ";
sql += "from champion where cpno= " + cpno;
dbms.OpenQuery(sql);
dbms.GetNext();
String cpkname = dbms.GetValue("cpkname"); 
String cpnickname = dbms.GetValue("cpnickname");
String cpename = dbms.GetValue("cpename");
String cpbkimg = dbms.GetValue("cpbkimg");
String cpstdimg = dbms.GetValue("cpstdimg");
String cpinfo = dbms.GetValue("cpinfo");
String cpstory = dbms.GetValue("cpstory");
dbms.CloseQuery();
%>
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
			$("#btn_cpmodify").click(function(){
				DoChampionModify();
			});
		}
		function DoChampionModify()
		{
			/*
			if($("#cpstdimg").val() == "")
			{
				alert("챔피언 기본이미지를 입력 해주세요");
				$("#cpstdimg").focus();
				return;
			}	
			cpbkimg = document.cpmodify.cpbkimg.value;
			if($("#cpbkimg").val() == "")
			{
				alert("챔피언 배경이미지를 입력 해주세요");
				$("#cpbkimg").focus();
				return;
			}
			*/
			
			if($("#cpinfo").val() == "")
			{
				alert("챔피언 설명을 입력 해주세요");
				$("#cpinfo").focus();
				return;	
			}
			
			if($("#cpstory").val() == "")
			{
				alert("챔피언 스토리를 입력 해주세요");
				$("#cpstory").focus();
				return;
			}
			
			if(confirm("수정하시겠습니까?"))
			{
				$("#cpmodify").submit();
			}	 
		}
		function DoDownload(kind)
		{
			document.location = "../admin/down.jsp?cpno=<%=cpno%>&kind=" + kind;
		}
	</script>
		<form id="cpmodify" name="cpmodify" method="post" action="../admin/cpmodifyok.jsp" enctype="multipart/form-data">
			<input type="hidden" id="cpno" name="cpno" value="<%= cpno %>"> 
			<table  class="modify_name" border="1" align="center" width="500px" >
				<tr>
					<td>챔피언 이름: <%= cpkname %></td>
				</tr>	
				<tr>
					<td>챔피언 칭호: <%= cpnickname %></td>		
				</tr>
				<tr>
					<td>챔피언 영문 이름: <%= cpename %></td>		
				</tr>
				<tr>
					<td>챔피언 기본이미지:<input type="file" id="cpstdimg" name="cpstdimg" ></td>		
				</tr>
				<tr>
					<td>
					<a href="#" onclick="DoDownload('cpstdimg');"><%= cpstdimg %></a><br>
					<img src="../upload/<%=cpstdimg %>" style="width:100px; height:100px;">
					</td>		
				</tr>
				<tr>	
					<td>챔피언 배경 이미지:<input type="file" id="cpbkimg" name="cpbkimg"></td>	
				</tr>
				<tr>
					<td>
					<a href="#" onclick="DoDownload('cpbkimg');"><%= cpbkimg %></a><br>
					<img src="../upload/<%=cpbkimg %>" style="width:100px; height:100px;">					
					</td> 		
				</tr>
				<tr>		
					<td>챔피언 설명:<textarea rows="5" style="width:95%" id="cpinfo" name="cpinfo"><%= cpinfo %></textarea></td>
				</tr>
				<tr>	
					<td>챔피언 스토리:<textarea rows="15" style="width:95%" id="cpstory" name="cpstory"><%= cpstory %></textarea></td>
				</tr>
				<tr>
					<td align="center">
					<%
					
					String pos[] = { "001:전사", "002:마법사", "003:원거리" };
					for(int i=0; i < pos.length; i++)
					{
						String ary[] = pos[i].split(":");
					
						sql ="select pname from position where cpno= " + cpno + " and pcode = '" + ary[0] + "'";
						dbms.OpenQuery(sql);
						%>
						<input type="checkbox" id="position" name="position" value="<%= pos[i] %>" <%= (dbms.GetNext()) ? "checked" : "" %>>&nbsp;&nbsp;<%= ary[1] %>&nbsp;&nbsp;&nbsp;&nbsp;
						<%
						dbms.CloseQuery();	
					}
					%>
					</td>
				</tr>	
				<tr>
					<td align="center"><input type="button" id="btn_cpmodify" value="수정"></td>
				</tr>	
			</table>	
		</form>
	</body>
</html>
<%
dbms.DBClose();
%>