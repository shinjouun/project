
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/mainhead.jsp" %>

<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<style>

.review_div
{
	background-color:#fafafa; 
	overflow:scroll;
	overflow-x:hidden;
	width:100%; 
	height:350px;
	font-size:14px; 
	line-height:28px;
}
</style>
<div class="divnull">
	<br>
</div>
<div class="review_div">
	<table border="0" style="width:100%; height:250px;">
		<%
		DBManager dbms = new DBManager();
		dbms.DBOpen();
		String sql = "select cpno, cpkname, cpstdimg from champion ";
		sql += "order by cpkname";
		dbms.OpenQuery(sql);
		int rowno = 0;
		%>
		<tr class="toplist">
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
				<tr class="toplist">
				<%
			}	
			%>
			<td align="center" style="padding-top:20px; padding-bottom:10px;">
			<a href="cpinfo.jsp?cpno=<%= cpno %>"><img src="../upload/<%= cpstdimg %>"></a>
			<a href="cpinfo.jsp?cpno=<%= cpno %>"><br><%= cpkname %></a>
			</td>
			<% 
			rowno++;
		}
		%>	
		</tr>
	</table>
</div>
<table border="0" style="width:100%; height:20px; background-color:#fafafa;">
	<tr style="background-color:#f4f4f4;">
		<th>챔피언</th>
		<th>챔피언 평가</th>
		<th>작성자</th>
	</tr>			
	<%
	//[3]index.jsp?page=1 분석
	String curpage = request.getParameter("page");		
	int pageno = 1;
	try
	{
		pageno  = Integer.parseInt(curpage);
	}catch(Exception e){}
	System.out.println("페이지 번호:" + pageno);
	
	//[4]전체 게시물 갯수 계산
	sql = "select count(rno) as rno ";
	sql += "from review ";
	dbms.OpenQuery(sql);
	dbms.GetNext();
	int total = dbms.GetInt("rno");
	dbms.CloseQuery();
	System.out.println("전체 갯수:" + total);			
	
	//[1]페이지 시작 번호 계산
	int start = 0;					
	start = (pageno - 1) * 5;
	
	sql = "";
	sql += "select rnote, ";
	sql += "(select cpno from champion where cpno = review.cpno) as cpno, ";
	sql += "(select cpkname from champion where cpno = review.cpno) as cpkname, ";
	sql += "(select cpstdimg from champion where cpno = review.cpno) as cpstdimg, ";
	sql += "(select uname from user where uno = review.uno) as uname ";
	sql += "from review ";
	sql += "order by rdate desc ";
	//[2]페이지 시작 번호 입력
	sql += "limit " + start + ",5 ";
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
			<td><div style="width:98%; height:98%;"><a href="../champion/cpinfo.jsp?cpno=<%= cpno %>"><%= rnote %></div></a></td>
			<td align="center" width="150px"><%= uname %></td>
		</tr>			
		<%	
	}
	%>
	<tr>
		<td align="center" colspan="5">
		<%
		//[5] 전체 페이징 목록을 계산한다.
		int maxpage = total / 5;
		if( total % 5 != 0) maxpage++;
		
		//[6] start block 계산
		int startblock = (pageno / 10) * 10 + 1;
		if ( pageno % 10 == 0 ) 
		{
			startblock = startblock - 10;
		}
		
		//[7] end block 계산
		int endblock = startblock + 10 - 1;
		if ( endblock >= maxpage )
		{
			endblock = maxpage;
		}
		System.out.println("시작블럭 :" + startblock);
		System.out.println("끝 블럭 :" + endblock);
		
		//[9] 처음페이지로 보내기
		if( pageno != 1 )
		{
				%>
				<a style="color:darkred;" href="../champion/cpreview.jsp?&page=1">&lt;&lt;</a>
				&nbsp;&nbsp;&nbsp;
				<%
		}
		
		//[10] 이전페이지로 보내기
		if( startblock > 1 )
		{
				%>
				<a style="color:darkred;" href="../champion/cpreview.jsp?&page=<%= startblock - 1 %>">&lt;</a>
				&nbsp;&nbsp;&nbsp;
				<%
		}
		
		//[8] 전체페이지 출력
		for(int i = startblock ; i <= endblock ; i++)
		{
			if( pageno == i)
			{
				%>
				<a style="color:red;" href="../champion/cpreview.jsp?&page=<%= i %>"><%= i %></a>&nbsp;
				&nbsp;&nbsp;&nbsp;
				<%
			}else
			{
				%>
				<a href="../champion/cpreview.jsp?&page=<%= i %>"><%= i %></a>&nbsp;
				&nbsp;&nbsp;&nbsp;
				<%
			}
		}
		
		//[11] 다음페이지로 보내기
		if( endblock != maxpage )
		{
				%>
				<a style="color:darkred;" href="../champion/cpreview.jsp?&page=<%= endblock + 1 %>">&gt;</a>
				&nbsp;&nbsp;&nbsp;
				<%
		}
		
		//[12] 끝페이지로 보내기
		if( pageno != maxpage )
		{
				%>
				<a style="color:darkred;" href="../champion/cpreview.jsp?&page=<%= maxpage %>">&gt;&gt;</a>
				<%
		}
		%>
		</td>
	</tr>	
</table>							
<!-- 컨텐츠 출력 되는곳 -------------------------- -->
<%@ include file="../include/maintail.jsp" %>