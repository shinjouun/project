<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/mainhead.jsp" %> 
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<div class="homediv">
	<table class="mother_frame_tbl">
	<tr>
		<td>
			<table class="picture_frame_tbl" border="0" > 
				<tr>
					<td colspan="5" align="right" style="height:35px; border-bottom: 1px solid #444444;"><a class="iconthe" href=../champion/cplist.jsp>더보기 +</a></td>
	</tr>
	
	<%
	DBManager dbms = new DBManager();
	dbms.DBOpen();
	String sql = "select cpno, cpkname, cpstdimg from champion ";
	sql += "order by cpdate desc ";
	sql += "limit 0, 10 ";
	dbms.OpenQuery(sql);
	int rowno = 0;
	%>
	<tr class="index_cpnamecolor">
	<%
	while(dbms.GetNext())
	{
		String cpno = dbms.GetValue("cpno"); 
		String cpkname = dbms.GetValue("cpkname");
		String cpstdimg = dbms.GetValue("cpstdimg");
		if(rowno % 5 == 0)
		{
			%>
			</tr>
			<tr class="index_cpnamecolor">
			<%
		}
		%>
			<td align="center">
			<a href="../champion/cpinfo.jsp?cpno=<%= cpno %>">
			<img src="../upload/<%= cpstdimg %>">
			</a>
			<a href="../champion/cpinfo.jsp?cpno=<%= cpno %>"><br><%= cpkname %></a>
			</td>
		<%
		rowno++;
	}
	dbms.CloseQuery();
	%>	
	</tr>
</table>
<table border="0" style="width:100%; height:20px; background-color: white;">
	<tr>
		<td colspan="5" align="right" style="height:35px; border-bottom: 1px solid #444444;">
		<a class="iconthe" href=../champion/cpreview.jsp>
		더보기 +
		</a></td>
	</tr>
</table> 
<table border="0" style="width:100%; height:350px; background-color: white; " >
			<%
				sql = "";
				sql += "select rnote, ";
				sql += "(select cpno from champion where cpno = review.cpno) as cpno, ";
				sql += "(select cpkname from champion where cpno = review.cpno) as cpkname, ";
				sql += "(select cpstdimg from champion where cpno = review.cpno) as cpstdimg, ";
				sql += "(select uname from user where uno = review.uno) as uname ";
				sql += "from review ";
				sql += "order by rdate desc ";
				sql += "limit 0,3 ";
				dbms.OpenQuery(sql);
				while(dbms.GetNext())
				{
					String rnote = dbms.GetValue("rnote");
					String cpno = dbms.GetValue("cpno");
					String cpkname = dbms.GetValue("cpkname");
					String cpstdimg = dbms.GetValue("cpstdimg");
					String uname = dbms.GetValue("uname");
					%>
					<tr class="index_cp_view">
						<td align="center" width="200px" height="100px"><a href="../champion/cpinfo.jsp?cpno=<%= cpno %>">
						<img src="../upload/<%= cpstdimg %>"></a>
						<br>
						<a href="../champion/cpinfo.jsp?cpno=<%= cpno %>"><%= cpkname %></a>
						</td>
						<td><div style="width:98%; height:98%;"><a href="../champion/cpinfo.jsp?cpno=<%= cpno %>"><%= rnote %></a></div></td>
						<td width="150px" align="center"><%= uname %></td>
					</tr>			
					<%	
				}
				%>
				</table>	
			</td>
		</tr>
	</table>
</div>	
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<%@ include file="../include/maintail.jsp" %>