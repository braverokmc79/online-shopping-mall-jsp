<%@page import="admin.UtilMgr"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="bean" class="admin.StockBean"/>
<jsp:useBean id="amgr" class="admin.ProductMgr"/>
<jsp:useBean id="smgr" class ="admin.StockMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		
		int p_code = bean.getP_code();
		int st_enter_qty = bean.getSt_enter_qty();
		String st_exp_date = bean.getSt_exp_date();				
%>
 <html>
 <head>
 <style>
table {border: 1px solid; border-collapse:collapse; 
			width: 70%; text-align:center;}
td{border: 1px solid;}
thead{background:lightgray;}
</style>
 
 </head>
    <div>
 		<form name="searchfrm">
      
      			<h2>�԰���</h2>
      			<hr>
      			<p><select name="keyField" >
      			<option value="opcode">��ǰ�ڵ�</option>
      			<option value="opname">��ǰ�̸�</option>
      			</select>       			
      			<input name="keyWord"> 
      			<input type ="button" value="�˻�"  onClick="javascript:check()">
      			<input type ="hidden" name = "nowpage" value="1">
      			</p>      			 
    	  </form>
      </div>
      			<hr>
<form name="stfrm" method="get" action="goods_stockProc.jsp">
	  <div >			
				<p>��ǰ�� <input name ="p_name" ></p>
                <p>��ǰ�ڵ� <input name ="p_code" ></p> 						
                <p>���� <input name ="st_enter_qty"></p>
                <p>������� <input type="date" name ="st_exp_date"> </p>
            <input type="button" value="����" onClick="submitStock();"> 
      </div>
 </form>
    
 <hr>
 <h2>�˻����</h2>

 <div>
 	<form name="search_result_frm">
 <input type="button" value="�԰���">
 		
 		<table>
 			<tr>
	 			<th>��ȣ</th>
	 			<th>��ǰ�ڵ�</th>
	 			<th>��ǰ�̸�</th>
	 			<th>�԰����</th>
	 			<th>������</th>
	 			<th>������</th>
	 			<th>�����ϼ�</th>
	 			<th>�������</th>
 			</tr> 		
 			<% for(int i =1; i<10; i++){%> 			
 			<tr> 			
 			<td><%out.println(i);%></td>
 				<td></td>
 				<td></td>
 				<td></td>
 				<td></td>
 				<td></td>
 				<td></td>
 				<td></td> 				
 			</tr>
 				<%}%>
 		</table>
 	</form>
 
 

 </div>
 
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
