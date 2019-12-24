<!-- 사용자 주문서 page: cart.jsp에서 수량가져옴. -->

<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="product.UtilMgr"%>
<%@page import="order.OrderBean"%>
<%@page import="member.MemberBean"%>
<%@page import="product.ProductBean"%>
<%@page import="order.CartMgr"%>
<%@page import="order.CartBean"%>
<%@page import="java.util.Vector"%>
<%@page import="product.productUtil"%>

<jsp:useBean id="mMgr" class="member.MemberMgr"/>
<jsp:useBean id="pMgr" class="product.ProductMgr"/>
<jsp:useBean id="oMgr" class="order.OrderMgr"/>
<jsp:useBean id="cMgr" class="order.CartMgr"/>

<%
		request.setCharacterEncoding("EUC-KR");


		String flag = request.getParameter("flag");
		String pCode = null;
		int qty = 0;
		
		if(flag.equals("oneProduct")){
			pCode = request.getParameter("p_code");
			qty = Integer.parseInt(request.getParameter("quantity"));
		}

		/// check 필요
		String o_id = (String)session.getAttribute("idKey");
		o_id = "u1"; // 확인용 
		String o_status = "결재완료";
		int p_code=0;
		int o_qty =0;
		int countPart = 0;
		////
		
		
		int priceTotal = 0;

		productUtil util = new productUtil();

		String shippingPrice = util.price(2500);
		
%>

<!-- 
<!DOCTYPE html>
<html>
<title>주문서</title>
<head>
</head>
<body>
 -->

<link rel="stylesheet" type="text/css" href="css/order.css"/>

