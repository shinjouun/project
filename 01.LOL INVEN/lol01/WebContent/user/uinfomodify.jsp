<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>ȸ������ ����</title>
		<link rel="stylesheet" href="../css/popupstyle.css"/>
	</head>
	<body>
		<form method="post" action="uinfomodifyok.jsp">
			<table class="uinfo_a"  border="1">
				<tr>
					<th align="center" colspan="3">ȸ�� ���� ����</th>
				</tr>
				<tr>
					<td align="left">�̸�:
						OOO(������)</td>
				</tr>
				<tr>
					<td align="left">���̵�:
					OOO(������)</td>
				</tr>
				<tr>
					<td align="center"><a href="upwmodify.jsp">��й�ȣ ����</a></td>
				</tr>
				<tr>
					<td align="left">�г���:
					<input type="text" value="���� �г���">��������</td>
				</tr>
				<tr>
					<td align="left">�̸���:
					<input type="text" value="���� �̸���">@<input type="text" value="���� �̸���">��������</td>
				</tr>
				<tr>
					<td align="left">�޴���:
					<input type="text" size="3" value="���� ��ȣ">-<input type="text" size="5" value="���� ��ȣ">-<input type="text" size="5" value="���� ��ȣ">��������</td>
				</tr>
				<tr>
					<td align="left">���ŵ���:
					<input type="checkbox" id="receive" name="receive">���ϼ��ŵ���
					<input type="checkbox" id="receive" name="receive">SMS����
					</td>
				</tr>
				<tr>
					<td align="center" colspan="3"><a href="uinfomodifyok.jsp">����</a></td>
				</tr>
			</table>
		</form>
	</body>
</html>