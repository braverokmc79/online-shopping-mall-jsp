<!-- member view -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<link rel="stylesheet" type="text/css" href="css/index.css">
<!-- <title>-������-��ǰ ���</title> -->

<!-- <link rel="stylesheet" type="text/css" href="./css/mypage_orderlist.css"> -->
<jsp:include page="../top.jsp"/>

<jsp:include page="./admin_side.jsp"/>
<!--------------->
<!--  �۾� ����  -->
<!--------------->
<link rel="stylesheet" type="text/css" href="./css/member_view.css">
	<main>
	  <div id="manager">   
       <h3 class="inner_title">ȸ�� ����</h3>
		<table class="mgr_table verHead" id="search_table">
		<tr >
			<th>�̸�</th>
			<td><input id="member_name" readonly></td>
			<th>���̵�</th>
			<td><input id="member_id" value=<%=request.getParameter("id")%> readonly></td>
		</tr>
		<tr>
			<th>�������</th>
			<td><input id="member_birthday" readonly></td>
			<th>������</th>
			<td><input id="member_joindate" readonly></td>
		</tr>
		<tr>
			<th>����ó</th>
			<td><input id="member_contact" readonly></td>
			<th>�̸���</th>
			<td><input id="member_email" readonly></td>
		</tr>
		<tr>
			<th>��������Ʈ</th>
			<td><input id="member_point" readonly></td>
			<th>�����ȣ</th>
			<td><input id="member_zipcode" readonly></td>
		</tr>
		<tr>
			<th>�ּ�</th>
			<td colspan="3"><input id="member_address" readonly><input id="addr_btn" name="zip_btn" type="button" value="�ּ� ã��" /></td>
		</tr>
		</table>
		<div id="view_btn_wrapper">
			<input class="btn" id="update" type="button" value="����"> 
			<input class="btn" id="delete" type="button" value="ȸ�� ���� ����">
		</div>
	<h3 class="inner_title">���ų���</h3>
		<table class="mgr_table verHead" id="order_table">
			<tr id="judgeRow">
				<th>��ȣ</th>
				<th>�ֹ��Ͻ�</th>
				<th>�ֹ���ȣ</th>
				<th>��ǰ��</th>
				<th>�ֹ��ݾ�</th>
				<th>�ֹ�����</th>
				<th>��ǰ����</th>
			</tr>
		</table>
		  </div>
		</main>
		<script src="js/member_view.js"></script>
</body>
</html>