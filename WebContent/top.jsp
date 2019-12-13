<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
%>
<!--<!DOCTYPE html>
<html>
	<head>-->
		<meta charset="EUC-KR">
		<link rel="stylesheet" type="text/css" href="css/reset.css">
		<link rel="stylesheet" href="css/top.css">
		<script src="https://kit.fontawesome.com/115bcf1f34.js" crossorigin="anonymous"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
		<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <!--</head>
	<body> -->
	    <div id="modalDiv">
	        <div id="modalInnerFrame">
				<div id="modal_elements_wrapper">
					<!-- modal_header : �α��� / ȸ������ ��ư-->
					<div id="modal_header">
						<input type="radio" id="login_btn" class="login_signup_btns" name="login_signup_btns" onclick="login_signup('login')" checked>
						<label for="login_btn" id="login_btn_label" class="login_signup_btns_label" >&nbsp�α���&nbsp</label>
						<span id="modal_header_span">&nbsp&nbsp&nbsp&nbsp&nbsp</span>
						<input type="radio" id="signup_btn" class="login_signup_btns" name="login_signup_btns" onclick="login_signup('signup')">
						<label for="signup_btn" id="signup_btn_label" class="login_signup_btns_label">ȸ������</label>
					</div>
					<form method="POST" id="login_form" action="#">
						<h3>�������!</h3>
						<input type="text" id="login_id_input" class="login_input" name="id" placeholder="���̵� �Է����ּ���." autocomplete="off">
						<input type="password" id="login_pwd_input" class="login_input" name="pwd" placeholder="��й�ȣ�� �Է����ּ���."autocomplete="off">
						<div id="lost_id_pwd_wrapper">
							<a href="#">���̵� ��й�ȣ�� �ؾ���Ƚ��ϱ�?</a>
						</div>
						<button type="submit" class="top_modal_button top_modal_button_style" id="login_submit_btn">
							<span>�α���</span>
						</button>
					</form>
					<form method="POST" id="signup_form" action="#">
						<h3>ó���̼���?</h3>
						<div id="id_section">
							<input type="text" class="signup_input" id="id_section_input" autocomplete="off" placeholder="���̵� �Է��ϼ���.">
							<!-- ajax �ʿ� ?-->
							<button type="button" class="signup_util_btn top_modal_button_style top_modal_button" id="id_section_btn"><span>�ߺ�Ȯ��</span></button>
						</div>
						<input type="password" class="signup_input" id="signup_pwd"autocomplete="off" placeholder="��й�ȣ�� �Է��ϼ���.">
						<input type="password" class="signup_input" id="signup_pwd_check" autocomplete="off" placeholder="��й�ȣ�� �ѹ� �� �Է��ϼ���.">
						<input type="text" class="signup_input" id="signup_name" autocomplete="off" placeholder="�̸��� �Է��ϼ���.">
						<input type="text" class="signup_input" id="signup_birth" autocomplete="off" placeholder="��������� �Է��ϼ���.">
						<input type="text" class="signup_input" id="signup_email" autocomplete="off" placeholder="�̸����� �Է��ϼ���.">
						<input type="text" class="signup_input" id="signup_phone" autocomplete="off" placeholder="����ó�� �Է��ϼ���.">
						<div id="address_section">
							<div id ="address_section_header">
								<input type="text" class="signup_input" id="address_section_zipcode" autocomplete="off" readonly tabindex="-1" placeholder="�����ȣ">
								<button class="signup_util_btn top_modal_button_style top_modal_button" id="address_section_btn"><span>�ּҰ˻�</span></button><br/>
							</div>
							<input type="text" class="signup_input" autocomplete="off" id="signup_addr" readonly tabindex="-1" placeholder="�ּ�">
							<input type="text" class="signup_input" autocomplete="off" id="signup_addr_detail" placeholder="���ּҸ� �Է����ּ���.">
						</div>
						<button type="submit" class="top_modal_button top_modal_button_style" id="signup_submit_btn">
							<span>ȸ������</span>
						</button>
					</form>
				</div>
	        </div>
	        <label for="userPopup"></label>
	    </div>
	    <!--��ü ������ Wrapper-->
	    <div id="top_wrapper">
	        <!--header Wrapper(�ΰ� ��� Div(�߰� Contents ����), Hompage Logo)-->
	        <div id="header">
	            <!--ADD CONTENTS-->
	            <div id="headerTopMenu">
	                <!--�ʿ�� ����-->
	            </div>
	            <!--�ΰ� �̹��� Div-->
	            <div id="homeLogo">
	                <img src="img/logo4.png" alt="�̹��� �ε� �Ұ�!">
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
	            <!--nav ���� :1���� �����̵� �޴�, ����Ʈ, �Ż�ǰ, ������, �˻�â(search icon), shopping icon(��ٱ���)-->
	            <div id="nav_Div">
	                <ul class="nav_main">
	                    <li id="nav_start">
	                        <a class="nav_a" id="ricecakeNav">
	                            <i class="fas fa-bars"></i>
	                            <span class="txt">��</span>
							</a>
							<div id="nav_category">
								<ul>
									<li><a href="#" class="category_menu">��ü����</a></li>
									<li><a href="#" class="category_menu">���붱</a></li>
									<li><a href="#" class="category_menu">ǻ����</a></li>

								</ul>
							</div>
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
	                            <span class="txt">������</span>
	                        </a>
	                    </li>
	                    <li>
	                        <a class="nav_a">
	                            <span class="txt"></span>
	                        </a>    
	                    </li> 
	                </ul>
	                <i class="fas fa-shopping-cart"></i>
	                <input type="checkbox" id="userPopup">
					<label for="userPopup" id="userPopup_label">
						<i class="fas fa-user"></i>
					</label>
				</div>
	        </div>
	</div>
	<script type="text/javascript" src="js/top.js"></script>
<!-- </body>    --- index.jsp ���� �ݾ���
</html> -->