<%@ page contentType="text/html; charset=EUC-KR" %>
<html>
<head>
<title>
</title>
</head>
<body >
<div>
<h2>�������� �ۼ��ϱ�</h2>
<hr>
<br/>
<table width="600" cellpadding="3">
</table>
<br/>
<form name="postFrm" method="post" action="noticePost" 
enctype="multipart/form-data">
<table width="600" cellpadding="3">
	<tr>
		<td >
		<table>
			<tr>
				<td width="20%">�� ��</td>
				<td width="80%">
				<input name="name" size="10" maxlength="8"></td>
			</tr>
			<tr>
				<td>�� ��</td>
				<td>
				<input name="subject" size="50" maxlength="30"></td>
			</tr>
			<tr>
				<td>�� ��</td>
				<td><textarea name="content" rows="10" cols="50"></textarea></td>
			 <tr>
     			<td>����ã��</td> 
     			<td><input type="file" name="filename" size="50" maxlength="50"></td>
				<td colspan="2"></td>
			</tr>
			<tr align="right">
				<td colspan="2">
					 <input type="submit" value="���">
					 <input type="button" value="����Ʈ" onClick="javascript:location.href='list.jsp'">
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
</form>
</div>
</body>
</html>