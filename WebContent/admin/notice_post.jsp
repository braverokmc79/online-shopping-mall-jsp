<%@ page contentType="text/html; charset=EUC-KR" %>

<%
		request.setCharacterEncoding("EUC-KR");
		String n_id = request.getParameter("n_id");
%>
<html>
<head>
		<style>
		table {border: 1px solid; border-collapse:collapse; 
					width: 70%; text-align:center;}
		td{border: 1px solid;}
		thead{background:lightgray;}
		</style>
</head>
<body>

<h2>�������� �ۼ��ϱ�</h2>
<hr>

<form name="postFrm" method="post" action="notice_Proc.jsp?flag=insert" enctype="multipart/form-data">		
<input type="hidden" name ="n_id" value="<%=n_id%>">		
		<table>
			<tr>
				<td>�ۼ���</td>
				<td><%=n_id%></td>
			</tr>
			
			<tr>
				<td>�� ��</td>
				<td>
				<input name="n_title"></td>
			</tr>
			<tr>
			<td>ī�װ�</td>
			<td>
			<select name="n_category">
			<option>����</option>
			<option value="�ֹ�/����">�ֹ�/����</option>
			<option value="ȸ������">ȸ��</option>
			<option value="���/��ȯ/��ǰ">���/��ȯ/��ǰ</option>
			<option value="��۹���">���</option>
			<option value="��Ÿ">��Ÿ</option>
			</select>
			</td>
			</tr>
			
			<tr>
				<td>�� ��</td>
				<td><input name="n_content"></td>
			 <tr>
			 
     			<td>÷������</td> 
     			<td><input type="file" name="noticeFile" size="50"></td>
				<td></td>
			</tr>				
		</table>	
				<input type="submit" value="���">
				<input type="button" value="�ۼ����" onClick="javascript:location.href='notice_list.jsp'">	
<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
</form>

</body>
</html>