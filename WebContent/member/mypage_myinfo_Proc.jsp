<%@ page contentType="text/html;charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mMgr" class="Member.MemberMgr" />
<jsp:useBean id="mBean" class="Member.MemberBean" />
<jsp:setProperty name="mBean" property="*" />
<%
boolean flag = mMgr.updateMember(mBean);
String id = request.getParameter("id");
if(flag){%>
	<script>
		alert("회원정보가 수정되었습니다.");
		location.href="index.jsp";

	</script>
<%}else{%>
	<script>
		alert("수정도중 에러가 발생하였습니다.");
		history.back();
	</script>
<%}%>

