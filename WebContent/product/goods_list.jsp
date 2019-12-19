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
<script>
	
</script>
<jsp:include page="../top.jsp"/>
<main>
��ǰ �� : <%=vlist.size()%>

	<h3><%=listName %></h3>
	
		<table  border="1">					
			<tr align="center">
			<%
			for (int i=0; i<vlist.size(); i++) {ProductBean pbean = vlist.get(i);
			%>
					<td>
						<a href="#">
							<img src="../img/product/<%=pbean.getP_main_pht_name()%>" height="150" width="150">
						</a><br/>
						<a href="#">
							<span>
								<%=pbean.getP_name()%>
							</span>
						</a><br/>
							<span><%=pbean.getP_price()%>��</span>
					</td>	
					<%} //--for%>					
			</tr>								
		</table>

</main>
	
	<jsp:include page="../bottom.jsp"/>
	
	
</body>
</html>