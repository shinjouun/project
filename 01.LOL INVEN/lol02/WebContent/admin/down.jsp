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
String cpno = request.getParameter("cpno");
String kind = request.getParameter("kind");

String img  = "";

DBManager dbms = new DBManager();
dbms.DBOpen();
String sql = "select cpstdimg, cpbkimg from champion where cpno =" + cpno;
dbms.OpenQuery(sql);
dbms.GetNext();
if(kind.equals("cpstdimg"))
{
	//기본 이미지
	img = dbms.GetValue("cpstdimg");
}else
{
	//배경이미지
	img = dbms.GetValue("cpbkimg");
}
dbms.DBClose();

//받아온 첨부파일 이미지의 경로를 설정해준다.
String pimg = uploadPath + "\\" + img; 

byte[] outputByte = new byte[4096];

//브라우저에 파일명을 보낸다.
response.setContentType("application/octet-stream");   
response.setHeader("Content-Disposition","attachment; filename=" + img);

File file = new File(pimg);
FileInputStream fileIn = new FileInputStream(file);
ServletOutputStream ostream = response.getOutputStream();


//copy binary contect to output stream
while(fileIn.read(outputByte, 0, 4096) != -1)
{
	ostream.write(outputByte, 0, 4096);
}
fileIn.close();
ostream.flush();
ostream.close();
%>