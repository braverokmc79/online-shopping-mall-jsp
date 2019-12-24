<!-- ����� �ֹ��� page: cart.jsp���� ����������. -->

<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="product.UtilMgr"%>
<%@page import="order.OrderBean"%>
<%@page import="member.MemberBean"%>
<%@page import="product.ProductBean"%>
<%@page import="order.CartMgr"%>
<%@page import="order.CartBean"%>
<%@page import="java.util.Vector"%>
<%@page import="product.productUtil"%>

<jsp:useBean id="mMgr" class="member.MemberMgr"/>
<jsp:useBean id="pMgr" class="product.ProductMgr"/>
<jsp:useBean id="oMgr" class="order.OrderMgr"/>
<jsp:useBean id="cMgr" class="order.CartMgr"/>

<%
		request.setCharacterEncoding("EUC-KR");


		String flag = request.getParameter("flag");
		String pCode = null;
		int qty = 0;
		
		if(flag.equals("oneProduct")){
			pCode = request.getParameter("p_code");
			qty = Integer.parseInt(request.getParameter("quantity"));
		}

		/// check �ʿ�
		String o_id = (String)session.getAttribute("idKey");
		o_id = "u1"; // Ȯ�ο� 
		String o_status = "����Ϸ�";
		int p_code=0;
		int o_qty =0;
		int countPart = 0;
		////
		
		
		int priceTotal = 0;

		productUtil util = new productUtil();

		String shippingPrice = util.price(2500);
		
%>

<!-- 
<!DOCTYPE html>
<html>
<title>�ֹ���</title>
<head>
</head>
<body>
 -->

<link rel="stylesheet" type="text/css" href="css/order.css"/>

