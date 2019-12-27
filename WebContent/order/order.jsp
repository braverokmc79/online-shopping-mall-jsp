<!-- ����� �ֹ��� page: cart.jsp���� ����������. -->

<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="product.UtilMgr"%>
<%@page import="order.OrderBean"%>
<%@page import="member.MemberBean"%>
<%@page import="product.ProductBean"%>
<%@page import="order.CartMgr"%>
<%@page import="order.CartBean"%>
<%@page import="java.util.Vector"%>

<jsp:useBean id="mMgr" class="member.MemberMgr" />
<jsp:useBean id="pMgr" class="product.ProductMgr" />
<jsp:useBean id="oMgr" class="order.OrderMgr" />
<jsp:useBean id="cMgr" class="order.CartMgr" />

<%

		request.setCharacterEncoding("EUC-KR");
		String cpath = request.getContextPath();
		
		int p_code = 0;
		int o_qty = 0;
		int unitPrice = 0;
		int totalPrice = 0;
		int sum = 0;
		int countPart = 0; 
		String o_id = (String)session.getAttribute("idKey");
		String flag = request.getParameter("flag");
		
		Vector goods = new Vector();
		
		// flag (īƮ���� ��ǰ �ϳ� �������� ���� )  �� ���� Vector goods �� ���� �־���
		if(flag.equals("oneProduct")){
			System.out.print(flag);
			p_code = Integer.parseInt(request.getParameter("p_code"));
			ProductBean pbean = pMgr.getProduct(p_code);
			goods.add(pbean);
			
		}else if(flag.equals("cart")){
			System.out.print(flag);
			String value1 = request.getParameter("flag");
			String[] value2 = request.getParameterValues("fch");
			//System.out.println(o_id);
			CartMgr mgr = new CartMgr();
			Vector<CartBean> cvlist = new  Vector<CartBean>();
			for(int i=1; i<value2.length; i++){
				goods.add(cMgr.getCartOneOrder(o_id, Integer.parseInt(value2[i])));
			}
			//���⿡�� �÷��װ� �Ǵ��ؼ� ����
			//�÷��״� getparameter
			//������ǰ������ ���� �Ѱ������
			//īƮ ���ڵ� ������ �ؾ���
			//request ������ �־��ٰ�: pcode �迭�� user id 
			//goods = cvlist;
		}
		

		/// sample��
		String o_status = "�����Ϸ�";
		int shippingPrice = 2500;
		double pointRate = 0.05;  /* 5% �������� ���� */

%>
<%=flag %>
<!-- 
<!DOCTYPE html>
<html>
<title>�ֹ���</title>
<head>
</head>
<body>
 -->

<link rel="stylesheet" type="text/css" href="css/order.css"/>

<%@ include file="../top.jsp"%>


