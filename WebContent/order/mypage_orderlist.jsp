<%@page import="order.AdminOrderBean"%>
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

            <h1 class="title">�ֹ�����</h1>
            
            <table class="mypage_table">
                <tr id="column_tr">
                    <th>�ֹ���ȣ</th>
                    <th>��ǰ��</th>
                    <th>�ֹ���¥</th>
                    <th>�ֹ�����</th>
                    <th>�ֹ����</th>
                </tr>
            <!-- �ֹ����� �������� -->
				<%
					Vector<AdminOrderBean> vlist = orderMgr.getAdminOrder(id);
					
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
						AdminOrderBean order = vlist.get(i);
						int o_index = order.getO_index();
						int count = order.getProduct_count();//��ǰ����  
				%>			
				<tr>
					<td class="btn_td"><a href="mypage_order_view.jsp?o_index=
					<%=o_index%>"><%=o_index %></a></td>
					<td class="btn_td"><a href="#"><%=order.getP_name()%>
					<%if(count>1){%>
					��<%=count-1 %>��</a></td>
					<%}%>
					
					<td><%=order.getO_date()%></td>
					<td><%=order.getO_status()%></td>
					<td><%=order.getO_paymethod()%></td>
				</tr>
				<%
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



