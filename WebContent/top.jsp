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
	</head>
	<body>
	    <div id="modalDiv">
	        <div id="modalInnerFrame">
	            <label for="userPopup"><i class="fas fa-times"></i></label>
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
	            <div id="search_div"">
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
	                <label for="userPopup">
	                    <i class="fas fa-user"></i>
	                </label>
	            </div>
	            <div id="ricecake_sub">
	                <!--�� slide menu �ر⺻�Ӽ� display none-->
	            </div>
	        </div>
	</div>
	<script type="text/javascript" src="js/index.js"></script>
	</body>
</html>