<main>
    <div id="main_wrapper">
        <div class="title_wrapper">
            <h1 class="title">�ֹ���</h1>
            <span class="description">�ֹ��Ͻ� ��ǰ�� �� ������ ��Ȯ�ϰ� Ȯ�����ּ���.</span>
        </div>

 <form name="orderFrm" method="get" action="./orderProc.jsp">
        <section id="order_product">
            <h3 class="order_subtitle">��ǰ����</h3>
            <table class="horHead" id="order_table">
                <tr>
                    <th colspan="2">��ǰ����</th>
                    <th>��ǰ����</th>
                    <th>��ǰ�ݾ�</th>
                </tr>
                <%
                
                ProductBean pbean =null;
                CartBean cbean = null;
                
                for(int i=0; i<goods.size(); i++){			
                    
                    /* ���� �ϳ� ������ ��*/
                    if(flag.equals("oneProduct")){
                     	pbean = (ProductBean)goods.get(i);	
                        o_qty = Integer.parseInt(request.getParameter("quantity"));
                        
                        /* ��ٱ��� ������ �� */
                    }else if(flag.equals("cart")){
                        cbean = (CartBean)goods.get(i);
                        o_qty = cbean.getC_qty();
                        pbean = pMgr.getProduct(cbean.getP_code());
                        %>
                        <%
                    }
                    unitPrice = pbean.getP_price();
                    totalPrice = unitPrice * o_qty;
                    sum += totalPrice;
                    countPart = goods.size();
                    %>
                    <tr>
                        <td>
                            <img alt="��ǰ����" src="../img/product/fus_main1.jpg">
                            <!-- <img alt="��ǰ����" src="${pageContext.request.contextPath}/img/product/<%=pbean.getP_main_pht_name()%>"> -->
                            </td>
                            <td>
                            	<a href="${pageContext.request.contextPath}/product/goods_view.jsp?goods=<%=pbean.getP_code()%>">
                            		<%=pbean.getP_name() %>
                            	</a>
                            </td>
                            <td name="tr_qty"><%=o_qty %>��</td>
                            <td>
                             <input type="hidden" value="<%=pbean.getP_code()%>" name="p_code">
                      		  <input type="hidden" value="<%=o_qty%>" name="o_qty">
                            </td>
                            <td name="tr_price"><%=UtilMgr.intFormat(totalPrice) %>��</td>
                            <td><input type="hidden" name="p_price" value="<%=totalPrice %>"></td>
                        </tr>
                        <%
                                }
                            %>
            </table>
        </section>



        <section id="order_member">
            <h3 class="order_subtitle">�ֹ��� ����</h3>
            <table class="verHead">

                <tr>
                <%
                    MemberBean mbean = mMgr.getMember(o_id);
                    
                    String mName = mbean.getNAME();
                    String mContact = mbean.getContact();
                    String mEmail = mbean.getEmail();
					                    
                %>
                        <th>������ ��</th>
                        <td><%=mName %></td>
                    </tr>
                    <tr>
                        <th>�޴��� </th>
                        <td><%=mContact%></td>
                    </tr>
                    <tr>
                        <th>�̸��� </th>
                        <td><%=mEmail%></td>
                    </tr>
                </table>

            </section>

                <section id="order_delivery">
                    <h3 class="order_subtitle">�������</h3>
                    <table class="verHead">
                            <%
                                Vector<OrderBean> olist = oMgr.getOrder(o_id);
                                OrderBean order = olist.get(0); //�ֱ� �ֹ� ���� 
                            %>
                        <tr>
                            <th>����ּ�</th>
                            <td>
                            <input type="text" id="o_recpt_zipcode"  name="o_recpt_zipcode" readonly	value="<%=order.getO_recpt_zipcode()%>">
							<input type="button" onclick="sample6_execDaumPostcode()" value="�����ȣ ã��"><br>
							<input type="text" id="o_recpt_add" name="o_recpt_add" readonly value="<%=order.getO_recpt_add()%>"><br>
							<input type="text" id="o_recpt_add_det" name="o_recpt_add_det" value="<%=order.getO_recpt_add_det()%>">
							<input type="text" id="sample6_extraAddress" placeholder="�����׸�">
							<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
							<script>
							    function sample6_execDaumPostcode() {
							        new daum.Postcode({
							            oncomplete: function(data) {
							                // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.
							
							                // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
							                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
							                var addr = ''; // �ּ� ����
							                var extraAddr = ''; // �����׸� ����
							
							                //����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
							                if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
							                    addr = data.roadAddress;
							                } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
							                    addr = data.jibunAddress;
							                }
							
							                // ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����׸��� �����Ѵ�.
							                if(data.userSelectedType === 'R'){
							                    // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
							                    // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
							                    if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
							                        extraAddr += data.bname;
							                    }
							                    // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
							                    if(data.buildingName !== '' && data.apartment === 'Y'){
							                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
							                    }
							                    // ǥ���� �����׸��� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
							                    if(extraAddr !== ''){
							                        extraAddr = ' (' + extraAddr + ')';
							                    }
							                    // ���յ� �����׸��� �ش� �ʵ忡 �ִ´�.
							                    document.getElementById("sample6_extraAddress").value = extraAddr;
							                
							                } else {
							                    document.getElementById("sample6_extraAddress").value = '';
							                }
							
							                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
							                document.getElementById('o_recpt_zipcode').value = data.zonecode;
							                document.getElementById("o_recpt_add").value = addr;
							                // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
							                document.getElementById("o_recpt_add_det").focus();
							            }
							        }).open();
							    }
							</script>
                            </td>
                        </tr>
                        <tr>
                            <th>������ �̸�</th>
                            <td><input name="o_recpt_name" 
                            value="<%=order.getO_recpt_name()%>"></td>
                        </tr>
                        <tr>
                            <th>�޴���</th>
                            <td><input name="o_recpt_contact"  value="<%=order.getO_recpt_contact()%>"></td>
                        </tr>
                        
                        <tr>
                            <th>��ۿ�û����</th>
                            <td><textarea name="o_del_msg" rows="5" cols="50"></textarea></td>
                        </tr>
                    </table>
                </section>

				<div id="point_price_wrapper">
	                <section id="order_point">
	                    <h3 class="order_subtitle">������</h3>
	                    <table class="verHead"> 
	                        <tr>
	                            <th>������ ����</th>
	                            <td><input placeholder="��밡���� ������ : 5000">��</td>
	                        </tr>
	                    </table>
	                </section>
	
	                <section id="order_pay">
	                    <h3 class="order_subtitle">�����ݾ�</h3>
	                    <table class="verHead">
	                        <tr>
	                            <th>��ǰ�ݾ�</th>
	                            <td>
	                            	<span id="o_prod_amount"><%=UtilMgr.intFormat(sum)%></span>��
	                            	<input type="hidden" name="o_prod_amount" value="<%=sum%>">
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>��ۺ�</th>
	                            <td>
	                            	<span id="o_del_fee"><%=UtilMgr.intFormat(shippingPrice)%></span>��
	                            	<input type="hidden" name="o_del_fee" value="<%=shippingPrice%>">
	                            </td>
	                            
	                        </tr>
	                        <tr>
	                            <th id="total_price_th">���������ݾ�</th>
	                            <td id="total_price_td">
  	                                <span id="o_total_amount"><%=UtilMgr.intFormat(sum+shippingPrice)%></span>��
  	                                <input type="hidden" name="o_total_amount" value="<%=sum+shippingPrice%>">
	                                <span id="total_point">(���� �� <%=UtilMgr.intFormat((int)(sum*pointRate))%>P ����)</span>
	                            </td>
	                        </tr>
	                        <!-- <tr>
	                            <td></td>
	                        </tr> -->
	                    </table>
	                </section>
				</div>

                <section id="order_howpay">
                    <h3 class="order_subtitle">��������</h3>
                    <table class="verHead">
                        <tr>
                            <th>�Ϲݰ��� &nbsp;&nbsp;&nbsp;</th>
                            <td> �ſ�ī��
	                            <input type="radio" class="radio" name="o_pay_method" value="�ſ�ī��" onclick='paymentMethod(this.value);' checked>
	                            &nbsp;&nbsp;&nbsp; �޴���
	                            <input type="radio" class="radio" name="o_pay_method" value="�޴���" onclick='paymentMethod(this.value);'>
                            </td>
                        </tr>
                        <tr id='tr1'>
                        	<td></td>
                            <td>
                                <select id="card">
                                    <option value="0">ī�带 �������ּ���.</option>
                                    <option value="1">����(������)</option>
                                    <option value="2">����</option>
                                    <option value="3">��</option>
                                    <option value="4">NH</option>
                                    <option value="5">�Ｚ</option>
                                </select>
                                <select id="installment">
                                    <option value="0">�Ͻú�</option>
                                    <option value="1">2���� �Һ�</option>
                                    <option value="2">3���� �Һ�</option>
                                    <option value="3">4���� �Һ�</option>
                                    <option value="4">5���� �Һ�</option>
                                    <option value="5">6���� �Һ�</option>
                                </select>
                            </td>
                        </tr>
                        <tr id='tr2' style="display:none">
                            <td></td>
                            <td><input name="cellphone1" size="13" placeholder="010-1234-1234"><td>
                        </tr>
                        <tr>
                            <th>������� &nbsp;&nbsp;&nbsp;</th>
                            <td>���̹� ����<input type="radio" class="radio" name="o_pay_method" value="���̹�����" onclick='paymentMethod(this.value);'></td>
                        </tr>
                    </table>
                </section>

                <section id="order_private">
                    <h3 class="order_subtitle">�������� ����/����*</h3>
                    <table class="verHead">
                       <!--  <tr>
                            <th>�������� ����/����*</th>
                        </tr> -->
                        <tr>
                            <th>
                            	<span>�������� �ʼ�����</span>
                            	<input class="checkbox" id="agreement" type="checkbox" value=1>
                            </th>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <th>�������� ����/�̿뵿��(�ʼ�)</th>
                            <th><a href="#">���Ȯ�� ></a></th>
                        </tr>
                        <tr>
                            <th>�������� ���� ��� ����(�ʼ�)</th>
                            <th><a href="#">���Ȯ�� ></a></th>
                        </tr>
                    </table>
                    <input type="hidden" name="o_id" id="order_id" value="<%=o_id%>">
                    <input type="hidden" name="o_status" value="<%=o_status%>">
                    <input type="hidden" name="countPart" value="<%=countPart%>">
                    <input type="hidden" name="mName" value="<%=mName%>">
                
                    <div class="order_btn_wrapper">
                        <input type="button" class="btn order_submit" 
                        value="�����ϱ�" onclick="location.href='javascript:agreement()'">
                        <script>
                        function agreement(){//��� �� ���ǽ� ����ȵ�. 
                    		var chk = document.getElementById("agreement");
                    		if(chk.checked){
                    			document.orderFrm.submit();
                    			}else{ 
                    			alert("����� �������ּ���.");
                    			return;
                    		}
                    	}
                        </script>
                    </div>
                </section>
            </form>
            


	</div>
</main>


</div>
<!--  #btn_mypage_wrapper (��ư�޴� + mypage) : mypage_side.jsp ���� ����-->
</div>
<!-- #main (��ܿ�� + ��ư + mypage) : mypage_side.jsp ���� ����-->
<%@ include file="../bottom.jsp"%>

<script type="text/javascript" src="js/order.js"></script>


</body>
</html>