<%@ include file="../top.jsp" %>

		<main>
			<div id="orderWapper">
				<h2>주문서</h2>
					<section id="order_product">
					<h3 class="order_subtitle">상품정보</h3>
						<table>
							<tr>
								<td colspan="2">상품정보</td>
								<td>상품수량</td>
								<td>상품금액</td>
							</tr>
								<%
									Vector<CartBean> vlist = cMgr.getCart(o_id);
									if(vlist.isEmpty()){
								%>
								<tr> 
									<tr>
										<td colspan="4">
										주문하신 물품이 없습니다.
										</td>
									</tr>
								<%
									}
									for(int i=0; i<vlist.size(); i++){
										CartBean cart = vlist.get(i);
										p_code = cart.getP_code();
										ProductBean pbean = pMgr.getProduct(p_code);
										int price = pbean.getP_price();
										o_qty = cart.getC_qty();
										priceTotal += price * o_qty;
										countPart = vlist.size();
								%>
							<tr>
								<td>
								<img alt="제품사진" src="${pageContext.request.contextPath}/img/product/ready.gif">
								</td>
								<td><a><%=pbean.getP_name() %></a></td>
								<td><%=o_qty %>개</td>
								<td><%=UtilMgr.intFormat(price) %>원</td>
							</tr>
							<%
									}
								%>
						</table>
					</section>
					<section id="order_member">
						<h3 class="order_subtitle">주문자 정보</h3>
						<table>
							<tr>
							<%
								MemberBean mbean = mMgr.getMember(o_id);
							%>
								<td>보내는 분</td>
								<td><%=mbean.getNAME() %></td>
							</tr>
							<tr>
								<td>휴대폰 </td>
								<td><%=mbean.getContact() %></td>
							</tr>
							<tr>
								<td>이메일 </td>
								<td><%=mbean.getEmail() %></td>
							</tr>
						</table>
						<hr/>
						</section>
						<form name="orderFrm" method="post" action="mypage_orderProc.jsp">
						<section id="order_delivery">
						<h3 class="order_subtitle">배송정보</h3>
						<table>
								<%
									Vector<OrderBean> olist = oMgr.getOrder(o_id);
									OrderBean order = olist.get(0); //최근 주문 정보 
								%>
							<tr>
								<td>배송주소</td>
								<td><input name="o_recpt_add" readonly="readonly" value="<%=order.getO_recpt_add()%>"><input type="button" value="주소검색"></td>
							</tr>
							<tr>
								<td></td>
								<td><input name="o_recpt_add_det"  value="<%=order.getO_recpt_add_det()%>"></td>
							</tr>
							<tr>
								<td></td>
								<td><input name="o_recpt_zipcode" readonly="readonly" value="<%=order.getO_recpt_zipcode()%>"></td>
							</tr>
							<tr>
								<td>수령인 이름</td>
								<td><input name="o_recpt_name" value="<%=order.getO_recpt_name()%>"></td>
							</tr>
							<tr>
								<td>휴대폰</td>
								<td><input name="o_recpt_contact"  value="<%=order.getO_recpt_contact()%>"></td>
							</tr>
							
							<tr>
								<td>배송요청사항</td>
								<td><textarea name="o_del_msg" rows="5" cols="50"></textarea></td>
							</tr>
						</table>
						</section>
						<section id="order_point">
							<h3 class="order_subtitle">적립금</h3>
								<table>
									<tr>
										<td>적립급 적용</td>
										<td><input placeholder="사용가능한 적립금 : 5000원"></td>
									</tr>
								</table>
						</section>
						<section id="order_pay">
							<h3 class="order_subtitle">결제금액</h3>
							<table>
								<tr>
									<td>상품금액&nbsp;&nbsp;&nbsp;</td>
									<td><input name="o_prod_amount" readonly size="13" 	value="<%=priceTotal%>">원</td>
								</tr>
								<tr>
									<td>배송비&nbsp;&nbsp;&nbsp;</td>
									<td><input name="o_del_fee" readonly size="13" 	value="<%=shippingPrice%>">원</td>
								</tr>
								<tr>
									<td>최종결재금액&nbsp;&nbsp;&nbsp;</td>
									<td><input name="o_total_amount" readonly size="13" value="<%=priceTotal+shippingPrice%>">원</td>
								</tr>
								<tr>
									<td>구매 시 <%=UtilMgr.intFormat(priceTotal)%>P 적립</td>
								</tr>
							</table>
						</section>
						<section id="order_howpay">
							<h3 class="order_subtitle">결제수단</h3>
							<table>
								<tr>
									<td>일반결재 &nbsp;&nbsp;&nbsp;</td>
									<td> 신용카드
									<input type=radio name="o_pay_method" value="신용카드" onclick='paymentMethod(this.value);' checked>
									&nbsp;&nbsp;&nbsp; 휴대폰
									<input type=radio name="o_pay_method" value="휴대폰" onclick='paymentMethod(this.value);'>
							  		</td>
							  </tr>
							  <tr id='tr1'>
						  			<td>
						  				<select id="card">
							  				<option value="0">카드를 선택해주세요.</option>
							  				<option value="1">현대(무이자)</option>
							  				<option value="2">신한</option>
							  				<option value="3">비씨</option>
							  				<option value="4">NH</option>
							  				<option value="5">삼성</option>
						  				</select>
						  				<select id="installment">
							  				<option value="0">일시불</option>
							  				<option value="1">2개월 할부</option>
							  				<option value="2">3개월 할부</option>
							  				<option value="3">4개월 할부</option>
							  				<option value="4">5개월 할부</option>
							  				<option value="5">6개월 할부</option>
						  				</select>
						  			</td>
							  	</tr>
							  	<tr id='tr2' style="display:none">
							  		<td></td>
									<td><input name="cellphone1" size="13" placeholder="010-1234-1234"><td>
								</tr>
								<tr>
									<td>간편결제 &nbsp;&nbsp;&nbsp;</td>
									<td>네이버 페이<input type=radio name="o_pay_method" value="네이버페이" onclick='paymentMethod(this.value);'></td>
							  	</tr>
 							</table>
  						</section>
						<section id="order_private">
						<h3 class="order_subtitle">개인정보 수집/제공*</h3>
						<table>
							<tr>
								<td>개인정보 수집/제공*</td>
							</tr>
							<tr>
								<td><input id="agreement" type=checkbox value=1>결재진행 필수동의</td>
							</tr>
							<tr>
								<td>&nbsp;&nbsp;&nbsp;개인정보 수집/이용동의(필수)</td>
								<td>&nbsp;&nbsp;&nbsp;<a href="">약관확인></a></td>
							</tr>
							<tr>
								<td>&nbsp;&nbsp;&nbsp;결재대행 서비스 약관 동의(필수)</td>
								<td>&nbsp;&nbsp;&nbsp;<a href="">약관확인></a></td>
							</tr>
						</table>
						<input type="hidden" name="o_id" value="<%=o_id%>">
						<input type="hidden" name="o_status" value="<%=o_status%>">
						<input type="hidden" name="countPart" value="<%=countPart%>">
						<%for(int i =0; i<countPart;i++){ %>
						<input type="hidden" name="o_qty" value="<%=o_qty%>">
						<input type="hidden" name="p_code" value="<%=p_code%>">
						<%} %>
						<input type="submit" value="결재완료" onclick="agreement()">
						</form>
					</section>
					
					
			</div>
		</main>
		
	</div> <!--  #btn_mypage_wrapper (버튼메뉴 + mypage) : mypage_side.jsp 에서 열림-->
	</div> <!-- #main (상단요약 + 버튼 + mypage) : mypage_side.jsp 에서 열림-->
	<%@ include file="../bottom.jsp" %>
	
	<script type="text/javascript" src="js/order.js"></script>
	

	</body>
</html>













