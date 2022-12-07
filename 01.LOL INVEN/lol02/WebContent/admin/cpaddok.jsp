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
UserVO loginVO = (UserVO)session.getAttribute("logon");
if(loginVO == null || !loginVO.getUadmin().equals("A"))
{
	response.sendRedirect("../main/index.jsp");
	return;
}

request.setCharacterEncoding("euc-kr");

//업로드 경로 설정, 업로드가 가능한 최대 파일크기 지정 -> 인크루드로 했음.

//enctype="multipart/form-data" 로 데이터를 받는다.
//new MultipartRequest(request,경로,크기,"언어",중복이름불가하게 만드는것 --> new DefaultFileRenamePolicy());
MultipartRequest multi = new MultipartRequest(request,uploadPath,size,"EUC-KR",new DefaultFileRenamePolicy());

String cpname = multi.getParameter("cpname");
String cpnickname = multi.getParameter("cpnickname");
String cpename = multi.getParameter("cpename");
String cpstdimg = multi.getFilesystemName("cpstdimg");
String cpbkimg = multi.getFilesystemName("cpbkimg");
String cpinfo = multi.getParameter("cpinfo");
String cpstory = multi.getParameter("cpstory");
String position[] = multi.getParameterValues("position");

DBManager dbms = new DBManager();

dbms.DBOpen();

String sql = "insert into champion (cpkname,cpnickname,cpename,cpstdimg,cpbkimg,cpinfo,cpstory) ";
sql += "values ('" + dbms.r_id(cpname) + "','" + dbms.r_id(cpnickname) + "', ";
sql += "'" + dbms.r_id(cpename) + "','" + cpstdimg + "','" + cpbkimg + "', ";
sql += "'" + dbms.r_note(cpinfo) + "','" + dbms.r_note(cpstory) + "') ";

dbms.RunSQL(sql);

//등록된 아이디의 번호를 얻는다.
sql = "select last_insert_id() as cpno "; // 마지막에 나온 cpno 는 변수이름

dbms.OpenQuery(sql);
dbms.GetNext();
String cpno = dbms.GetValue("cpno"); //cpno : 위에서 선언한 변수이름

dbms.CloseQuery();

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
	alert("챔피언이 추가되었습니다.");
	opener.parent.location.reload();
	window.close();
</script>