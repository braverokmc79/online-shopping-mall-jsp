<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="java.util.Vector"%>
<%@page import="product.ProductBean"%>
<jsp:useBean id="amgr" class="admin.ProductMgr"/>
<jsp:useBean id="mgr" class="admin.ProductMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		Vector<ProductBean> list = mgr.printPname();
		String pnameList[] = mgr.readPname();
		out.println(list.size());
		
		//need to search variable 
		String p_name = "";
		int p_date1=0;
		int p_date2=0;
		
		//if do Searching
		if(request.getParameter("p_name")!=null){
			p_name = request.getParameter("p_name");
			p_date1 = Integer.parseInt(request.getParameter("p_date1"));
			p_date2 = Integer.parseInt(request.getParameter("p_date2"));
		}
		
		//After searching, request first screen again
		if(request.getParameter("reload")!=null&&
		request.getParameter("reload").equals("true")){
			p_name = ""; 
			p_date1=0; 
			p_date2=0; 
		}
%>

<html>
<head>

<style>
table {border: 1px solid; border-collapse:collapse; 
			width: 70%; text-align:center;}
td{border: 1px solid;}
thead{background:lightgray;}
</style>

<script type ="text/javascript">
function check() {
	f = document.SearchFrm;
	if(f.p_name.value.length==0){
		alert("��ǰ���� �����ϼ���");
		f.p_name.focus();
		return;
	}
	if(f.p_date1.value.length==0 || f.p_date1.value.length!=8){
		alert("�Ⱓ�� �ùٸ��� �Է����ּ��� ex) 20191217")
		f.p_date1.focus();
		return;
	}
	
	function list() {
		document.listFrm.action = "goods_master.jsp";
		document.listFrm.submit();
	}
	
	if(f.p_date2.value.length==0 || f.p_date2.value.length!=8){
		alert("�Ⱓ�� �ùٸ��� �Է����ּ��� ex) 20191217")
		f.p_date2.focus();
		return;
	}f.submit();
}

function listSelect() {
	f = document.SearchFrm;
	pl = f.pnameList;
	f.p_name.value = pl.options[pl.selectedIndex].value;
}
/* checkbox javascript */
 
 function allChk() {
	f= document.rFrm;
	if(f.allCh.checked){
		for(i=0;i<f.fch.length;i++){
				/*�׸��� üũ��ư(fch)���� �迭�̱⿡*/
			f.fch[i].checked = true;
		}
		f.btn.disabled = false;//��ư�� Ȱ��ȭ
	}else{
		for(i=0;i<f.fch.length;i++){
			f.fch[i].checked = false;
		}
		f.btn.disabled = true;	//��ư�� ��Ȱ��ȭ			
	}
}
 function chk(){
		f=document.rFrm;
		for(i=1; i<f.fch.length;i++){
			//alert(f.fch[i].value);
			if(f.fch[i].checked){ //fch üũ�ڽ��� üũ�� �� ���
				f.btn.disabled = false;
			return; //�ؿ� �ִ� üũ�ڽ��� üũ ������ ���ǹ�
			}
		}
		f.allCh.checked= false; //��üüũ�ڽ� ����
		f.btn.disabled = true; //��ư ��Ȱ��ȭ
	}
 
</script>
</head>

<body>
<h3>��ǰ����</h3>

<form name = "listFrm">
	<input type ="hidden"  name ="reload" value="true">
</form>


<form name ="SearchFrm" method="get" >
<input type = "hidden" name ="fch" value="0">	
<hr>
<h4>��ǰ���� �˻�</h4>
<table>
	<tr>
		<td >��ǰ��</td>
		<td>
		<select name ="pnameList" onchange = "listSelect()">
		<option value ="">��ǰ�� ����</option>
		<%for(int i=0; i<pnameList.length;i++){ %>
		<option value ="<%=pnameList[i]%>"><%=pnameList[i]%></option>
		<%} %>		
		</select>		
		<input name ="p_name" value="<%=p_name%>">
		</td>		
	</tr>
	<tr>
		<td>�˻��Ⱓ(�����)</td>
		<td>
			<input name ="p_date1" size="20"  value="<%=p_date1%>"> &nbsp; ~ &nbsp;
			<input name ="p_date2" size="20" value="<%=p_date2%>">			
			<input type="button" value="search" onclick="check()">
		</td>
	</tr>	
</table>
		
</form>

	<form name=rFrm action="goods_Proc.jsp?flag=update">
<table>
	<tr>
		<%
			//p_name = request.getParameter("p_name");
			//p_date1 = Integer.parseInt(request.getParameter("p_date1"));
			//p_date2 = Integer.parseInt(request.getParameter("p_date2"));
			Vector<ProductBean> slist = amgr.searchproduct(p_name, p_date1, p_date2);
			int listSize = slist.size();
			if(slist.isEmpty()){
				out.println(p_name);
				out.println(p_date1);
				out.println(p_date2);				
				out.println(slist.size());				
				out.println("�˻��������");
			}else{
				
		%>
		<tr>
			<td><input type ="checkbox" name= "allCh" onclick="allChk()"></td>					
			<td>��ǰ�ڵ�</td>
			<td>��ǰ��</td>
			<td>��ǰ����</td>
			<td>�����</td>
			<td>�Ǹſ���</td>
			<td>������</td>
		</tr>			
			<% 
			for(int i=0; i<slist.size(); i++){
				ProductBean pbean = slist.get(i);
				int p_code = pbean.getP_code();
		%>			
			<tr>
			<td>
			<input type ="checkbox" name="fch" value="<%=p_code%>" onclick="chk()"></td>			
			<td><%=pbean.getP_code() %></td>
			<td><%=pbean.getP_name() %></td>
			<td><%=pbean.getP_price() %></td>
			<td><%=pbean.getP_date() %></td>
			<td><%=pbean.getP_on_sale() %></td>
			<td><%=pbean.getSt_ava_qty() %></td>		
		</tr>
	<%}//--for %>
	<%}//--else %>
		</table>
		<input type ="submit" value="����">
		<input type ="button" value="����">
		<input type ="button" value="�߰�" onclick ="location.href='goods_insert.jsp'">
	</form>
</body>	
</html>
