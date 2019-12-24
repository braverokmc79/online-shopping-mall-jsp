<!-- list.jsp -->
<%@page import="admin.NoticeBean"%>
<%@page import="admin.UtilMgr2"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mgr" class="admin.AdminMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		int totalRecord = 0;//�ѰԽù� ����
		int numPerPage = 10;//�������� ���ڵ� ���� (5,10,15,30)
		int pagePerBlock = 15;//���� ������ ����
		int totalPage = 0;//�� ������ ����
		int totalBlock = 0;//�� �� ����
		int nowPage = 1;//���� ������
		int nowBlock = 1;//���� ��
		
		//page�� ������ �Խù� ���� ��
		if(request.getParameter("numPerPage")!=null&&
				!request.getParameter("numPerPage").equals("null")){
			numPerPage = UtilMgr2.parseInt(request, "numPerPage");
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
		
		totalRecord = mgr.getTotalCount(keyField, keyWord);
		//out.print(totalRecord);
		
		//nowPage�� ��û�� ���
		if(request.getParameter("nowPage")!=null){
			nowPage = UtilMgr2.parseInt(request, "nowPage");
		}
		//���̺� ���� ��ȣ
		start = (nowPage*numPerPage)-numPerPage;
		
		//��ü�������� (��ü���ڵ尳��/�������� ���ڵ� ����) �ø�.
		 totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
		//��ü���� (��ü��������/���� ������ ����) �ø�.
		 totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);
		//����� (������������/���� ������ ����) �ø�.
		nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock);
 %>
<html>
<head>
<title>
</title>
<script type="text/javascript">
	function check() {
		if(document.searchFrm.keyWord.value==""){
			alert("�˻�� �Է��ϼ���.");
			document.searchFrm.keyWord.focus();
			return;
		}
		document.searchFrm.submit();
	}
	
	function list() {
		document.listFrm.action = "notice_list.jsp";
		document.listFrm.submit();
	}
	
	function numPerFn(numPerPage) {
		document.readFrm.numPerPage.value=numPerPage;
		document.readFrm.submit();
	}
	
	function read(num) {
		document.readFrm.num.value = num;
		document.readFrm.action = "notice_view.jsp";
		document.readFrm.submit();
	}
	
	function block(block) {
		document.readFrm.nowPage.value = 
			<%=pagePerBlock%>*(block-1)+1;
		document.readFrm.submit();	
	}
	
	function pageing(page) {
		document.readFrm.nowPage.value = page;
		document.readFrm.submit();	
	}
</script>
</head>
<body >
<div>
<h2>��������</h2>
<hr/>
<table>
	<tr>
		<td align="center" colspan="2">
		<%
				Vector<NoticeBean> vlist = mgr.getBoardList(keyField, keyWord, start, cnt);
				int listSize = vlist.size();//������ ȭ�鿡 ǥ�õ� �Խù� ��ȣ
				if(vlist.isEmpty()){
					out.println("��ϵ� �Խù��� �����ϴ�.");
				}else{
		%>
		<table cellspacing="0">
			<tr align="center" bgcolor="#D0D0D0">
				<td width="100">�� ȣ</td>
				<td width="250">�� ��</td>
				<td width="100">�� ��</td>
				<td width="150">�� ¥</td>
				<td width="100">��ȸ��</td>
			</tr>
		<%
				for(int i=0;i<numPerPage;i++){
					if(i==listSize) break; //���� ������ �������� 10�� �ƴ� ���
					NoticeBean bean = vlist.get(i);
					int n_index = bean.getN_index ();
					String n_id = bean.getN_id();
					String n_category = bean.getN_category ();
					String n_title = bean.getN_title();
					String n_content = bean.getN_content ();
					String n_date = bean.getN_date();
					String n_file_name = bean.getN_file_name ();
					int n_file_size = bean.getN_file_size();
		%>
		
		<%}//---for%>	
		</table>
		<%}//----if-else%>	
		</td>
	</tr>
	<tr>
		<td colspan="2"><br/><br/></td>
	</tr>
	<tr>
		<td >
		<%if(totalPage>0){ %>
			<!-- ���� �� -->
			<%if(nowBlock>1){%>
				<a href="javascript:block('<%=nowBlock-1%>')">prev...</a>
			<%}%>
			<!-- ����¡ -->
			<% 
					int pageStart = (nowBlock-1)*pagePerBlock+1;
					int pageEnd = (pageStart+pagePerBlock)<totalPage?
							pageStart+pagePerBlock:totalPage+1;
					for(;pageStart<pageEnd;pageStart++){
			%>
				<a href="javascript:pageing('<%=pageStart%>')">
				<%if(pageStart==nowPage){%><font color="red"><%}%>
					[<%=pageStart%>]
				<%if(pageStart==nowPage){%></font><%}%>
				</a>
			<%}//---for%>
			<!-- ���� �� -->
			<%if(totalBlock>nowBlock){%>
				<a href="javascript:block('<%=nowBlock+1%>')">...next</a>
			<%}%>
		<%}%>
		</td>
		<td align="right">
			<a href="notice_post.jsp">[�۾���]</a>
			<a href="javascript:list()">[ó������]</a>
		</td>
	</tr>
</table>
<form name="listFrm" method="post">
	<input type="hidden" name="reload" value="true">
	<input type="hidden" name="nowPage" value="1">
</form>
<form  name="searchFrm">
	<table  width="600" cellpadding="4" cellspacing="0">
 		<tr>
  			<td align="center" valign="bottom">
   				<select name="keyField" size="1" >
    				<option value="subject"> �� ��</option>
    				<option value="content"> �� ��</option>
   				</select>
   				<input size="16" name="keyWord">
   				<input type="button"  value="ã��" onClick="javascript:check()">
   				<input type="hidden" name="nowPage" value="1">
  			</td>
 		</tr>
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
</body>
</html>
