<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="lol.vo.*" %>
<%@ page import="lol.dbms.*"  %>
<%
UserVO loginVO = (UserVO)session.getAttribute("logon");
 
String key = request.getParameter("key");
if(key == null) key = "";
String pos = request.getParameter("pos");
if(pos == null) pos = "";
System.out.println("pos:" + pos);
%>
<table class="list_image" border="0" style="width:100%;">
	<%
	DBManager dbms = new DBManager();
	dbms.DBOpen();
	String sql = "select cpno, cpkname, cpnickname, cpename, cpstdimg, cpinfo from champion ";
	
	sql +="where 1=1 ";
	if(!key.equals(""))
	{
		sql +="and cpkname like '%" + key + "%' ";
	}
	
	String[] posList = pos.split(",");
	if(!pos.equals("") && posList != null)
	{
		for(int i=0; i < posList.length; i++)
		{
			sql +="and cpno in (select cpno from position where pname = '" + posList[i] + "' ) ";
		}
	}
	sql += "order by cpkname ";
	dbms.OpenQuery(sql);
	int rowno = 0;
	%>
	<tr>
	<%
	while(dbms.GetNext())
	{
		String cpno = dbms.GetValue("cpno"); 
		String cpkname = dbms.GetValue("cpkname");
		String cpnickname = dbms.GetValue("cpnickname");
		String cpename = dbms.GetValue("cpename");
		String cpstdimg = dbms.GetValue("cpstdimg");
		String cpinfo = dbms.GetValue("cpinfo");
		if(rowno % 5 == 0)
		{
			%>
			</tr>
			<tr>
			<%
		}
		%>			
		<td align="center" style="padding-top:20px; padding-bottom:10px;">
		<%
		if(loginVO != null && loginVO.getUadmin().equals("A"))
		{
			%>
			<input type="checkbox" id="check_cpno" name="check_cpno" value="<%=cpno%>">
			<br>
			<% 
		}
		%>
		<a href="../champion/cpinfo.jsp?cpno=<%=cpno%>" id="cpimg" onmouseenter="DoDetail('<%= cpno %>','<%= cpstdimg %>', '<%= cpkname %>', '<%=cpename %>', '<%= dbms.ts_form(cpinfo) %>');" >
		<img src="../upload/<%= cpstdimg %>">
		</a>
		<br>
		<a href="cpinfo.jsp?cpno=<%= cpno %>"><%= cpkname %></a>
		</td>
		<%
		rowno++;
	}
	if(rowno == 0)
	{
		%>
		<td height="120px" style="text-align:center;">조회된 챔피언이 없습니다.</td>
		<%	
	}	
	dbms.CloseQuery();
	%>
	</tr>
</table>
<%
dbms.DBClose();
%>