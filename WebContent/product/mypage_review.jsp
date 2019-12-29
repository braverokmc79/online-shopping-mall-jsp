<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="product.ReviewBean" %>
<%@ page import="java.util.Vector" %>

<jsp:useBean id="reviewMgr" class="product.ReviewMgr"/>

<link rel="stylesheet" type="text/css" href="./css/review.css">

<%@include  file="../top.jsp"%>

	<%@ include file="../order/mypage_side.jsp"%> 

	<div id="mypage">
	
		<h1 class="title">�������</h1>
		
		<input id="" class="btn" type="button" value="���� ���� ���">
		<input id="" class="btn" type="button" value="�ۼ� ���� ����">
		
		<div class="mypage_wrapper">

		
			<h3 class="inner_title">�ۼ� ������ ����</h3>
            <span class="review_detail">���� �� 31�� �̳��� ��ǰ�� ���ؼ��� ���� �ۼ��� �����մϴ�.</span>
			
			
			<table class="mypage_table horHead">
				<tr id="column_tr">
					<th>�ֹ���ȣ</th>
					<th colspan="2">��ǰ����</th>
					<th>������</th>
					<th>�ֹ�����</th>
					<th></th>
				</tr>

				<%
					// �ۼ� ���� ���� ��� �������� 
					Vector<ReviewBean> reBeanList = reviewMgr.getAvaReview(id);
				
					if(reBeanList.isEmpty()){
				%>
					
					<tr>
						<td colspan="5">
							�ۼ� ������ ���䰡 �����ϴ�.
						</td>
					</tr>
					
				<%		
					} // --if 
					else{
						
						
					for(ReviewBean reBean: reBeanList){
						
						int o_index = reBean.getO_index();
						String p_main_pht_name = reBean.getP_main_pht_name();
						String p_name = reBean.getP_name();
						String o_date = reBean.getO_date();
						String o_status = reBean.getO_status();
						int p_code = reBean.getP_code();
				%>
				
					<tr>
						<td class="btn_td">
							<a href="${pageContext.request.contextPath}/order/mypage_order_view.jsp?order=<%=o_index%>">
								<%=o_index%>
							</a>
						</td>
						<td>
							<img alt="��ǰ����" src="${pageContext.request.contextPath}/img/product/<%=p_main_pht_name%>">
						</td>
						<td class="btn_td">
							<a href="${pageContext.request.contextPath}/product/goods_view.jsp?p_code=<%=p_code%>">
                           		<%=p_name %>
                           	</a>
                       	</td>
                       	<td>
                       		<%=o_date %>
                       	</td>			
                       	<td>
                       		<%=o_status %>
                       	</td>
					</tr>
					<!--  �ۼ� ĭ -->
					<tr>
						<td class="rateField" colspan="4">
	                    	<form name="reviewWriteFrm" method="post" action="./reviewProc.jsp">
								<%
									for(int i=0; i<5; i++){
								%>
									<input type="radio" class="rate_star" id="rate_star<%=i+1%>_<%=o_index%>_<%=p_code%>" name="r_rate" value="<%=i+1%>">
									
									<script>
										const rate_star<%=i+1 %>_<%=o_index%>_<%=p_code%> = document.getElementById('rate_star<%=i+1 %>_<%=o_index%>_<%=p_code%>');
									</script>
									
									<label for="rate_star<%=i+1%>_<%=o_index%>_<%=p_code%>">
										<i class="nStar far fa-star"></i>
									</label>
								<%
									}
								%>
		                           	<input type="hidden" name="o_index" value="<%= o_index%>">
		                           	<input type="hidden" name="p_code" value="<%=p_code%>">
		                           	<input type="hidden" name="id" value="<%=id %>">
									<textarea name="r_content" id="reviewText"></textarea>
									<script>
										const reviewText_<%=o_index%>_<%=p_code%> = document.getElementById('reviewText_<%=o_index%>_<%=p_code%>');
									</script>
                       		<input type="submit" class="btn" value="�ۼ�">
							</form>
						</td>
						<td>
						</td>
					</tr>
				
				<%		
					} // -- for
				} // -- else
				%>

			</table>

			
		</div>
		
		
		<form name="reviewReadFrm" method="post" action="">
			
			<h3 class="inner_title">���� �ۼ��� ����</h3>
			
			<% 
				String reviewList = "mypage";
				int p_code = 0; // mypage ���� �Ѿ �� ���� ������ �ʵ��� ���� �� �ο��ؾ���
			%>
			<%@include file = "review.jsp" %>

				
		</form>
		
		
	</div>

</div> <!--  #btn_mypage_wrapper (��ư�޴� + mypage) : mypage_side.jsp ���� ����-->
</div> <!-- #main (��ܿ�� + ��ư + mypage) : mypage_side.jsp ���� ����-->
	<%@ include file="../bottom.jsp" %>
	
<script type="text/javascript" charset="EUC-KR" src="js/review.js"></script>

</body>
</html>