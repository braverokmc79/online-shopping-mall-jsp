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
					<!-- modal_header : 로그인 / 회원가입 버튼-->
					<div id="modal_header">
						<input type="radio" id="login_btn" class="login_signup_btns" name="login_signup_btns" onclick="login_signup('login')" checked>
						<label for="login_btn" id="login_btn_label" class="login_signup_btns_label" >&nbsp로그인&nbsp</label>
						<span id="modal_header_span">&nbsp|&nbsp</span>
						<input type="radio" id="signup_btn" class="login_signup_btns" name="login_signup_btns" onclick="login_signup('signup')">
						<label for="signup_btn" id="signup_btn_label" class="login_signup_btns_label">회원가입</label>
					</div>
					<form method="POST" id="login_form" action="#">
						<h3>로그인</h3>
						<input type="text" id="login_id_input" class="login_input" name="id" placeholder="아이디를 입력해주세요." autocomplete="off">
						<input type="password" id="login_pwd_input" class="login_input" name="pwd" placeholder="비밀번호를 입력해주세요."autocomplete="off">
						<div id="lost_id_pwd_wrapper">
							<a href="#">아이디 찾기</a>
							<span>|</span>
							<a href="#">비밀번호 찾기</a>
						</div>
						<button type="submit" id="login_submit_btn">
							<span>로그인</span>
						</button>
					</form>
					<form method="POST" id="signup_form" action="#">
						<h3>회원가입</h3>
						<table>
							<tr>
								<td>
									<span>아이디</span>
								</td>
								<td>
									<input type="text" autocomplete="off">
									<button><span>중복확인</span></button>
								</td>
							</tr>
							<tr>
								<td>
									<span>비밀번호</span>
								</td>
								<td>
									<input type="text" autocomplete="off">
								</td>
							</tr>
							<tr>
								<td>
									<span>비밀번호확인</span>
								</td>
								<td>
									<input type="text" autocomplete="off">
								</td>
							</tr>
							<tr>
								<td>
									<span>이름</span>
								</td>
								<td>
									<input type="text" autocomplete="off">
								</td>
							</tr>
							<tr>
								<td>
									<span>생년월일</span>
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
									<span>이메일</span>
								</td>
								<td>
									<input type="text" autocomplete="off">
								</td>
							</tr>
							<tr>
								<td>
									<span>연락처</span>
								</td>
								<td>
									<input type="text" autocomplete="off">
								</td>
							</tr>
							<tr>
								<td>
									<span>주소</span>
								</td>
								<td>
									<buttton><span>주소 검색</span></buttton>
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
	    <!--전체 페이지 Wrapper-->
	    <div id="top_wrapper">
	        <!--header Lapper(로고 상단 Div(추가 Contents 대비용), Hompage Logo)-->
	        <div id="header">
	            <!--ADD CONTENTS-->
	            <div id="headerTopMenu">
	                <!--필요시 문의-->
	            </div>
	            <!--로고 이미지 Div-->
	            <div id="homeLogo">
	                <img src="img/breadLogo.jpg" alt="이미지 로딩 불가!">
	                <!--LOGO-->
	            </div>
	            <div id="search_div">
	                <form action="" id="search_form">
	                    <label>
	                        <input type="text" id="search_input" placeholder="상품을 입력하세요" autocomplete=”off”>
	                        <i class="fas fa-search"></i>
	                    </label>
	                </form>
	            </div>
	            
	        </div>
	        <!--메뉴 네비게이션(sticky)-->
	        <div id="menuNav">
	            <!--nav 구성 :2개의 슬라이드 메뉴, 신상품, 알뜰쇼핑, 이벤트, 검색창(search icon), shopping icon(장바구니)-->
	            <div id="nav_Div">
	                <ul class="nav_main">
	                    <li id="nav_start">
	                        <a class="nav_a" id="breadNav">
	                            <i class="fas fa-bars"></i>
	                            <span class="txt">떡</span>
	                        </a>
	                    </li>
	                    <li>
	                        <a class="nav_a">
	                            <span class="txt">베스트</span>
	                        </a>
	                    </li>
	                    <li>
	                        <a class="nav_a">
	                            <span class="txt">신상품</span>
	                        </a>
	                    </li>
	                    <li>
	                        <a class="nav_a">
	                            <span class="txt">이벤트</span>
	                        </a>
	                    </li>
	                    <li>
	                        <a class="nav_a">
	                            <span class="txt">test / 고객지원</span>
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
	                <!--떡 slide menu ※기본속성 display none-->
	            </div>
	        </div>
	</div>
	<script type="text/javascript" src="js/top.js"></script>
	</body>
</html>