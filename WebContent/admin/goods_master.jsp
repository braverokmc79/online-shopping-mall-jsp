<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="java.util.Vector"%>
<%@page import="product.ProductBean"%>
<jsp:useBean id="mgr" class="admin.ProductMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		Vector<ProductBean> list = mgr.printPname();
		String pnameList[] = mgr.readPname();
		out.println(list.size());
%>

<html>
<head>
<script type ="text/javascript">
function check() {
	f = document.frm;
	if(f.p_name.value.length==0){
		alert("��ǰ���� �����ϼ���");
		f.p_name.focus();
		return;
	}
	if(f.p_date1.value.length==0 || f.p_date1.value.length!==8){
		alert("�Ⱓ�� �ùٸ��� �Է����ּ��� ex) 20191217")
		f.p_date1.focus();
		return;
	}
	if(f.p_date2.value.length==0 || f.p_date2.value.length!==8){
		alert("�Ⱓ�� �ùٸ��� �Է����ּ��� ex) 20191217")
		f.p_date2.focus();
		return;
	}f.submit();
}
function listSelect() {
	f = document.frm;
	pl = f.pnameList;
	f.p_name.value = pl.options[pl.selectedIndex].value;
}
</script>
</head>

<body>
<h3>��ǰ����</h3>
<form name ="frm" method="get" action="goods_masterProc.jsp">
<hr>
<h4>��ǰ���� �˻�</h4>
<table border="1">
	<tr>
		<td width="50">��ǰ��</td>
		<td>
		<select name ="pnameList" onchange = "listSelect()">
		<option value ="">��ǰ�� ����</option>
		<%for(int i=0; i<pnameList.length;i++){ %>
		<option value ="<%=pnameList[i]%>"><%=pnameList[i]%></option>
		<%} %>		
		</select>		
		<input name ="p_name" size="60">
		</td>		
	</tr>
	<tr>
		<td>�˻��Ⱓ(�����)</td>
		<td>
			<input name ="p_date1" size="20"> &nbsp; ~ &nbsp;
			<input name ="p_date2" size="20">			
			<input type="button" value="search" onclick="check()">
		</td>
	</tr>
	
	
	
</table>

</form>

<form name=frm2 >


</form>


</body>	
</html>


<html>
<head>

</head>
</html>