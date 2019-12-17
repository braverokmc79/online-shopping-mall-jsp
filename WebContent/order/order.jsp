<!-- ����� �ֹ��� page -->
<%@page import="Order.UtilMgr"%>
<%@page import="Order.OrderBean"%>
<%@page import="Member.MemberBean"%>
<%@page import="Product.ProductBean"%>
<%@page import="Order.CartMgr"%>
<%@page import="Order.CartBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mMgr" class="Member.MemberMgr"/>
<jsp:useBean id="pMgr" class="Product.ProductMgr"/>
<jsp:useBean id="oMgr" class="Order.OrderMgr"/>
<jsp:useBean id="cMgr" class="Order.CartMgr"/>

<%
		String id = (String)session.getAttribute("idKey");
		int priceTotal = 0;
		int shippingPrice = 2500;
%>


<!DOCTYPE html>
<html>
<title>�ֹ���</title>
<head>
<script type="text/javascript" src="js/order.js"></script>
<link rel="stylesheet" type="text/css" href="css/order.css"/>
</head>
<body>
<h2>�ֹ���</h2>


<table>
	<tr>
		<td>��ǰ����</td>
	</tr>
	<tr>
		<td colspan="2">��ǰ����</td>
		<td>��ǰ����</td>
		<td>��ǰ�ݾ�</td>
	</tr>
		<%
			Vector<CartBean> vlist = cMgr.getCart("u1");
			if(vlist.isEmpty()){
		%>
		<tr> 
			<tr>
				<td colspan="4">
				�ֹ��Ͻ� ��ǰ�� �����ϴ�.
				</td>
			</tr>
		<%
			}
			for(int i=0; i<vlist.size(); i++){
				CartBean cart = vlist.get(i);
				int p_code = cart.getP_code();
				ProductBean pbean = pMgr.getProduct(p_code);
				int price = pbean.getP_price();
				int quantity = cart.getC_qty();
				priceTotal += price * quantity;
		%>
	<tr>
		<td>
		<img alt="��ǰ����" src="${pageContext.request.contextPath}/img/product/ready.gif">
		</td>
		<td name><%=pbean.getP_name() %></td>
		<td><%=cart.getC_qty() %>��</td>
		<td><%=UtilMgr.intFormat(pbean.getP_price()) %>��</td>
	</tr>
	<%
			}
		%>
</table>
<hr/>
<table>
	<tr>
		<td>�ֹ��� ����</td>
	</tr>
	<tr>
	<%
		
	%>
		<td>������ ��</td>
		<td></td>
	</tr>
	<tr>
		<td>�޴��� </td>
		<td>010-3841-0424</td>
	</tr>
	<tr>
		<td>�̸��� </td>
		<td>mwchoi0428@gmail.com</td>
	</tr>
</table>
<hr/>
<form name="orderFrm" method="post" action="orderProc.jsp">
<table>
	<tr>
		<td>�������</td>
	</tr>
		<%
		Vector<OrderBean> olist = oMgr.getOrder("u1");
		OrderBean order = olist.get(0); //�ֱ� �ֹ� ���� 
		%>
	<tr>
		<td>����ּ�</td>
		<td><input name="o_recpt_add" size="50" 
		value="<%=order.getO_recpt_add()%>"></td>
	</tr>
	<tr>
		<td></td>
		<td><input name="o_recpt_add_det" size="50" 
		value="<%=order.getO_recpt_add_det()%>"></td>
	</tr>
	<tr>
		<td><input name="o_recpt_zipcode" size="5" 
		value="<%=order.getO_recpt_zipcode()%>"></td>
		<td><input type="button" value="�ּҰ˻�"></td>
	</tr>
	<tr>
		<td>������ �̸� </td>
		<td><input name="o_recpt_name" size="20" 
		value="<%=order.getO_recpt_name()%>"></td>
	</tr>
	<tr>
		<td>�޴��� </td>
		<td><input name="o_recpt_contact" size="13" 
		value="<%=order.getO_recpt_contact()%>"></td>
	</tr>
	
	<tr>
		<td>��ۿ�û���� </td>
		<td><textarea name="o_del_msg" rows="5" cols="50"></textarea></td>
	</tr>
