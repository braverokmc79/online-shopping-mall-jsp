<!-- goods_view.jsp -->
<%@page import="Product.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@page import="java.sql.Date"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="Product.ProductMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");
	int p_code = Integer.parseInt(request.getParameter("p_code"));
	ProductBean bean = mgr.getProduct(p_code);
%>
<html>
<head>
<!-- <title>-������-��ǰ ���</title>  -->
<script src="script.js"></script>
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

            <form name="frm" method="get" action="goods_Proc.jsp"
                enctype="multipart/form-data">
                <!-- enctype="multipart/form-data" �϶����� post������� ������. 
            ��ſ� action�� ���ؼ� action="productProc.jsp?flag=insert" �� ������Ѵ�.-->        
        
        		<!--  input hidden ���� flag �� �ѱ�� flag=update ���� ���� -->
        		<input type="hidden" value="update" name="flag">
        
        
        
                <h3 class="inner_title">�⺻����</h3>
                            <table class="mgr_table verHead">
        
                                <tr>
                                    <th>��ǰ�ڵ�</th>
                                    <td><input name="p_code" value="<%=bean.getP_code()%>" readonly>                                                            	
                                    <th>��ǰ��</th>
                                    <td><input name="p_name" value="<%=bean.getP_name()%>"></td>
                                </tr>
                                <tr>
                                    <th>��ǰ����</th>
                                    <td><input name="p_price" value="<%=bean.getP_price()%>">��</td>
                                
                                    <th>�Ǹſ���</th>
                                    <td>
                                    	<%if(bean.getP_on_sale()==1){%>
                                    	<input class="radio" type="radio" name="p_on_sale" value="1"checked>�Ǹ�
                                        <input class="radio" type="radio" name="p_on_sale" value="0" >�����
                                        <%}else{%>
                                        <input class="radio" type="radio" name="p_on_sale" value="1">�Ǹ�
                                        <input class="radio" type="radio" name="p_on_sale" value="0" checked>�����
                                        <%} %>
                                    </td>
                                </tr>						
                                <tr>
                                    <th>�����(1)</th>
                                    <td>
                                        <select name="rm_code1">
                                            <option value="" disabled selected>������</option>
                                            <option value=""></option>
                                        </select>
                                        <input class="" name="rm_percentage1" placeholder="������">%
                                    
                                    </td>
                                    
                                    <th>�����(2)</th>
                                    <td>
                                        <select name="rm_code2">
                                                <option value="" disabled selected>������</option>
                                                <option value=""></option>
                                        </select>
                                        <input name="rm_percentage2" placeholder="������">%
                                    </td>
                                </tr>
                                <tr>
                                    <th>�����(3)</th>
                                    <td>
                                        <select name="rm_code3">
                                                <option value="" disabled selected>������</option>
                                                <option value=""></option>
                                        </select>
                                        <input name="rm_percentage3" placeholder="������">%
                                    </td>                                
                                    <th>�����(4)</th>
                                    <td>
                                        <select name="rm_code4">
                                                <option value="" disabled selected>������</option>
                                                <option value=""></option>
                                        </select>
                                        <input name="rm_percentage4" placeholder="������">%
                                    </td>
                                </tr>
                            </table>
        
                <h3 class="inner_title">��������</h3>
                            <table class="mgr_table verHead" id="pht_table">
                                <tr>
                                    <th>�����̹���</th>
                                    <td><%=bean.getP_main_pht_name()%>
                                    <input type="file" name="upFile1" ></td>
                                </tr>
                                <tr>
                                    <th>�����̹���</th>                                                                    
                                    <td> <%=bean.getP_detail_pht_name()%>
                                    <input type="file" name="upFile2"></td>
                                </tr>
                                <tr>
                                    <th>���̹���</th>
                                    <td> <%=bean.getP_info_pht_name()%>
                                    <input type="file" name="upFile3"></td>
                                </tr>
                            </table>
                            

            <div class="submit_wrapper">
                <input class="btn" type="submit" value="�ۼ��Ϸ�">
                <input class="btn" type="submit" value="�����Ϸ�">
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
</html>