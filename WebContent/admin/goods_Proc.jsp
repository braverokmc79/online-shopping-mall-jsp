<!-- goods_Proc.jsp -->
<%@page import="Product.UtilMgr"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="pMgr" class="Admin.ProductMgr"/>

<%
		request.setCharacterEncoding("EUC-KR");
		String flag = request.getParameter("flag");
		String msg = "������ �߻��Ͽ����ϴ�.";
		boolean result = false;
		System.out.println(flag);
			
		if(flag.equals("insert")){
			result = pMgr.insertProduct(request);
			if(result) msg = "��ǰ�� ����Ͽ����ϴ�.";
		}else if(flag.equals("update")){
			//msg="�����̾�";
			result = pMgr.updateProduct(request);
			if(result) msg ="��ǰ�� �����Ͽ����ϴ�.";
		}else if(flag.equals("delete")){	
			String snum[]=request.getParameterValues("fch");
			//���ڿ� snum�� int�� �迭 ��ȯ, num�� ũ��� snum�� ũ��� ����
			int p_code[] = new int[snum.length];
			//���ڿ� �迭�� ������ �迭�� ��ȯ ���� ����(����)
			for(int i=0;i<p_code.length;i++){
				p_code[i] = Integer.parseInt(snum[i]);
		}
			result = pMgr.deleteproduct(p_code);
			response.sendRedirect("goods_master.jsp");			
			if(result) msg = "��ǰ�� �����Ͽ����ϴ�.";
		}
%>
<script>
	alert("<%=msg%>");
	location.href = "goods_master.jsp";
</script>