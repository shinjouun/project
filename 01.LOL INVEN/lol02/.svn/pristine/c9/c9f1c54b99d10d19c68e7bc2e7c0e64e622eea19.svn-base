<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../include/mainhead.jsp" %>
<%
request.setCharacterEncoding("euc-kr");
//넘어온 input 타입 데이터를 문자열로 받는다.
String cpno = request.getParameter("cpno");


%>
<script>
function DoReviewModify(cpno, rno)
{
	window.open("../user/reviewmodify.jsp?cpno=" + cpno +"&rno=" + rno , "_reviewmodify",
	"width=700,height=400");
}
function DoCpModify()
{
	window.open("../admin/cpmodify.jsp?cpno=<%= cpno %>", "_cpmodify",
	"width=600,height=800");
}
function DoReviewDelete(rno,cpno)
{
	if(confirm("정말 삭제 하시겠습니까?") == true)
	{
		//alert(rno);
		document.location = "../user/reviewdelete.jsp?rno=" + rno + "&cpno=" + cpno;
	}
}
</script>
<table class="inner" border="0" style="width:100%;">
	<tr>
		<td>챔피언정보 입니다.</td>
		<%
		if( loginVO != null && loginVO.getUadmin().equals("A"))//관리자 코드가 무엇인지.
		{
			//관리자 개정일때
			%>
			<td align="right"><a href="javascript:DoCpModify();">챔피언정보 수정</a></td>
			<%
		}
		%>
	</tr>
</table>
<div class="cpinfomenu">
	<table border="0" style="width:100%;">
		<tr>
			<td align="center"><a href="../champion/cpinfo.jsp?cpno=<%= cpno %>">챔피언 정보</a></td>
			<td align="center"><a href="../champion/cpstory.jsp?cpno=<%= cpno %>">챔피언 스토리</a></td>
			<td align="center"><a href="../champion/cplist.jsp">챔피언 목록</a></td>
		</tr>
	</table>
</div>