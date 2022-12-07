<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="lol.vo.*"  %>
<%@ page import="lol.dbms.*" %>
<%@ page import="java.io.*"%>
<%@ include file="../common/path.jsp" %> 
<%
UserVO loginVO = (UserVO)session.getAttribute("logon");

String cpno[] = request.getParameter("cpno").split(","); // 20,19,18

if(loginVO == null || !loginVO.getUadmin().equals("A"))
{
	response.sendRedirect("../main/index.jsp");
	return;
}

DBManager dbms = new DBManager();
dbms.DBOpen();
String sql = "";

for(int i = 0 ; i < cpno.length ; i++)
{
	sql = "select cpstdimg, cpbkimg from champion where cpno = " + cpno[i];
	dbms.OpenQuery(sql);
	dbms.GetNext();
	String stdimg = dbms.GetValue("cpstdimg");
	String bkimg = dbms.GetValue("cpbkimg");
	dbms.CloseQuery();
	
	stdimg = uploadPath + "\\" + stdimg; //�⺻�̹��� ���
	bkimg = uploadPath + "\\" + bkimg; //����̹��� ���
	
	File stdf = new File(stdimg);
	if(stdf.exists()) stdf.delete(); //�⺻ �̹����� �������ش�.
	
	File bkf = new File(bkimg);
	if(bkf.exists()) bkf.delete(); //��� �̹����� �������ش�.
	
	sql = "delete from review where cpno = " + cpno[i];
	dbms.RunSQL(sql);
	
	sql = "delete from position where cpno = " + cpno[i];
	dbms.RunSQL(sql);
	
	sql = "delete from champion where cpno = " + cpno[i];
	dbms.RunSQL(sql);
}
dbms.DBClose();

out.print("SUCCESS");
%>
