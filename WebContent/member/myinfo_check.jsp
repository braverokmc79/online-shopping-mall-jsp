<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>


<%@ include file="../top.jsp" %>

	<%@ include file="../order/mypage_side.jsp"%> 

		<div id="mypage">

			<h1 class="title">���� ���� ����</h1>
			
			<!-- <div class="conf_pw">  -->
				<form name="confirmForm" method="post" action="myinfo_check_Proc.jsp">
					
						<!-- <input type="text" id="login_id_input" class="login_input" name="id" placeholder="���̵� �Է����ּ���." > -->
						<span>��й�ȣ Ȯ��</span>
						<input type="password" id="login_pwd_input" class="login_input" name="pwd" placeholder="��й�ȣ�� �Է����ּ���.">
					
					<div class="group_btn">

						<input type="submit" class="btn btn_positive" value="Ȯ��">
					</div>
				</form>
			<!-- </div>  -->
		</div>
	</div> <!--  #btn_mypage_wrapper (��ư�޴� + mypage) : mypage_side.jsp ���� ����-->
	</div> <!-- #main (��ܿ�� + ��ư + mypage) : mypage_side.jsp ���� ����-->
	<%@ include file="../bottom.jsp" %>
</body>
</html>
	