<%@page import="admin.UtilMgr"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
	<jsp:useBean id="bean" class="admin.StockBean"/>
	<jsp:useBean id="amgr" class="admin.ProductMgr"/>
	<jsp:useBean id="smgr" class ="admin.StockMgr"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/select/1.3.1/js/dataTables.select.min.js"></script>
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/buttons/1.6.1/js/dataTables.buttons.min.js"></script>
	<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css">
	<link rel="stylesheet" type="text/css" href="./css/goods_stock.css">
	

		
<%
	request.setCharacterEncoding("EUC-KR");
	
	int p_code = bean.getP_code();
	int st_enter_qty = bean.getSt_enter_qty	();
	String st_exp_date = bean.getSt_exp_date();				
%>
 <html>
 <head> 
 </head>
 <!-- ��� -->
 <div id="modalDiv2">
    <div id="modalInnerFrame2">
      <div id="modal_elements_wrapper2">
	     <div id="modal__div">
	     	<input type="hidden" id="modal_code">
      		<span>��ǰ�� :</span>
      		<input type="text" class="signup_input signup_long_input" id="modal_name" readonly="readonly">
	     </div>
	     <div id="modal_enter_div">
      		<span>�԰���� :</span>
      		<input type="text" class="signup_input signup_long_input" id="modal_enter">
	      </div>
	      <div id="modal_ava_div">
      		<span>������ :</span>
      		<input type="text" class="signup_input signup_long_input" id="modal_ava">
	      </div>
	      <div id="modal_waste_div">
      		<span>������ :</span>
      		<input type="text" class="signup_input signup_long_input" id="modal_waste">
	      </div>
	      <div id="modal_date_div">
      		<span>�԰��� :</span>
      		<input type="date" class="signup_input signup_long_input" id="modal_date" readonly="readonly">
	      </div>
	      <div>
	      	<button type="button" id="modal_update_btn">��ǰ����</button>
	      	<button type="button" id="modal_close_btn">�������</button>
	      </div>
   	</div>
   </div>
</div>
 <!-- ���� ������ -->
    <div>
 		<form name="searchfrm">
      			<h2>�԰���</h2>
      			<hr>
      			<p><select name="keyField" id="search_type" >	
	      			<option value="code">��ǰ�ڵ�</option>
	      			<option value="name">��ǰ�̸�</option>
      			</select>       			
      			<input name="keyWord"  id="product_search" autocomplete=��off��> 
      			<input type ="button" value="�˻�"  onClick="javascript:check()">
      			<input type ="hidden" name = "nowpage" value="1">
      			</p>      			 
    	  </form>
      </div>
      <hr>
	  <form name="stfrm" method="get"  action="goods_stockProc.jsp">
	  <div>			
			<p>��ǰ�� <input name ="p_name" id="stfrm_name" ></p>
            <p>��ǰ�ڵ� <input name ="p_code" id="stfrm_code" ></p> 						
            <p>���� <input name ="st_enter_qty"></p>
            <p>������� <input type="date" name ="st_exp_date"> </p>
            <input type="button" value="����" onClick="submitStock();"> 
      </div>
 </form>
    
 <hr>
 <h2>�˻����</h2>
 <label>
 <input type="checkbox" id="waste_qty_include"> ��� ��ǰ ����
</label>
<input type="button" id="stock_delete_btn" value="���� ���">
<input type="button" id="stock_update_btn" value="��ǰ ����">

<input type="hidden" id="selected_data" value="">
 <div>
	<form name="search_result_frm" id="stock_form">
		 <input type="button" value="�԰���">
		<table id="stock_table" class="cell-border hover nowrap order-column cell-border ">
			<thead>
				<tr id="judgeRow">
		 			<th>��ȣ</th>
		 			<th>��ǰ�ڵ�</th>
		 			<th>��ǰ�̸�</th>
		 			<th>�԰����</th>
		 			<th>������</th>
		 			<th>������</th>
		 			<th>�����ϼ�</th>
		 			<th>�������</th>
	 			</tr> 		
			</thead>
		</table>
	</form>
 

 </div>
 <script src="./js/goods_stock.js"></script>
    <script type="text/javascript">      
	function submitStock() {
       	f=document.stfrm;
       	alert("����Ǿ����ϴ�.");
       	f.submit();
        };      
     function opSelect(){
    	 f=document.stfrm;
    	 pl = f.opList;
    	 f.sname.name=pl.options[pl.selectedIndex].value;    		 
     }
     function check() {
 		if(document.searchFrm.keyWord.value==""){
 			alert("�˻�� �Է��ϼ���.");
 			document.searchFrm.keyWord.focus();
 			return;
 		}
 		document.searchFrm.submit();
 	}    
      </script>

</html>
