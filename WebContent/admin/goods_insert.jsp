<!-- goods_insert.jsp -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<html>
<head>
<title>-������-��ǰ ���</title>

<script src="script.js"></script>
</head>
<body topmargin="100">
	<form method="post" action="productProc.jsp?flag=insert"
		enctype="multipart/form-data">
		<!-- enctype="multipart/form-data" �϶����� post������� ������. 
	��ſ� action�� ���ؼ� action="productProc.jsp?flag=insert" �� ������Ѵ�.-->

		<h3>�⺻����</h3>
		<table width="75%">
			<tr>
				<td>
					<table width="95%" border="1">

						<tr>
							<td align="center">��ǰ�ڵ�</td>
							<td align="left"><input name="p_code" size="20"></td>
						</tr>
						<tr>
							<td align="center">��ǰ��</td>
							<td align="left"><input name="p_name" size="20"></td>
						</tr>
						<tr>
							<td align="center">��ǰ����</td>
							<td align="left"><input name="p_price" size="20">��</td>
						</tr>
						<tr>
							<td align="center">�Ǹſ���</td>
							<td align="left"><input type="checkbox" name="sale_on">�Ǹ�
								<input type="checkbox" name="sale_off">�����</td>
						</tr>
						<tr>
							<td align="center">�����</td>
							<td align="left"><input name="p_date" size="20"></td>
						</tr>
						<tr>
							<td align="center">�������</td>
							<td align="left"><input name="st_exp_date" size="20"></td>
						</tr>
						<tr>
							<td align="center">�����(1)</td>
							<td align="left"><input name="rm_code1" size="20"></td>
						</tr>
						<tr>
							<td align="center">�����(2)</td>
							<td align="left"><input name="rm_code2" size="20"></td>
						</tr>
						<tr>
							<td align="center">�����(3)</td>
							<td align="left"><input name="rm_code3" size="20"></td>
						</tr>
						<tr>
							<td align="center">�����(4)</td>
							<td align="left"><input name="rm_code4" size="20"></td>
						</tr>
					</table>

					<h3 align="left">������</h3>
					<table width="75%" align="left" width="95%" border="1">
						<tr>
							<td align="center">�����̹���</td>
							<td><input type="file" name="main_image"></td>
						</tr>
						<tr>
							<td align="center">�����̹���</td>
							<td><input type="file" name="sale_image"></td>
						</tr>
						<tr>
							<td align="center">���̹���</td>
							<td><input type="file" name="info_image"></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<input type="submit" value="��ǰ���">&nbsp;&nbsp;&nbsp; <input
			type="reset" value="�ٽþ���">
	</form>
</body>
</html>