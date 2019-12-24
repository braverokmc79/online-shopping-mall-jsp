<!-- ����� �ֹ��� page -->

<%@page import="order.OrderDetailBean"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
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
		String o_id = (String)session.getAttribute("idKey");
		o_id = "u1"; // Ȯ�ο� 
		int o_index = Integer.parseInt(request.getParameter("o_index"));
		String o_status = "����Ϸ�";//���� �ֹ��� default ������ �Է� 
		int priceTotal = 0;
		int shippingPrice = 2500;
%>

<!-- 
<!DOCTYPE html>
<html>
<title>�ֹ���</title>
<head>
</head>
<body>
 -->
<link rel="stylesheet" type="text/css" href="../css/index.css">
<link rel="stylesheet" type="text/css" href="css/order.css"/>


<%@ include file="../top.jsp" %>

	<%@ include file="../order/mypage_side.jsp"%> 
	
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
									OrderDetailBean detailOrder = oMgr.getOrderCode(o_index);
									int p_codes[] = detailOrder.getP_code();
									int o_qtys[] = detailOrder.getO_qty();
									for(int i=0; i<p_codes.length; i++){
										int p_code = p_codes[i];
										ProductBean pbean = pMgr.getProduct(p_code);
										int price = pbean.getP_price();
										int o_qty = o_qtys[i];
										priceTotal += price * o_qty;
								%>
								<%=p_code %>
								<%=o_qty %>
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
						<section id="order_delivery">
						<h3 class="order_subtitle">�������</h3>
						<table>
								<%
									Vector<OrderBean> olist = oMgr.getOrderDetail(o_index);
									OrderBean order = olist.get(0); //�ֱ� �ֹ� ���� 
								%>
							<tr>
								<td>����ּ�</td>
								<td><input name="o_recpt_add" readonly value="<%=order.getO_recpt_add()%>"></td>
							</tr>
							<tr>
								<td></td>
								<td><input name="o_recpt_add_det" readonly  value="<%=order.getO_recpt_add_det()%>"></td>
							</tr>
							<tr>
								<td></td>
								<td><input name="o_recpt_zipcode" readonly="readonly" value="<%=order.getO_recpt_zipcode()%>"></td>
							</tr>
							<tr>
								<td>������ �̸�</td>
								<td><input name="o_recpt_name" readonly value="<%=order.getO_recpt_name()%>"></td>
							</tr>
							<tr>
								<td>�޴���</td>
								<td><input name="o_recpt_contact" readonly  value="<%=order.getO_recpt_contact()%>"></td>
							</tr>
							
							<tr>
								<td>��ۿ�û����</td>
								<td><textarea name="o_del_msg" readonly rows="5" cols="50"></textarea></td>
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
							<%=order.getO_pay_method() %>
  						</section>
						<input type="submit" value="�ֹ��������� �̵�" onclick="location.href='mypage_orderlist.jsp'">
					</section>
					
					
			</div>
		</main>
		
</div> <!--  #btn_mypage_wrapper (��ư�޴� + mypage) : mypage_side.jsp ���� ����-->
</div> <!-- #main (��ܿ�� + ��ư + mypage) : mypage_side.jsp ���� ����-->
	<%@ include file="../bottom.jsp" %>		
	</body>
	
	<script type="text/javascript" src="js/order.js"></script>
	
</html>













