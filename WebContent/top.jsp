<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<link rel="stylesheet" href="css/reset.css">
		<link rel="stylesheet" href="css/top.css">
		<script src="https://kit.fontawesome.com/115bcf1f34.js" crossorigin="anonymous"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
		<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
	</head>
	<body>
	    <div id="modalDiv">
	        <div id="modalInnerFrame">
				<div id="modal_elements_wrapper">
					<label for="userPopup" id="modal_close_btn"><i class="fas fa-times"></i></label>
					<!-- modal_header : �α��� / ȸ������ ��ư-->
					<div id="modal_header">
						<input type="radio" id="login_btn" class="login_signup_btns" name="login_signup_btns" onclick="login_signup('login')" checked>
						<label for="login_btn" id="login_btn_label" class="login_signup_btns_label" >&nbsp�α���&nbsp</label>
						<span id="modal_header_span">&nbsp|&nbsp</span>
						<input type="radio" id="signup_btn" class="login_signup_btns" name="login_signup_btns" onclick="login_signup('signup')">
						<label for="signup_btn" id="signup_btn_label" class="login_signup_btns_label">ȸ������</label>
					</div>
					<form method="POST" id="login_form" action="#">
						<h3>�α���</h3>
						<input type="text" id="login_id_input" class="login_input" name="id" placeholder="���̵� �Է����ּ���." autocomplete="off">
						<input type="password" id="login_pwd_input" class="login_input" name="pwd" placeholder="��й�ȣ�� �Է����ּ���."autocomplete="off">
						<div id="lost_id_pwd_wrapper">
							<a href="#">���̵� ã��</a>
							<span>|</span>
							<a href="#">��й�ȣ ã��</a>
						</div>
						<button type="submit" id="login_submit_btn">
							<span>�α���</span>
						</button>
					</form>
					<form method="POST" id="signup_form" action="#">
						<h3>ȸ������</h3>
						<table>
							<tr>
								<td>
									<span>���̵�</span>
								</td>
								<td>
									<input type="text" autocomplete="off">
									<button><span>�ߺ�Ȯ��</span></button>
								</td>
							</tr>
							<tr>
								<td>
									<span>��й�ȣ</span>
								</td>
								<td>
									<input type="text" autocomplete="off">
								</td>
							</tr>
							<tr>
								<td>
									<span>��й�ȣȮ��</span>
								</td>
								<td>
									<input type="text" autocomplete="off">
								</td>
							</tr>
							<tr>
								<td>
									<span>�̸�</span>
								</td>
								<td>
									<input type="text" autocomplete="off">
								</td>
							</tr>
							<tr>
								<td>
									<span>�������</span>
								</td>
								<td>
									<div>
										<input type="text" autocomplete="off">
										<input type="text" autocomplete="off">
										<input type="text" autocomplete="off">
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<span>�̸���</span>
								</td>
								<td>
									<input type="text" autocomplete="off">
								</td>
							</tr>
							<tr>
								<td>
									<span>����ó</span>
								</td>
								<td>
									<input type="text" autocomplete="off">
								</td>
							</tr>
							<tr>
								<td>
									<span>�ּ�</span>
								</td>
								<td>
									<buttton><span>�ּ� �˻�</span></buttton>
									<input type="text" autocomplete="off">
									<input type="text" autocomplete="off">
								</td>
							</tr>
						</table>
					</form>
				</div>
	        </div>
	        <label for="userPopup"></label>
	    </div>
	    <!--��ü ������ Wrapper-->
	    <div id="top_wrapper">
	        <!--header Lapper(�ΰ� ��� Div(�߰� Contents ����), Hompage Logo)-->
	        <div id="header">
	            <!--ADD CONTENTS-->
	            <div id="headerTopMenu">
	                <!--�ʿ�� ����-->
	            </div>
	            <!--�ΰ� �̹��� Div-->
	            <div id="homeLogo">
	                <img src="img/breadLogo.jpg" alt="�̹��� �ε� �Ұ�!">
	                <!--LOGO-->
	            </div>
	            <div id="search_div">
	                <form action="" id="search_form">
	                    <label>
	                        <input type="text" id="search_input" placeholder="��ǰ�� �Է��ϼ���" autocomplete=��off��>
	                        <i class="fas fa-search"></i>
	                    </label>
	                </form>
	            </div>
	            
	        </div>
	        <!--�޴� �׺���̼�(sticky)-->
	        <div id="menuNav">
	            <!--nav ���� :2���� �����̵� �޴�, �Ż�ǰ, �˶����, �̺�Ʈ, �˻�â(search icon), shopping icon(��ٱ���)-->
	            <div id="nav_Div">
	                <ul class="nav_main">
	                    <li id="nav_start">
	                        <a class="nav_a" id="breadNav">
	                            <i class="fas fa-bars"></i>
	                            <span class="txt">��</span>
	                        </a>
	                    </li>
	                    <li>
	                        <a class="nav_a">
	                            <span class="txt">����Ʈ</span>
	                        </a>
	                    </li>
	                    <li>
	                        <a class="nav_a">
	                            <span class="txt">�Ż�ǰ</span>
	                        </a>
	                    </li>
	                    <li>
	                        <a class="nav_a">
	                            <span class="txt">�̺�Ʈ</span>
	                        </a>
	                    </li>
	                    <li>
	                        <a class="nav_a">
	                            <span class="txt">������</span>
	                        </a>    
	                    </li> 
	                </ul>
	                <i class="fas fa-shopping-cart"></i>
	                <input type="checkbox" id="userPopup">
					<label for="userPopup" id="userPopup_label">
						<i class="fas fa-user"></i>
					</label>
	            </div>
	            <div id="ricecake_sub">
	                <!--�� slide menu �ر⺻�Ӽ� display none-->
	            </div>
	        </div>
	</div>
	<script type="text/javascript" src="js/top.js"></script>
	</body>
</html>