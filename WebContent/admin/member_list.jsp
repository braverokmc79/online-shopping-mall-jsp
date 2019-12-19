<%@page import="Member.MemberBean"%>
<%@page import="java.util.Vector"%>
<%@page import="admin.UtilMgr"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mMgr" class="Member.MemberMgr"/>
<jsp:useBean id="aMgr" class="admin.AdminMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");
	int totalRecord = 0;
	int numPerPage = 5;
	int pagePerBlock = 10;
	int totalPage = 10;
	int totalBlock = 0;
	int nowPage = 1;
	int nowBlock= 1;
	
	if(request.getParameter("numPerPage")!=null&&!request.getParameter("numPerPage").equals("null")){
		numPerPage = UtilMgr.parseInt(request, "numPerPage");
	}
	
	int start = 0;
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
			
			totalRecord = aMgr.getTotalCount(keyField, keyWord);
			//out.print(totalRecord);
			
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

%>
<html>
<head>
</head>
<body>
			<h2>ȸ������</h2>
			<hr>
			<h3>ȸ������ �˻�</h3>
		<table border="1">
			<tr>
				<th>�˻���</th>
				<td>
					<select>
					<option value ="1">ID</option>
					<option value ="2">�̸�</option>
					<option value ="3">email</option>
					<option value ="4">ȸ��������...</option>
					</select>
					<input id="search">
					<input id="search_btn" type="button" value="�˻�">
				</td>
			</tr>
		</table>
			<h3>ȸ������LIST</h3>
		<%Vector<MemberBean> vlist = mMgr.getMemberList();%>
		<table border="1">
		<tr align="center"> 
			<th>ID</th>
			<th>�̸�</th>
			<th>�������</th>
			<th>�̸���</th> 
			<th>����ó</th> 
			<th>�����ȣ</th>
			<th>�ּ�</th>
			<th>���ּ�</th>
			<th>������</th>
		</tr>
		<%
			for(int i=0; i<vlist.size(); i++){
				MemberBean mBean = vlist.get(i);
		%>
		<tr>
			<td><%=mBean.getId()%></td>
			<td><%=mBean.getNAME()%></td>
			<td><%=mBean.getBirthday()%></td>
			<td><%=mBean.getEmail() %></td>
			<td><%=mBean.getContact() %></td>
			<td><%=mBean.getZipcode() %></td>
			<td><%=mBean.getAddress()%></td>
			<td><%=mBean.getAddress_detail() %></td>
			<td><%=mBean.getJoin_date()%></td>
		</tr>
		<%}//---for%>
		</table>
</body>
</html>