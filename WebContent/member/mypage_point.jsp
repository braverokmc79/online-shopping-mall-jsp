<%@page import="order.PointBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="order.PointMgr"/>

<%@ include file="../top.jsp" %>

	<%@ include file="../order/mypage_side.jsp"%> 
	
<%
		request.setCharacterEncoding("EUC-KR");
		
%>

	<div id="mypage">
	
		<h1 class="title">����Ʈ����</h1>
	
		<table class="mypage_table horHead">	
						
			<tr id="column_tr">
				<th>��ȣ</th>
				<th>����</th>
				<th>�ݾ�</th>
				<th>��¥</th>
			</tr>
				<%
					Vector<PointBean> plist = mgr.getPointList(id);
					System.out.println("����Ʈ����Ʈ�� ������?:"+plist.size());	
					int listSize =plist.size(); 
					if(plist.isEmpty()){
					out.println("����Ʈ ������ �����ϴ�.");
					}else{
					for(int i=0; i<plist.size(); i++){
					PointBean pbean = plist.get(i);
					int num = i+1;
				%>
			<tr>
			<td><%=num%></td>		
			<td class="btn_td"><a href="../order/mypage_order_view.jsp?order=<%=pbean.getO_index()%>"><%=pbean.getPt_detail()%></a></td>
			<td><%=UtilMgr.intFormat(pbean.getPt_point())%></td>
			<td><%=pbean.getPt_date()%></td>
			</tr>
			<%}//--for%>
		<%}//--else%>
			
		</table>
	</div>

</div> <!--  #btn_mypage_wrapper (��ư�޴� + mypage) : mypage_side.jsp ���� ����-->
</div> <!-- #main (��ܿ�� + ��ư + mypage) : mypage_side.jsp ���� ����-->
	<%@ include file="../bottom.jsp" %>
</body>
</html>
</html>