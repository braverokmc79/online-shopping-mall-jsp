<%@page import="Order.OrderDetailBean"%>
<%@page import="Product.ProductBean"%>
<%@page import="Order.OrderBean"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="orderMgr" class="Order.OrderMgr"/>
<jsp:useBean id="pMgr" class="Product.ProductMgr"/>
<%
		String id = (String)session.getAttribute("idKey");
		String msg = "";

		//if(session.getAttribute("idKey")==null){
		//	msg="�α����� �ʿ��� ������ �Դϴ�.";
		//}
		
		
		/*  test ( u1 �� ���� ������ )  */
		id ="u1";
%>
<script>
	//alert("<%=msg%>");
	//location.href = "../index.jsp";
	
</script>


<link rel="stylesheet" type="text/css" href="./css/mypage_orderlist.css">
<jsp:include page="../top.jsp"/>

<div id="main">
	<jsp:include page="./mypage_aside.jsp"/>
	
	
	<div id="mypage">
		<table>
			<thead>
			<tr>
				<td colspan="5">�ֹ�����</td>
			</tr>
			</thead>
			<tr>
				<td>�ֹ���ȣ</td>
				<td>��ǰ��</td>
				<td>�ֹ���¥</td>
				<td>�ֹ�����</td>
				<td>�ֹ����</td>
			</tr>
		<!-- �ֹ����� �������� -->
				<%
					Vector<OrderBean> vlist = orderMgr.getOrder(id);
					
					if(vlist.isEmpty()){
				%>
				<tr> 
					<tr>
						<td colspan="5">
						�ֹ��Ͻ� ��ǰ�� �����ϴ�.
						</td>
					</tr>
				<%} else{
					for(int i=0;i<vlist.size();i++){
						OrderBean order = vlist.get(i);
						int o_index = order.getO_index();
						Vector<OrderDetailBean> dvlist= orderMgr.getOrderCode(o_index);
						for(int j=0;j<dvlist.size();j++){
							OrderDetailBean detailOrder = dvlist.get(j);
							int p_code = detailOrder.getP_code();
							ProductBean pbean = pMgr.getProduct(p_code);
				%>			
				<tr>
					<td><%=order.getO_index() %></td>
					<td><%=pbean.getP_name()%></td>
					<td><%=order.getO_date()%></td>
					<td><%=order.getO_status()%></td>
					<td><%=order.getO_pay_method()%></td>
				</tr>
				<%			
						}//---for
					}//---for
				}//---else
				%>
				
		</table>
	</div>
</div>
		<jsp:include page="../bottom.jsp"/>
</body>
</html>



