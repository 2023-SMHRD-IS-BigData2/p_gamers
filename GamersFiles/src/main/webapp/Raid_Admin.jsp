<%@page import="com.project.model.ContentDAO"%>
<%@page import="com.project.model.ContentDTO"%>
<%@page import="com.project.model.MemberDAO"%>
<%@page import="com.project.model.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Phantom by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>공격대 관리 페이지</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
<style type="text/css">
#header {
	margin: 0px;
}

#input_1 {
	height: 1em;
}

#input_2 {
	padding: 2px;
	font-size: 0.5em;
}

form {
	margin: 0px;
}

.groupMain {
	width: 1900px;
	height: 750px;
	margin: 0px;
	flex-direction: row;
	display: flex;
}

h1 {
	margin: 0px;
}

.groupInner {
	
}

.firstBox {
	width: 650px;
	height: 750px;
	display: inline-block;
	padding: 50px;
	text-align: center;
	border: 5px solid #8C8C8C;
	border-radius: 10px;
	margin-left: 10px;
	margin-right: 10px;
	display: flex;
	flex-direction:column;
	background-color: aqua;
}

.secondBox {
	width: 1250px;
	height: 750px;
	display: inline-block;
	border: 5px solid #8C8C8C;
	display: flex;
	flex-direction: column; border-radius : 10px;
	background-color: pink;
	border-radius: 10px;
}

.sb_up_box {
	width: 1250px;
	height: 500px;
	background-color: yellow;
	display: block;
}

.sb_down_box {
	width: 1250px;
	height: 250px;
	background-color: green;
	display: block;
}
</style>
</head>
<body>
	<%
	session.setAttribute("g_name", "g_name");
	String g_name = (String) session.getAttribute("g_name");
	List<ContentDTO> content = new ContentDAO().contentList2("신생");
	%>

	<div id="groupWrapper" style="width: 100; height: 100px;">
		<!-- Header -->
		<header id="header">
			<div class="groupInner" style="width: 200; height: 200;">
				<!-- Logo -->
				<!-- <a href="index.html" class="logo"> <span class="symbol"><img
						src="images/logo.svg" alt="" /></span><span class="title">Gamers</span>
				</a> -->
				<!-- Nav -->

				<nav>
					<ul>
						<li><a href="#menu">Menu</a></li>
					</ul>
				</nav>
			</div>
		</header>
	</div>

	<!-- Menu -->
	<nav id="menu">
		<h2>Menu</h2>
		<ul>
			<li><a href="GamersMain.jsp">홈</a></li>
			<li><a href="calendar.jsp">공격대 메인 페이지</a></li>
			<li><a href="Raid_Member.jsp">공격대 구성원 정보</a></li>
			<li><a href="Raid_Admin.jsp">공격대 관리</a></li>
		</ul>
	</nav>

	<!-- Main -->
	<div class="groupInner">
		<h1>공격대 관리 페이지입니다</h1>
	</div>
	<div class="groupMain">
		<div class="firstBox">
			<div>파티명</div>
			<div>유저 아이디</div>
			<div>목적 확팩</div>
			<div>목적 컨텐츠(고르게 할거임)</div>
			<div>시작일</div>
			<div>종료일</div>
			<div>모집 인원수</div>
			<div>탱커수</div>
			<div>힐러수</div>
			<div>딜러수</div>
		</div>
		<div class="secondBox">
			<div class="sb_up_box"></div>
			<div class="sb_down_box"></div>
		</div>
	</div>




	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>