<!-- ������ order view ������ -->
<%@page contentType="text/html; charset=EUC-KR"%>
<%@page import="product.UtilMgr"%>
<%@page import="order.OrderBean"%>
<%@page import="member.MemberBean"%>
<%@page import="product.ProductBean"%>
<%@page import="order.CartMgr"%>
<%@page import="order.CartBean"%>
<%@page import="java.util.Vector"%>
<jsp:useBean id="mMgr" class="member.MemberMgr"/>
<jsp:useBean id="pMgr" class="product.ProductMgr"/>
<jsp:useBean id="oMgr" class="order.OrderMgr"/>
<jsp:useBean id="cMgr" class="order.CartMgr"/>

<%
		request.setCharacterEncoding("EUC-KR");
		String id = request.getParameter("id");
%>

<html>
<head>
</head>
<body>
<div align="center"><br/>
<h2>�ֹ� �� ����</h2>
<hr width="60%">
<table>
	<tr>
		<th>�ֹ���ȣ<th>
		<td><td>
		<th>�ֹ��� ID<th>
		<td><td>
	</tr>
	<tr>
		<th>�ֹ���ȣ<th>
		<td><td>
		<th>�ֹ��� ID<th>
		<td><td>
	</tr><tr>
		<th>�ֹ��ڸ�<th>
		<td><td>
		<th>��ȭ��ȣ(�ֹ���)<th>
		<td><td>
	</tr><tr>
		<th>�����ڸ�<th>
		<td><td>
		<th>��ȭ��ȣ(������)<th>
		<td><td>
	</tr>
	<tr>
		<th>�ּ�<th>
		<td><td>
		<th>���ּ�<th>
		<td><td>
	</tr>
	<tr>
		<th>��� �޼���<th>
		<td><td>
		<th>�ֹ��Ͻ�<th>
		<td><td>
	</tr>
	<tr>
		<th>��ǰ�ݾ�<th>
		<td><td>
		<th>��ۺ�<th>
		<td><td>
	</tr>
	<tr>
		<th>����ݾ�<th>
		<td><td>
		<th>������<th>
		<td><td>
	</tr>
</table>
</div>
</body>