<%@page import="admin.NoticeBean"%>
<%@page import="admin.UtilMgr"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="admin.AdminMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		int n_index = UtilMgr.parseInt(request, "n_index");
		String nowPage = request.getParameter("nowPage");
		String keyField = request.getParameter("keyField");
		String keyWord = request.getParameter("keyWord");
		String numPerPage = request.getParameter("numPerPage");	
		NoticeBean bean = mgr.getNotice(n_index);
		String n_id = bean.getN_id();
		String n_file_name = bean.getN_file_name();
		int n_file_size = bean.getN_file_size();
		//���ǿ� �о�� �Խù��� ���� : ����, ����, �亯
		session.setAttribute("bean", bean);
%>
<html>
<head>

<style>
table {border: 1px solid; border-collapse:collapse; 
			width: 70%; text-align:center;}
td{border: 1px solid;}
thead{background:lightgray;}
</style>

<script type="text/javascript">
	function down(n_file_name) {
		document.downFrm.n_file_name.value=n_file_name;
		document.downFrm.submit();
	}
	
	function list() {
		document.listFrm.action="notice_list.jsp";
		document.listFrm.submit();
		
	}
</script>

</head>

<body>
<h2>��������</h2>
<hr>
			<form name="Frm" method="post" action="notice_update.jsp" 
			enctype="multipart/form=data">			
			<input type= "hidden" name = num value=<%=bean.getN_index()%>>
			
				
				<table> 
					<tr> 
						<td>�ۼ���</td>
						<%if(n_id.equals("m1") || n_id.equals("m2") || n_id.equals("m3")){ %>
						<td>������</td><%}else{%>
						<td>�����ھƴ�</td><%} %>					
					</tr>
					<tr>
						<td>�ۼ���¥</td>
						<td><%=bean.getN_date()%></td>
					</tr>		
					<tr> 
						<td> �� ��</td>
					    <td><%=bean.getN_title()%></td>
					</tr>
					<tr> 
						<td> ī�װ���</td>
					    <td><%=bean.getN_category()%></td>
					</tr>
					
					 <tr>
					 	<td>����</td> 
						<td><img src="img/notice/<%=n_file_name%>">
						<br/><%=bean.getN_content()%></td>
					</tr>
				</table>								 
								  
					<input type="button" value="����Ʈ" onclick="location.href ='notice_list.jsp'">
								
			</form>

<form name="downFrm" action="download.jsp" method="post">
	<input type="hidden" name="n_file_name">
</form>
<form name="listFrm" >
	<input type="hidden" action="nowPage" value="<%=nowPage%>">
	<input type="hidden" namex="numPerPage" value="<%=numPerPage%>">
	<%if(!(keyWord==null||keyWord.equals(""))){ %>
	<input type="hidden" action="keyWord" value="<%=keyWord%>">
	<input type="hidden" name="keyField" value="<%=keyField%>">
	<%} %>
</form>
</body>
</html>