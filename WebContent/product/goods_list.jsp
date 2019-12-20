<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="product.UtilMgr"%>
<%@page import="product.ProductBean"%>
<%@page import="java.util.Vector"%>

<jsp:useBean id="mgr" class="product.ProductMgr" />

<%
	request.setCharacterEncoding("EUC-KR");
	
	String listName = null;
	String searchTerm = null;
	String flag = request.getParameter("list");
	
	System.out.println(flag);
	
	Vector<ProductBean> vlist;
	
	switch (flag){
	case "all":
		listName ="��ü��ǰ";
		break;
	case "best":
		listName ="����Ʈ��ǰ";
		break;		
	case "new":
		listName ="�Ż�ǰ";
		break;
	/*case "review":
		listName ="�����";
		break;*/
	/*case "priceH":
		listName ="���� ���ݼ�";
		break;*/
	/*case "review":
		listName ="���� ���ݼ�";
		break;*/
	case "search":
		listName= "�˻����";
		break;
	}
	
	
	if(flag.equals("search")){
		searchTerm = request.getParameter("searchTerm");
		if(searchTerm.trim().equals("")  || searchTerm == null){
			listName = "�˻�� �Է����ּ���.";
			vlist = null;
			
		}else{
			listName = searchTerm + " �� �˻� ���";
			vlist = mgr.getSearchList(searchTerm);
			
		}
		
	}else{
		vlist = mgr.getGoodsList(flag);
		
	}
	


	
%>
<link rel="stylesheet" type="text/css" href="../css/goodsList.css">
<script>
	
</script>
<jsp:include page="../top.jsp"/>


<main>

<!-- ��ǰ �� :  --><%--<%=vlist.size()%>--%>
	
	<div class="goodslist">
		<div class="goodslist_tit">
			<h3 class = "goodslist_btn"><%=listName %></h3>
			<span class = "goodslist_detail"></span>
		</div>
		
		<ul>
			<%
			for (int i=0; i<vlist.size(); i++) {ProductBean pbean = vlist.get(i);
			%>
			<li>
				<a href="#">
					<img src="../img/product/<%=pbean.getP_main_pht_name()%>">
				</a>
				<div class="goods_info">
					<a href="#">
						<span class="name">
							<%=pbean.getP_name()%>
						</span>
					</a>
					<span class="price">
						<%=pbean.getP_price()%>��
					</span>
				</div>	
			</li>
			<%} //--for%>
		</ul>
	</div>
	
</main>
	
	<jsp:include page="../bottom.jsp"/>
	
	
</body>
</html>