</table>
<hr/>
<table>
	<tr>
		<td>������</td>
	</tr>
	<tr>
		<td>������ ����</td>
		<td>��밡���� �������� �����ϴ�.</td>
	</tr>
</table>
<hr/>
<table>
	<tr>
		<td>����ݾ�</td>
	</tr>
	<tr>
		<td>��ǰ�ݾ�&nbsp;&nbsp;&nbsp;</td>
		<td><input name="o_prod_amount" readonly size="13" 
		value="<%=UtilMgr.intFormat(priceTotal) %>">��</td>
	</tr>
	<tr>
		<td>��ۺ�&nbsp;&nbsp;&nbsp;</td>
		<td><input name="o_del_fee" readonly size="13" 
		value="<%=UtilMgr.intFormat(shippingPrice) %>">��</td>
	</tr>
	<tr>
		<td>��������ݾ�&nbsp;&nbsp;&nbsp;</td>
		<td><input name="o_total_amount" readonly size="13" 
		value="<%=UtilMgr.intFormat(priceTotal+shippingPrice) %>">��</td>
	</tr>
	<tr>
		<td>���Ž� <%=UtilMgr.intFormat(priceTotal)%>��(5%)��������</td>
	</tr>
</table>
<hr/>
<table id="">
	<tr>
		<td>�������</td>
	</tr>
	<tr>
		<td>�Ϲݰ��� &nbsp;&nbsp;&nbsp;</td>
		<td> �ſ�ī��<input type=radio name="o_pay_method" value="�ſ�ī��" 
				onclick='paymentMethod(this.value);' checked>&nbsp;&nbsp;&nbsp;
  			 	�޴���<input type=radio name="o_pay_method" value="�޴���" 
  			 	onclick='paymentMethod(this.value);'>
  			 	</td>
  	</tr>
 </table>
  <table>
  	<tr id='tr1'>
  		<td>
  			<select id="card">
  				<option value="0">ī�带 �������ּ���.</option>
  				<option value="1">����(������)</option>
  				<option value="2">����</option>
  				<option value="3">��</option>
  				<option value="4">NH</option>
  				<option value="5">�Ｚ</option>
  			</select>
  			<select id="installment">
  				<option value="0">�Ͻú�</option>
  				<option value="1">2���� �Һ�</option>
  				<option value="2">3���� �Һ�</option>
  				<option value="3">4���� �Һ�</option>
  				<option value="4">5���� �Һ�</option>
  				<option value="5">6���� �Һ�</option>
  			</select>
  		</td>
	</tr>
	</table>
		<table>
			<tr id='tr2' style="display:none">
				<td><input name="cellphone1" size="13" 
				placeholder="010-1234-1234"><td>
			</tr>
		</table>
<table>
	<tr>
		<td>������� &nbsp;&nbsp;&nbsp;</td>
		<td>���̹� ����<input type=radio name="o_pay_method" 
		value="���̹�����" onclick='paymentMethod(this.value);'></td>
  	</tr>
</table>

<hr>
<table>
	<tr>
		<td>�������� ����/����*</td>
	</tr>
	<tr>
		<td><input id="agreement" type=checkbox value=1>�������� �ʼ�����</td>
	</tr>
	<tr>
		<td>&nbsp;&nbsp;&nbsp;�������� ����/�̿뵿��(�ʼ�)</td>
		<td>&nbsp;&nbsp;&nbsp;<a href="">���Ȯ��></a></td>
	</tr>
	<tr>
		<td>&nbsp;&nbsp;&nbsp;������� ���� ��� ����(�ʼ�)</td>
		<td>&nbsp;&nbsp;&nbsp;<a href="">���Ȯ��></a></td>
	</tr>
</table>
<hr>
	<input type="submit" value="����Ϸ�" onclick="agreement()">
</form>
</body>
</html>













