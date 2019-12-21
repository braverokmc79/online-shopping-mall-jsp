<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="product.productUtil"%>
<%@page import="product.ProductBean"%>

<jsp:useBean id="mgr" class="product.ProductMgr" />

<%
	request.setCharacterEncoding("EUC-KR");
	
	productUtil util = new productUtil();
	int p_code = Integer.parseInt(request.getParameter("goods"));
	
	ProductBean bean = mgr.getProduct(p_code);
%>
<link rel="stylesheet" type="text/css" href="../css/goodsList.css">
<script>
	
</script>
<jsp:include page="../top.jsp"/>

<main>
	
	<header>
		<img id="main_pht" src="../img/product/<%=bean.getP_main_pht_name()%>" style="height: 400px;">
		
		<form id="header_info_wrapper" method="get" action="../order/order.jsp">
			<div class="header name">
				<span><%=bean.getP_name() %></span>
			</div>
			<div class="header price">
				<span><%=util.price(bean.getP_price())%></span>
			</div>
			<div class="header volume">
				<span class="title">�Ǹ� �뷮</span>
				<span class="content">1���� / 600g</span>
			</div>
			<div class="header amount">
				<span class="title">���� ����</span>
				<input type="number" value="1">
			</div>
			<div class="header total">
				<span class="title">�� ��ǰ �ݾ�</span>
				<span id="total"></span>
			</div>
			<div class="header btn">
				<input type="button" class="btn" value="��ٱ��Ͽ� �߰�"> 
				<input type="submit" class="btn" value="�����ϱ�">
			</div>
		</form>			

	</header>
			
			
			<!--  ��ǰ ��õ �˰��� ���� -->
			<div id="recom_wrapper" style="display:none;">
				<div class="title">
					<span>�� ��ǰ�� �����?</span>
				</div>
				<ul>
					<li>
					</li>
				</ul>
			</div>
			
			<!-- ���� �̹��� ���� -->
			<div id="detail">
				<img id="detail_pht" src="../img/product/<%=bean.getP_detail_pht_name()%>">
			</div>
			
			<!-- �� �̹��� ����    display : none -->
			<div id="detail" style="display:none;">
				<img id="detail_pht" src="../img/product/<%=bean.getP_info_pht_name()%>">
			</div>
			
			
			<!--  ���� ����   display : none -->
			<div id="review" style="display: none;">
				<table>	
					<thead>
						<th>
						
						</th>
					</thead>
					<tr>
						<td>
						</td>
					</tr>
				</table>
			</div>
			
		</div>

	


</main>

<jsp:include page="../bottom.jsp"/>

</body>
</html>