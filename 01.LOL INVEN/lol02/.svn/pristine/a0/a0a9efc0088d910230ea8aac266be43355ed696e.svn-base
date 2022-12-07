<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="lol.vo.*"  %>
<%@ page import="lol.dbms.*" %>    
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>    
<%@ include file="../common/path.jsp" %>    
<%
request.setCharacterEncoding("euc-kr");

UserVO loginVO = (UserVO)session.getAttribute("logon");
if(loginVO == null || !loginVO.getUadmin().equals("A"))
{
	response.sendRedirect("../main/index.jsp");
	return;
}


//업로드 경로 설정, 업로드가 가능한 최대 파일크기 지정 -> 인크루드로 했음.

//enctype="multipart/form-data" 로 데이터를 받는다.
//new MultipartRequest(request,경로,크기,"언어",중복이름불가하게 만드는것 --> new DefaultFileRenamePolicy());
MultipartRequest multi = new MultipartRequest(request,uploadPath,size,"EUC-KR",new DefaultFileRenamePolicy());

String cpno = multi.getParameter("cpno");
String cpstdimg = multi.getFilesystemName("cpstdimg");
String cpbkimg = multi.getFilesystemName("cpbkimg");
String cpinfo = multi.getParameter("cpinfo");
String cpstory = multi.getParameter("cpstory");
String position[] = multi.getParameterValues("position");

DBManager dbms = new DBManager();

dbms.DBOpen();
//챔피언 정보를 수정한다.
String sql = "";

sql += "update champion set ";
sql += "cpinfo='"+ dbms.r_note(cpinfo) +"', ";
if(cpstdimg != null && !cpstdimg.equals(""))
{
	sql += "cpstdimg = '"+ cpstdimg +"', ";
}
if(cpbkimg != null && !cpbkimg.equals(""))
{
	sql += "cpbkimg = '"+ cpbkimg +"', ";
}
sql += "cpstory = '"+ dbms.r_note(cpstory) +"', ";
sql += "cpmdate = now() ";
sql += "where cpno = " + cpno;

dbms.RunSQL(sql);

sql = "delete from position where cpno =" + cpno;
dbms.RunSQL(sql);


if(position != null)
{	
	for(String data : position) //(타입명 변수명 : 쪼갤 변수명)
	{
		String ary[] = data.split(":"); //data를 ":" 기준으로 split(쪼갠후) 한 후에 ary라는 변수의 [] 배열로 변환한다.
		sql = "insert into position (cpno,pcode,pname) values ('" + cpno + "','" + ary[0] + "','" + ary[1] + "') ";
		dbms.RunSQL(sql);
	}
}

dbms.DBClose();

%>
<script>
	alert("챔피언이 수정되었습니다.");
	opener.parent.location.reload();
	window.close();
</script>