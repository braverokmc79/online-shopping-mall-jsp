<%@page import="order.OrderDetailBean"%>
<%@page import="product.ProductBean"%>
<%@page import="order.OrderBean"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="orderMgr" class="order.OrderMgr"/>
<jsp:useBean id="pMgr" class="product.ProductMgr"/>
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


	<jsp:include page="./mypage_side.jsp"/>
	
	
	<div id="mypage">
		<table id="mypage_table">
			<thead>
			<tr>
				<td id="head_td" colspan="5">�ֹ�����</td>
			</tr>
			</thead>
			<tr id="column_tr">
				<td class="column_td">�ֹ���ȣ</td>
				<td class="column_td">��ǰ��</td>
				<td class="column_td">�ֹ���¥</td>
				<td class="column_td">�ֹ�����</td>
				<td class="column_td">�ֹ����</td>
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
					<td class="btn_td"><a href="#"><%=order.getO_index() %></a></td>
					<td class="btn_td"><a href="#"><%=pbean.getP_name()%></a></td>
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
</div> <!--  #btn_mypage_wrapper (��ư�޴� + mypage) : mypage_side.jsp ���� ����-->
</div> <!-- #main (��ܿ�� + ��ư + mypage) : mypage_side.jsp ���� ����-->
		<jsp:include page="../bottom.jsp"/>
</body>
</html>



