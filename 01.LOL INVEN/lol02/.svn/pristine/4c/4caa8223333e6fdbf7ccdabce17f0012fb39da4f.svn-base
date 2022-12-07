<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<%@ include file="../include/cphead.jsp" %>
<% 
DBManager dbms = new DBManager();
dbms.DBOpen();

String sql = "";
sql += "select cpbkimg, cpstory from champion ";
sql += "where cpno = " + cpno;
dbms.OpenQuery(sql);
dbms.GetNext();

String cpbkimg = dbms.GetValue("cpbkimg");
String cpstory = dbms.GetValue("cpstory");

cpstory = dbms.ts_form(cpstory);

%>
<style>

.story_div
{
	overflow-x:hidden;
	overflow-y:hidden; 
	color:white; 
	/* overflow-y:visible; */ 
	width:50%; 
	height:200px;
	font-size:14px; 
	line-height:28px;
	resize:none;
	padding-left:120px; 
	padding-bottom:80px;
}

.cpbackground_user
{
        margin: 0 ;
        width: 800px;
        height: 100vh;
        background: linear-gradient(
            to left,
            rgba(20, 20, 20, 0) 10%,
            rgba(20, 20, 20, 0.25) 25%,
            rgba(20, 20, 20, 0.5) 50%,
            rgba(20, 20, 20, 0.75) 75%,
            rgba(20, 20, 20, 1) 100%
          ), url("../upload/<%= cpbkimg %>");
        background-size: cover;
        opacity:1
}
</style>
<script>// 스토리 올라가는거
	var scrHeight = -20;
	window.setInterval(function() 
	{
		var elem = document.getElementById('story_div');
		//elem.scrollTop = elem.scrollHeight;
		elem.scrollTop = scrHeight;
		scrHeight += 1;
		if(scrHeight >= elem.scrollHeight ) scrHeight = 0;
	}, 50);
	
</script>
<div class="cpbackground_user" style="width:1000px; height:400px; margin-left:-1px;" >
	<table border="0" style="width:100%; height:400px;">
		<tr>
			<td>
			<div id="story_div" class="story_div"><%= cpstory %></div>
			</td>
		</tr>
	</table>
</div>
<%@ include file="../include/cptail.jsp" %>
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
