<!-- goods_Proc.jsp -->
<%@page import="product.UtilMgr"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="pMgr" class="admin.ProductMgr"/>

<%
		request.setCharacterEncoding("EUC-KR");
		String flag = request.getParameter("flag");
		String msg = "������ �߻��Ͽ����ϴ�.";		
		boolean result = false;
			
		if(flag.equals("insert")){
			result = pMgr.insertProduct(request);
			if(result) msg = "��ǰ�� ����Ͽ����ϴ�.";
		}else if(flag.equals("update")){
			//result = pMgr.updateProduct(request);
			if(result) msg ="��ǰ�� �����Ͽ����ϴ�.";
		}else if(flag.equals("delete")){
			int no = UtilMgr.parseInt(request, "no");
			//result = pMgr.deleteProduct(no);
			if(result) msg = "��ǰ�� �����Ͽ����ϴ�.";
		}
%>
<script>
	alert("<%=msg%>");
	location.href = "goods_insert.jsp";
</script>