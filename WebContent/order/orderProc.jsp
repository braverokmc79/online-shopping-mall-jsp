<!--�ֹ����� ���� �� īƮ ����  -->
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="order.OrderMgr"/>
<jsp:useBean id="bean" class="order.OrderBean"/>
<jsp:useBean id="odbean" class="order.OrderDetailBean"/>
<%
		request.setCharacterEncoding("EUC-KR");
		
		String o_id = request.getParameter("o_id");
		String o_recpt_name = request.getParameter("o_recpt_name");
		String o_recpt_contact = request.getParameter("o_recpt_contact");
		String o_recpt_zipcode = request.getParameter("o_recpt_zipcode");
		String o_recpt_add = request.getParameter("o_recpt_add");
		String o_recpt_add_det = request.getParameter("o_recpt_add_det");
		String o_del_msg = request.getParameter("o_del_msg");
		String o_status = request.getParameter("o_status");
		int o_prod_amount = Integer.parseInt(request.getParameter("o_prod_amount"));
		int o_del_fee =Integer.parseInt(request.getParameter("o_del_fee"));
		int o_total_amount = Integer.parseInt(request.getParameter("o_total_amount"));
		String o_pay_method = request.getParameter("o_pay_method");
		String qty[] = request.getParameterValues("o_qty");
		String code[] = request.getParameterValues("p_code");
		int countPart =Integer.parseInt(request.getParameter("countPart"));
		//int p_code = Integer.parseInt(request.getParameter("p_code"));
		
		//order insert
		bean.setO_id(o_id);
		bean.setO_recpt_name(o_recpt_name);
		bean.setO_recpt_contact(o_recpt_contact);
		bean.setO_recpt_zipcode(o_recpt_zipcode);
		bean.setO_recpt_add(o_recpt_add);
		bean.setO_recpt_add_det(o_recpt_add_det);
		bean.setO_del_msg(o_del_msg);
		bean.setO_prod_amount(o_prod_amount);
		bean.setO_del_fee(o_del_fee);
		bean.setO_total_amount(o_total_amount);
		bean.setO_pay_method(o_pay_method);
		bean.setO_status(o_status);
		boolean orderResult=mgr.insertOrder(bean);
		
		//orderDetail insert
		int o_qty[] = new int[countPart];
		int p_code[] = new int[countPart];
		for(int i =0; i<countPart;i++){
			o_qty[i] = Integer.parseInt(qty[i]);
			p_code[i] = Integer.parseInt(code[i]);
		}
		odbean.setO_qty(o_qty);
		odbean.setP_code(p_code);
		boolean orderDetailResult=mgr.insertDetailOrder(odbean);
		
		String msg = "";
		 if(orderResult&&orderDetailResult){
			msg = "���簡 �Ϸ�Ǿ����ϴ�." + countPart;
			//response.sendRedirect("mypage_orderlist.jsp");
		}else{
			msg = "�������";
			out.println("history.back();");
		}
%>

<script>
	alert("<%=msg%>");
	location.href = "mypage_orderlist.jsp";
</script>

