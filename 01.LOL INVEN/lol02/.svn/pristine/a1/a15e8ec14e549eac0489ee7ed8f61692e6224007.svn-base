<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<script>
	window.onload = function()
	{
		var login = null;
		<%
		if(loginVO != null)
		{
			%>
			login = "<%= loginVO.getUid() %>"
			<%
		}
		%>
		
		
		$("#cpreview").click(function(){
			if(login == null)
			{
				alert("로그인 후 사용해주세요.");
				document.location = "../user/login.jsp";
			}
			
		});
		
		$("#writesubmit").click(function(){
			if($("#cpreivew").val() == "")
			{
				alert("내용을 입력하세요!!");
				$("#cpreivew").focus();
				return;
			}
			$("#rewrite").submit();
		});
	}
</script>
<table class="inner" border="0" style="width:100%;">
	<tr>
		<td width="50px" align="center">챔피언</td>
		<td width="449px" align="center">챔피언 평가</td>
		<td width="50px" align="center">평점</td>
		<td width="118px" align="center">작성자</td>
	</tr>
</table>
<table border="0" style="width:100%; margin:5px;">					
	<%
	//[3] cppage 번호 request 로 얻어온 후 pageno 초기화 (페이지값 없어도 자동으로 1 되게끔)
	String cppage = request.getParameter("cppage");
	int pageno = 1;

	//cppage 가 null 일때 처리해주는 구문
	try
	{
		pageno = Integer.parseInt(cppage);
	}catch(Exception e)
	{}
		
	//[1] 시작번호 계산 << 1 2 3 4 5 6 7 8 9 10 >>
	int start = 0;					
	start = (pageno - 1) * 10;
	
	sql = "";
	sql += "select rno, uno, rnote, rscore, date(rdate) as rdate, ";
	sql += "(select uname from user where uno = review.uno) as uname, ";
	sql += "(select cpstdimg from champion where cpno = review.cpno) as cpimg ";		
	sql +="from review ";
	sql += "where cpno = " + cpno;
	sql += " order by rno desc ";
	//[2]페이지 시작 번호 입력
	sql += "limit " + start + ",10 ";
	
	dbms.OpenQuery(sql);
	while(dbms.GetNext() == true)
	{
		String uno = dbms.GetValue("uno");
		String rno = dbms.GetValue("rno");
		String rnote = dbms.GetValue("rnote");
		int score = dbms.GetInt("rscore"); 
		String rdate = dbms.GetValue("rdate");
		String uname = dbms.GetValue("uname");
		String cpimg = dbms.GetValue("cpimg");
		%>
		<tr>
			<td width="45px" align="center" style="padding-top:20px; padding-bottom:10px;"><img src="../upload/<%= cpimg %>" width="100%"></td>
			<td width="630px" align="left" style="padding-left:20px;"><%= rnote %></td>
			<td>평점:<%= score %></td>
			<td width="200px" align="center" colspan="2"><%= uname %><br>&nbsp;&nbsp;&nbsp;<%= rdate %> &nbsp;&nbsp;&nbsp;<br>
			<%
			if(loginVO != null && loginVO.getUno().equals(uno))
			{
				%>
				[<a href="javascript:DoReviewModify('<%= cpno %>','<%= rno %>');">수정</a>] | [<a href="javascript:DoReviewDelete('<%= rno %>','<%= cpno %>');">삭제</a>]
				<% 
			}
			%>
			</td>
		</tr>
		<% 
	}
	dbms.CloseQuery();
		
	//[4]전체 평가 갯수 구하기
	sql = "select count(rno) as rno from review where cpno = " + cpno;
	dbms.OpenQuery(sql);
	dbms.GetNext();
	
	//int total = Integer.parseInt(dbms.Getvalue("rno"));
	int total = dbms.GetInt("rno");

	dbms.CloseQuery();
	
	//[5] maxpage 구하기  << 1 2 3 4 5 6 7 8 9 10 ~~~ >>
	int maxpage = total / 10;
	if( total % 10 != 0 ) maxpage++;
	if( maxpage <= 0 )
	{
		maxpage = 1;
	}
	
	
	//[6] startblock 시작페이지 구하기
	int startblock = ( pageno / 10 ) * 10 + 1;
	if( pageno % 10 == 0 )
	{
		startblock = startblock - 10;
	}
	
	
	//[7] endblock 끝 페이지구하기
	int endblock = startblock + 10 - 1;
	if( endblock >= maxpage )
	{
		endblock = maxpage;
	}	
	
	System.out.println("전체 평가수:" + total);
	System.out.println("maxpage :" + maxpage);
	System.out.println("시작페이지 :" + startblock);
	System.out.println("끝페이지 :" + endblock);
	%>
	<tr>
		<%
		if( loginVO != null)
		{
			%>
				<td width="80px" style="text-align:center;"><%= loginVO.getUid() %></td>
			<%
		}
		else
		{
			%>
				<td width="80px" style="text-align:center;">Guest</td>
			<%
		}
		%>
		<td style="padding-top:20px;">
		<form method="post" id="rewrite" action="../user/reviewok.jsp">
		<input type="hidden" id="cpno" name="cpno" value="<%= cpno %>">
		<textarea rows="3" id="cpreview" name="cpreview" style="width:95%; resize: none;"></textarea>&nbsp;&nbsp;&nbsp;
		</td>
		<td width="80px">평점:
			<select id="cpscore" name="cpscore" style="width:50px">
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5" selected>5</option>
			</select>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</td>
		<td align="center">
		<a style="color:#ffffff; background-color: #060A41; border-radius:3px 3px 3px 3px; padding: 5px 5px;" href="#" id="writesubmit">등록</a>
		</form>
		</td>
	</tr>											
	<tr>
		<!-- champion/cpinfo.jsp?cppage=1&cpno=26 처리-->
		<td align="center" colspan="4">
		<%
		//[9] 처음페이지로 보내기
		if( pageno != 1 )
		{
				%>
				<a style="color:darkred;" href="../champion/cpinfo.jsp?cppage=1&cpno=<%= cpno %>">&lt;&lt;</a>
				&nbsp;&nbsp;&nbsp;
				<%
		}
		
		//[10] 이전페이지로 보내기
		if( startblock > 1 )
		{
				%>
				<a style="color:darkred;" href="../champion/cpinfo.jsp?cppage=<%= startblock - 1 %>&cpno=<%= cpno %>">&lt;</a>
				&nbsp;&nbsp;&nbsp;
				<%
		}
		
		//[8] 현재 페이지
		for(int i = startblock ; i <= endblock ; i++ )
		{
			//현재 페이지가 내가 선택한 페이지와 같으면 색깔을 변경한다.
			if( pageno == i )
			{
				%>
				<a style="color:red;" href="../champion/cpinfo.jsp?cppage=<%= i %>&cpno=<%= cpno %>"><%= i %></a>
				&nbsp;&nbsp;&nbsp;
				<%
			}else
			{
				%>
				<a href="../champion/cpinfo.jsp?cppage=<%= i %>&cpno=<%= cpno %>"><%= i %></a>
				&nbsp;&nbsp;&nbsp;
				<%
			}
		}
		
		//[11] 다음페이지로 보내기
		if( endblock != maxpage )
		{
				%>
				<a style="color:darkred;" href="../champion/cpinfo.jsp?cppage=<%= endblock + 1 %>&cpno=<%= cpno %>">&gt;</a>
				&nbsp;&nbsp;&nbsp;
				<%
		}
		
		//[12] 끝페이지로 보내기
		if( pageno != maxpage )
		{
				%>
				<a style="color:darkred;" href="../champion/cpinfo.jsp?cppage=<%= maxpage %>&cpno=<%= cpno %>">&gt;&gt;</a>
				<%
		}
		%>
		</td>
	</tr>								
</table>
<%
dbms.DBClose();
%>
<%@ include file="../include/maintail.jsp" %>