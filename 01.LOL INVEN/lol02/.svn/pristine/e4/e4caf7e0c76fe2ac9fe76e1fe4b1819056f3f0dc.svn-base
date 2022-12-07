<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="lol.dbms.*" %>
<%@ page import="lol.vo.*" %>    
<%
String cpno = request.getParameter("cpno");
String rno = request.getParameter("rno");

UserVO loginVO = (UserVO)session.getAttribute("logon");

if(loginVO == null || cpno == null || rno == null)
{
	response.sendRedirect("../main/index.jsp");
	return;
}

DBManager dbms = new DBManager();
dbms.DBOpen();

String sql = "";
sql += "select rnote, date(rdate) as rdate, rscore, ";
sql += "(select cpstdimg from champion where cpno = review.cpno) as cpstdimg ";
sql += "from review ";
sql += "where rno = " + rno;

dbms.OpenQuery(sql);

dbms.GetNext();

String rnote = dbms.GetValue("rnote");
String cpstdimg = dbms.GetValue("cpstdimg");
String rdate = dbms.GetValue("rdate");
String rscore = dbms.GetValue("rscore");
dbms.CloseQuery();


dbms.DBClose();
%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>League of Legend Inven</title>
		<link rel="stylesheet" href="../css/popupstyle.css"/>
		<script src="../js/jquery-3.6.0.js"></script>
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
	window.onload = function()
	{
		$("#btn_reviewmodify").click(function(){
			$("#reviewmodify").submit();
		});
	}
	</script>
	<form id="reviewmodify" method="post" action="reviewmodifyok.jsp">
	<input type="hidden" id="rno" name="rno" value="<%= rno %>">
	<input type="hidden" id="cpno" name="cpno" value="<%= cpno %>">
		<table class="review_md" border="0" width="500px" height="150px">
			<tr>
				<td><img src="../upload/<%= cpstdimg %>"></td>
				<td>
				<textarea id="rnote" name="rnote" class="story" rows="1" ><%= dbms.test(rnote) %></textarea>
				</td>
				<td><div style="color:black;"><%= rdate %></div>
					<br>
					평점:
					<select id="cpscore" name="cpscore" style="width:50px">
						<option value="1" <%= (rscore.equals("1") ?  "selected" :  "") %>>1</option>
						<option value="2" <%= (rscore.equals("2") ?  "selected" :  "") %>>2</option>
						<option value="3" <%= (rscore.equals("3") ?  "selected" :  "") %>>3</option>
						<option value="4" <%= (rscore.equals("4") ?  "selected" :  "") %>>4</option>
						<option value="5" <%= (rscore.equals("5") ?  "selected" :  "") %>>5</option>
					</select>
				</td>
				<td><input type="button" id="btn_reviewmodify" value="수정"></td>
			</tr>
		</table>
	</form>	
	</body>
</html>