<%@ include file="../top.jsp" %>

		<main>
			<div id="orderWapper">
				<h2>�ֹ���</h2>
					<section id="order_product">
					<h3 class="order_subtitle">��ǰ����</h3>
						<table>
							<tr>
								<td colspan="2">��ǰ����</td>
								<td>��ǰ����</td>
								<td>��ǰ�ݾ�</td>
							</tr>
								<%
									Vector<CartBean> vlist = cMgr.getCart(o_id);
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
										p_code = cart.getP_code();
										ProductBean pbean = pMgr.getProduct(p_code);
										int price = pbean.getP_price();
										o_qty = cart.getC_qty();
										priceTotal += price * o_qty;
										countPart = vlist.size();
								%>
							<tr>
								<td>
								<img alt="��ǰ����" src="${pageContext.request.contextPath}/img/product/ready.gif">
								</td>
								<td><a><%=pbean.getP_name() %></a></td>
								<td><%=o_qty %>��</td>
								<td><%=UtilMgr.intFormat(price) %>��</td>
							</tr>
							<%
									}
								%>
						</table>
					</section>
					<section id="order_member">
						<h3 class="order_subtitle">�ֹ��� ����</h3>
						<table>
							<tr>
							<%
								MemberBean mbean = mMgr.getMember(o_id);
							%>
								<td>������ ��</td>
								<td><%=mbean.getNAME() %></td>
							</tr>
							<tr>
								<td>�޴��� </td>
								<td><%=mbean.getContact() %></td>
							</tr>
							<tr>
								<td>�̸��� </td>
								<td><%=mbean.getEmail() %></td>
							</tr>
						</table>
						<hr/>
						</section>
						<form name="orderFrm" method="post" action="mypage_orderProc.jsp">
						<section id="order_delivery">
						<h3 class="order_subtitle">�������</h3>
						<table>
								<%
									Vector<OrderBean> olist = oMgr.getOrder(o_id);
									OrderBean order = olist.get(0); //�ֱ� �ֹ� ���� 
								%>
							<tr>
								<td>����ּ�</td>
								<td><input name="o_recpt_add" readonly="readonly" value="<%=order.getO_recpt_add()%>"><input type="button" value="�ּҰ˻�"></td>
							</tr>
							<tr>
								<td></td>
								<td><input name="o_recpt_add_det"  value="<%=order.getO_recpt_add_det()%>"></td>
							</tr>
							<tr>
								<td></td>
								<td><input name="o_recpt_zipcode" readonly="readonly" value="<%=order.getO_recpt_zipcode()%>"></td>
							</tr>
							<tr>
								<td>������ �̸�</td>
								<td><input name="o_recpt_name" value="<%=order.getO_recpt_name()%>"></td>
							</tr>
							<tr>
								<td>�޴���</td>
								<td><input name="o_recpt_contact"  value="<%=order.getO_recpt_contact()%>"></td>
							</tr>
							
							<tr>
								<td>��ۿ�û����</td>
								<td><textarea name="o_del_msg" rows="5" cols="50"></textarea></td>
							</tr>
						</table>
						</section>
						<section id="order_point">
							<h3 class="order_subtitle">������</h3>
								<table>
									<tr>
										<td>������ ����</td>
										<td><input placeholder="��밡���� ������ : 5000��"></td>
									</tr>
								</table>
						</section>
						<section id="order_pay">
							<h3 class="order_subtitle">�����ݾ�</h3>
							<table>
								<tr>
									<td>��ǰ�ݾ�&nbsp;&nbsp;&nbsp;</td>
									<td><input name="o_prod_amount" readonly size="13" 	value="<%=priceTotal%>">��</td>
								</tr>
								<tr>
									<td>��ۺ�&nbsp;&nbsp;&nbsp;</td>
									<td><input name="o_del_fee" readonly size="13" 	value="<%=shippingPrice%>">��</td>
								</tr>
								<tr>
									<td>��������ݾ�&nbsp;&nbsp;&nbsp;</td>
									<td><input name="o_total_amount" readonly size="13" value="<%=priceTotal+shippingPrice%>">��</td>
								</tr>
								<tr>
									<td>���� �� <%=UtilMgr.intFormat(priceTotal)%>P ����</td>
								</tr>
							</table>
						</section>
						<section id="order_howpay">
							<h3 class="order_subtitle">��������</h3>
							<table>
								<tr>
									<td>�Ϲݰ��� &nbsp;&nbsp;&nbsp;</td>
									<td> �ſ�ī��
									<input type=radio name="o_pay_method" value="�ſ�ī��" onclick='paymentMethod(this.value);' checked>
									&nbsp;&nbsp;&nbsp; �޴���
									<input type=radio name="o_pay_method" value="�޴���" onclick='paymentMethod(this.value);'>
							  		</td>
							  </tr>
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
							  	<tr id='tr2' style="display:none">
							  		<td></td>
									<td><input name="cellphone1" size="13" placeholder="010-1234-1234"><td>
								</tr>
								<tr>
									<td>������� &nbsp;&nbsp;&nbsp;</td>
									<td>���̹� ����<input type=radio name="o_pay_method" value="���̹�����" onclick='paymentMethod(this.value);'></td>
							  	</tr>
 							</table>
  						</section>
						<section id="order_private">
						<h3 class="order_subtitle">�������� ����/����*</h3>
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
						<input type="hidden" name="o_id" value="<%=o_id%>">
						<input type="hidden" name="o_status" value="<%=o_status%>">
						<input type="hidden" name="countPart" value="<%=countPart%>">
						<%for(int i =0; i<countPart;i++){ %>
						<input type="hidden" name="o_qty" value="<%=o_qty%>">
						<input type="hidden" name="p_code" value="<%=p_code%>">
						<%} %>
						<input type="submit" value="����Ϸ�" onclick="agreement()">
						</form>
					</section>
					
					
			</div>
		</main>
		
	</div> <!--  #btn_mypage_wrapper (��ư�޴� + mypage) : mypage_side.jsp ���� ����-->
	</div> <!-- #main (��ܿ�� + ��ư + mypage) : mypage_side.jsp ���� ����-->
	<%@ include file="../bottom.jsp" %>
	
	<script type="text/javascript" src="js/order.js"></script>
	

	</body>
</html>













