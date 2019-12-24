<%@page import="admin.UtilMgr"%>
<%@page import="product.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="bean" class="admin.StockBean"/>
<jsp:useBean id="amgr" class="admin.ProductMgr"/>
<jsp:useBean id="smgr" class ="admin.StockMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		int totalRecord = 0;//�ѰԽù� ����
		int numPerPage = 10;//�������� ���ڵ� ���� (5,10,15,30)
		int pagePerBlock = 15;//���� ������ ����
		int totalPage = 0;//�� ������ ����
		int totalBlock = 0;//�� �� ����
		int nowPage = 1;//���� ������
		int nowBlock = 1;//���� ��
		
		//page�� ������ �Խù� ������
		if(request.getParameter("numPerPage")!=null&&
		!request.getParameter("numPerPage").equals("null")){
		numPerPage = UtilMgr.parseInt(request, "numPerPage");
	}		
		int start = 0;//���̺� ���� ��ȣ
		int cnt = numPerPage;
				
		//�˻��� �ʿ��� ����
		String keyField = "" , keyWord = "";
				
		//�˻��϶� 
		if(request.getParameter("keyWord")!=null){
		keyField = request.getParameter("keyField");
		keyWord = request.getParameter("keyWord");
	}
				
		//�˻� �Ŀ� �ٽ� ó��ȭ������ ��û
		if(request.getParameter("reload")!=null&&
		request.getParameter("reload").equals("true")){
		keyField = "";  keyWord = "";
	}
		totalRecord = smgr.getTotalCount(keyField, keyWord);

		//nowPage�� ��û�� ���
		if(request.getParameter("nowPage")!=null){
					nowPage = UtilMgr.parseInt(request, "nowPage");
	}
		//���̺� ���� ��ȣ
		start = (nowPage*numPerPage)-numPerPage;
				
		//��ü�������� (��ü���ڵ尳��/�������� ���ڵ� ����) �ø�.
		 totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
		//��ü���� (��ü��������/���� ������ ����) �ø�.
		 totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);
		//����� (������������/���� ������ ����) �ø�.
		 nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock);
		
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
 <form name="stfrm" method="get" action="goods_stockProc.jsp">
      <div >
      			<h2>�԰���</h2>
      			<hr>
      			<p><select name="opList" onchange ="opSelect()">
      			<option value="opcode">��ǰ�ڵ�</option>
      			<option value="opname">��ǰ�̸�</option>
      			</select>       			
      			<input type ="search" name="sname"> 
      			<input type ="button" value="�˻�" ></p> 
      			<hr>
				<p>��ǰ�� <input name ="p_name" ></p>
                <p>��ǰ�ڵ� <input name ="p_code" ></p> 						
                <p>���� <input name ="st_enter_qty"></p>
                <p>������� <input type="date" name ="st_exp_date"> </p>
            <input type="button" value="����" onClick="submitStock();"> 
      </div>
 </form>
    </div>
 <hr>
 <h2>�˻����</h2>

 <div>
 	<form name="searchfrm">
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
 			<tr>
 			<%for(int i=1; i<10; i++){ %>
 				<td><%out.println(i);%></td>
 				<td></td>
 				<td></td>
 				<td></td>
 				<td></td>
 				<td></td>
 				<td></td>
 				<td></td>
 			</tr>
 				<%} %>
 		</table>
 	</form>
 
 <form name="readFrm">
	<input type="hidden" name="num">
	<input type="hidden" name="nowPage" value="<%=nowPage%>">
	<input type="hidden" name="keyField" value="<%=keyField%>">
	<input type="hidden" name="keyWord" value="<%=keyWord%>">
	<input type="hidden" name="numPerPage" value="<%=numPerPage%>">
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
      </script>

</html>
