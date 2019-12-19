<!-- goods_view.jsp -->
<%@page import="product.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@page import="java.sql.Date"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="product.ProductMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");
	int p_code = Integer.parseInt(request.getParameter("p_code"));
	ProductBean bean = mgr.getProduct(p_code);
%>
<html>
<head>
<!-- <title>-������-��ǰ ���</title>  -->



</head>
<body topmargin="100">	

<!-- <title>-������-��ǰ ���</title> -->

<!-- <link rel="stylesheet" type="text/css" href="./css/mypage_orderlist.css"> -->
<jsp:include page="../top.jsp"/>

	<jsp:include page="./admin_side.jsp"/>

<!--------------->
<!--  �۾� ����  -->
<!--------------->
	
        <div id="manager">  
        
            <h1 class="title">��ǰ ����</h1>

            <form name="frm" method="post" action="goods_Proc.jsp?flag=update"
                enctype="multipart/form-data" >
                <!-- enctype="multipart/form-data" �϶����� post������� ������. 
            ��ſ� action�� ���ؼ� action="productProc.jsp?flag=insert" �� ������Ѵ�.-->        
        
        		<!--  input hidden ���� flag �� �ѱ�� flag=update ���� ���� 
        		<input type="hidden" value="update" name="flag">	-->
        
        
        
                <h3 class="inner_title">�⺻����</h3>
                
                <input type="button" id="chgread1" value="����¸�����">
                
                            <table class="mgr_table verHead">
        
                                <tr>
                                    <th>��ǰ�ڵ�</th>
                                    <td><input name="p_code" value="<%=bean.getP_code()%>" readonly>                                                            	
                                    <th>��ǰ��</th>
                                    <td><input class="1 readChange" name="p_name" value="<%=bean.getP_name()%>" readonly></td>
                                </tr>
                                <tr>
                                    <th>��ǰ����</th>
                                    <td><input class="2 readChange" name="p_price" value="<%=bean.getP_price()%>" readonly>��</td>
                                
                                    <th>�Ǹſ���</th>
                                    <td>
                                    	<%if(bean.getP_on_sale()==1){%>
                                    	<input  class="radio" type="radio" name="p_on_sale" value="1"checked readonly>�Ǹ�
                                        <input  class="radio" type="radio" name="p_on_sale" value="0" readonly>�����
                                        <%}else{%>
                                        <input  class="radio" type="radio" name="p_on_sale" value="1" readonly>�Ǹ�
                                        <input  class="radio" type="radio" name="p_on_sale" value="0" checked readonly>�����
                                        <%} %>
                                    </td>
                                </tr>						
                                <tr>
                                    <th>�����(1)</th>
                                    <td>
                                        <select name="rm_code1" >
                                            <option value="" disabled selected>������</option>
                                            <option value=""></option>
                                        </select>
                                        <input class="5 readChange rm_pct" name="rm_percentage1" placeholder="������" readonly>%
                                    
                                    </td>
                                    
                                    <th>�����(2)</th>
                                    <td>
                                        <select name="rm_code2">
                                                <option value="" disabled selected>������</option>
                                                <option value=""></option>
                                        </select>
                                        <input class="6 readChange rm_pct" name="rm_percentage2" placeholder="������" readonly>%
                                    </td>
                                </tr>
                                <tr>
                                    <th>�����(3)</th>
                                    <td>
                                        <select name="rm_code3">
                                                <option value="" disabled selected>������</option>
                                                <option value=""></option>
                                        </select>
                                        <input class="7 readChange rm_pct" name="rm_percentage3" placeholder="������" readonly>%
                                    </td>                                
                                    <th>�����(4)</th>
                                    <td>
                                        <select name="rm_code4">
                                                <option value="" disabled selected>������</option>
                                                <option value=""></option>
                                        </select>
                                        <input class="8 readChange rm_pct" name="rm_percentage4" placeholder="������" readonly>%
                                    </td>
                                </tr>
                            </table>
        
                <h3 class="inner_title">��������</h3>
                            <table class="mgr_table verHead" id="pht_table">
                                <tr>
                                    <th>�����̹���</th>
                                    <td><%=bean.getP_main_pht_name()%>
                                    <input class="9 readChange" type="file" name="upFile1" readonly></td>
                                </tr>
                                <tr>
                                    <th>�����̹���</th>                                                                    
                                    <td> <%=bean.getP_detail_pht_name()%>
                                    <input class="10 readChange" type="file" name="upFile2" readonly></td>
                                </tr>
                                <tr>
                                    <th>���̹���</th>
                                    <td> <%=bean.getP_info_pht_name()%>
                                    <input class="11 readChange" type="file" name="upFile3" readonly></td>
                                </tr>
                            </table>
                            

            <div class="submit_wrapper">
                <input class="btn" type="button" value="�������" onclick="location.href='goods_master.jsp'">
                <input class="btn" type="submit" value="�����Ϸ�" >
                <input class="btn" type="reset" value="�ٽþ���">
            </div>
            </form>        
        </div>		
<!----------------->
<!--  �۾� ���� �� -->
<!----------------->
	
</div> <!--  #btn_manager_wrapper (��ư�޴� + manager) : admin_side.jsp ���� ����-->
</div> <!-- #main (��ܿ�� + ��ư + manager) : admin_side.jsp ���� ����-->
	<jsp:include page="../bottom.jsp"/>
</body>

<script>
	window.onload = function(){
		function btnInit(){
			const button = document.querySelector('#chgread1');
			let flag = 0;
			button.addEventListener('click', function(){
				const reads = document.querySelectorAll('.readChange');
				if(flag===0){
					console.log("DDD");
					reads.forEach(function(items){
						items.readOnly = false;
					});
					flag = 1;
					button.value = '����¸� �ǽ�';
					console.log(button);
				}else{
					reads.forEach(function(items){
						items.readOnly = true;
					});
					flag = 0;
					console.log("FFF");
					button.value = '����¸� ����';
					console.log(button);
				}
			});
		}
		btnInit();
	}
</script>
</html>