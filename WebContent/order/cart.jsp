<!-- goods_view.jsp���� p_code, ���� �Ѱܿ��� -->
<%@page import="order.CartBean"%>
<%@page import="product.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <jsp:useBean id="pMgr" class="product.ProductMgr"/>
 <jsp:useBean id="cMgr" class="order.CartMgr"/>
 <%
 		request.setCharacterEncoding("EUC-KR");
 		String id = (String)session.getAttribute("idKey");
 		//String id = "u1";//Ȯ�ο� ������
 		int p_code = 1;//Ȯ�ο� ������
 		int o_del_fee = 2500;
 			
 %>
<!DOCTYPE html>
<html>
<head>
<style>
input {
  width:30px;
  height:30px;
  font-size:15px;
  text-align: center;
}
</style>
<script>
	
	
	function allChk(){//��ü üũ�� Ȱ��ȭ
		f=document.frm;
		if(f.allCh.checked){
			for (var i = 0; i < f.fch.length; i++) {
				f.fch[i].checked = true;
			}
			f.btn1.disabled = false;//��ư�� Ȱ��ȭ
			f.btn2.disabled = false;//��ư�� Ȱ��ȭ
		}else{
			for (var i = 0; i < f.fch.length; i++) {
				f.fch[i].checked = false;
			}
			f.btn1.disabled = true;//��ư�� ��Ȱ��ȭ
			f.btn2.disabled = true;//��ư�� ��Ȱ��ȭ
		}
	}
	
	function chk(frm){
		f=document.frm; 
		let sum =0;
		for (let i = 1; i < f.fch.length; i++) {
			//alert(f.fch[i].value);
			if(f.fch[i].checked){
				f.btn1.disabled = false;//��ư�� Ȱ��ȭ 
				f.btn2.disabled = false;//��ư�� Ȱ��ȭ
				return;//�ؿ� �ִ� üũ�ڽ��� üũ������ ���ǹ���. 
			}else {
				
			}
		}
		
		f.allCh.checked = false;//���� checkbox�� Ǯ�� ��ü checkbox�� ���� 
		f.btn1.disabled = true;//��ư�� ��Ȱ��ȭ()
		f.btn2.disabled = true;//��ư�� ��Ȱ��ȭ()
		document.getElementById("sumtext").innerHTML = sum;
	}
	
  function qytChange(num){
	  var y = document.getElementById("c_qty");
	  if(y>1) {y.value=y+num;}
  }
  
  function confirmDel(){
		if(confirm("���û�ǰ�� �����Ͻðڽ��ϱ�?")==true){
			document.frm.action = "cartDelProc.jsp";
			document.frm.submit();
		}else{ //���
			return;
		}
	}
  function calc(cart){
	  f=document.frm; 
		for (var i = 1; i < f.fch.length; i++) {
			//alert(f.fch[i].value);
			if(f.fch[i].checked){
				sum += parseInt(cart.value);
			}else 
				  sum -= parseInt(cart.value);
		}
	  
	  document.getElementById("sumtext").innerHTML = sum;
  }
  
</script>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h2 class="layout-page-title">��ٱ���</h2>
			<p>�ֹ��Ͻ� ��ǰ�� �� ������ ��Ȯ�ϰ� Ȯ���� �ּ���.</p>
	<form name="frm" action="order.jsp">
		<input type="hidden" name="fch" value="0">
		<table border="1">
		<tr>
			<th><input type="checkbox" name="allCh" 
			onclick="allChk()"></th>
			<th>��ǰ����</th>
			<th>��ǰ��</th>
			<th>����</th>
			<th>��ǰ�ݾ�</th>
		</tr>
		<%
			Vector<CartBean> clist = cMgr.getCart(id);
				for(int i= 0; i<clist.size();i++){	
					CartBean cart = clist.get(i);
					p_code = cart.getP_code();
					ProductBean product = pMgr.getProduct(p_code);
					String p_main_pht_name = product.getP_main_pht_name();
			 		String p_name = product.getP_name();
					int p_price = product.getP_price();
					int c_qty = cart.getC_qty();
					int totalPrice = p_price* c_qty;
		%>
		<tr>
			<td><input type="checkbox" name="fch" 
			value="<%=p_code%>"  onclick="chk()"></td>
			<td><img alt="��ǰ����" src="${pageContext.request.contextPath}
			/img/product/ready.gif"></td>
			<td><%=p_name %><br><%=p_price %>��</td>
		
			<td><input type="button" value="-" 
			onclick="qytChange(-1)">
			<input type="text" id="c_qty" value=<%=c_qty%>>
			<input type="button" value="+" 
			onclick="qytChange(1)"></td>
			<td><%=totalPrice%></td>
		</tr>
				<%} %>	
		</table>
		<br>
		<table border="1">
		<tr>
			<th>��ǰ�ݾ�</th>
			<th>��ۺ�</th>
			<th>���������ݾ�</th>
		</tr>
		<tr>
			<td id="sumtext">0</td>
			<td><%=o_del_fee %></td>
			<td>�����ݾ�</td>
			</tr>
		</table>
		<br>
		<input type="button" name="btn1" value="���� �����ϱ�" 
		disabled style ="width:150px" 
		onclick="location.href='javascript:confirmDel()'">
		<input type="submit" name="btn2" value="���� �ֹ��ϱ�" 
		disabled	style ="width:150px">
		<input type="hidden" name="id" value="<%=id %>">
		</form>
	</div>
</body>
</html>