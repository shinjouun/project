<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="lol.dbms.*" %>    
<%
//�ش� è�Ǿ� ��ȣ�� �������� ������� ��.
String cpno = request.getParameter("cpno");

DBManager dbms = new DBManager();
dbms.DBOpen();
String sql = "select pname from position where cpno = " + cpno;
dbms.OpenQuery(sql);
String position = "";
while(dbms.GetNext())
{
	String pname = dbms.GetValue("pname");
	
	if(position != "") position += ",";
	position += pname;
}
dbms.CloseQuery();

sql = "select cpkname, cpnickname, cpstdimg, cpename, cpinfo from champion where cpno = " + cpno;
dbms.OpenQuery(sql);
dbms.GetNext();
String img = dbms.GetValue("cpstdimg");
String cpnickname = dbms.GetValue("cpnickname");
String cpname = dbms.GetValue("cpkname");
String cpename = dbms.GetValue("cpename");
String cpinfo = dbms.GetValue("cpinfo");
dbms.CloseQuery();
dbms.DBClose();
//���ڿ��� ���� �Ѱ��ش�. ex : ������  or  ����,������....
%>
<table border="0" style="background-color:black;">
 	<tr>
 		<td rowspan="3" style="width:30px;"><img id="td_img" src="../upload/<%= img %>"></td>
 		<td id="td_name" style="color:#F6700E;"><%= cpname %>, <%= cpnickname %></td>
 	</tr>
 	<tr>
 		<td id="td_ename" style="color:#8eb3b8;"><%= cpename %></td>
 	</tr>
 	<tr>
 		<td id="td_position" style="color:lightgray;"><%= position %></td>
 	</tr>
 	<tr>
 		<td colspan="2" id="td_info" style="color:#a0acbd;"><%= dbms.ts_info(cpinfo) %></td>
 	</tr>
</table>