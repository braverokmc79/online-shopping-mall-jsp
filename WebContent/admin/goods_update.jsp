<!-- goods_update.jsp  -->
<%@page import="product.ProductBean"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="pMgr" class="product.ProductMgr"/>
<%request.setCharacterEncoding("EUC-KR");%>

<html>
<head>
<title>-������-��ǰ ����</title>
<script src="script.js"></script>
</head>
<body topmargin="100">
<%
	int no = Integer.parseInt(request.getParameter("p_code"));
	ProductBean product = pMgr.getProduct(no);
%>
	<form method="post" action="goods_insertProc.jsp?flag=update"
		enctype="multipart/form-data">
		<h3>�⺻����</h3>
		<table width="75%">
			<tr>
				<td>
					<table width="95%" border="1">

						<tr>
							<td align="center">��ǰ�ڵ�</td>
							<td align="left"><input name="p_code" size="20">
							<%=product.getP_code() %>
							</td>
						</tr>
						<tr>
							<td align="center">��ǰ��</td>
							<td align="left"><input name="p_name" size="20">
							<%=product.getP_name() %>
							</td>
						</tr>
						<tr>
							<td align="center">��ǰ����</td>
							<td align="left"><input name="p_price" size="20">
							<%=product.getP_price() %>>��							
							</td>
						</tr>
						<tr>
							<td align="center">�Ǹſ���</td>
							<td align="left"><input type="checkbox" name="p_on_sale" value="0" checked>�Ǹ�
							<input type="checkbox" name="p_on_sale" value="1">�����</td>
						</tr>						
						
						<tr>
							<td align="center">�����(1)</td>
							<td align="left"><input name="rm_code1" size="20">
							<input name="rm_percentage1" size="20">
							</td>
							
						</tr>
						<tr>
							<td align="center">�����(2)</td>
							<td align="left"><input name="rm_code2" size="20">
							<input name="rm_percentage2" size="20">
							</td>
						</tr>
						<tr>
							<td align="center">�����(3)</td>
							<td align="left"><input name="rm_code3" size="20">
							<input name="rm_percentage3" size="20">
							</td>
						</tr>
						<tr>
							<td align="center">�����(4)</td>
							<td align="left"><input name="rm_code4" size="20">
							<input name="rm_percentage4" size="20">
							</td>
						</tr>
					</table>

					<h3 align="left">������</h3>
					<table width="75%" align="left" width="95%" border="1">
						<tr>
							<td align="center">�����̹���</td>
							<td><input type="file" name="upFile1">
							<%=product.getP_main_pht_name()%></td>
						</tr>
						<tr>
							<td align="center">�����̹���</td>
							<td><input type="file" name="upFile2">
							<%=product.getP_detail_pht_name() %></td>
						</tr>
						<tr>
							<td align="center">���̹���</td>
							<td><input type="file" name="upFile3">
							<%=product.getP_info_pht_name() %></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<input type="submit" value="��ǰ����">&nbsp;&nbsp;&nbsp; 
		<input type="reset" value="�ٽþ���">
	</form>
</body>
</html>