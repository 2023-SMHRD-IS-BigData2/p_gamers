<%@page import="com.project.model.GroupDAO"%>
<%@page import="com.project.model.GroupDTO"%>
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

table, tr, td {
	border: 1px solid #8C8C8C;
}

.groupMain {
	width: 1900px;
	height: 740px;
	margin-bottom: 10px;
	flex-direction: row;
	display: flex;
}

h1 {
	margin: 15px;
	margin-left: 100px;
}

.groupInner {
	
}

.firstBox {
	width: 650px;
	height: 700px;
	display: inline-block;
	padding: 50px;
	text-align: center;
	border: 5px solid #8C8C8C;
	border-radius: 10px;
	margin-left: 10px;
	margin-right: 10px;
	margin-bottom:10px;
	display: flex;
	flex-direction: column;
}

.secondBox {
	width: 1250px;
	height: 750px;
	display: inline-block;
	border: 5px solid #8C8C8C;
	display: flex;
	flex-direction: column;
	border-radius: 10px;
	background-color: pink;
	border-radius: 10px;
}

.sb_up_box {
	width: 1250px;
	height: 500px;
	background-color: yellow;
	display: flex;
	flex-direction: column;
}

.up_upper_box {
	width: 1250px;
	height: 100px;
	background-color: pink;
}

.up_down_box {
	width: 1250px;
	height: 400px;
	background-color: white;
	display: flex;
	flex-direction: column;
	flex-wrap: wrap;
	justify-content: flex-start;
	align-items: flex-start;
}

.ud_inner_box {
	width: 550px;
	height: 95px;
	background-color: yellow;
	margin: 15px;
}

.sb_down_box {
	width: 1250px;
	height: 250px;
	background-color: green;
	display: block;
	text-align: center;
	padding-top: 50px;
}

.down_box_form {
	margin-top: 10px;
}

.form_submit {
	margin-top: 10px;
}
</style>
</head>
<body>
	<%
	session.setAttribute("g_name", "성실성");
	String g_name = (String) session.getAttribute("g_name");
	String m_nick = (String) session.getAttribute("m_nick");
	GroupDTO dto = new GroupDAO().selectGroupAdmin(g_name);
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
			<table>
				<tr>
					<td><b>공대 이름</b></td>
					<td><%=dto.getG_name()%></td>
				</tr>
				<tr>
					<td><b>공대장</b></td>
					<td><%=m_nick%></td>
				</tr>
				<tr>
					<td><b>목표 확장팩</b></td>
					<td><%=dto.getC_name()%></td>
				</tr>
				<tr>
					<td><b>목표 레이드</b></td>
					<td><%=dto.getG_content()%></td>
				</tr>
				<tr>
					<td><b>공대 시작 날짜</b></td>
					<td><%=dto.getG_start()%></td>
				</tr>
				<tr>
					<td><b>공대 종료 날짜</b></td>
					<td><%=dto.getG_end()%></td>
				</tr>
				<tr>
					<td><b>모집 중인 인원</b></td>
					<td><%=dto.getG_member()%></td>
				</tr>
				<tr>
					<td><b>모집 중인 탱커 수</b></td>
					<td><%=dto.getM_tank()%></td>
				</tr>
				<tr>
					<td><b>모집 중인 힐러 수</b></td>
					<td><%=dto.getM_heal()%></td>
				</tr>
				<tr>
					<td><b>모집 중인 딜러 수</b></td>
					<td><%=dto.getM_deal()%></td>
				</tr>
			</table>
		</div>
		<div class="secondBox">
			<div class="sb_up_box">
				<div class="up_upper_box"></div>
				<div class="up_down_box">
					<div class="ud_inner_box">test</div>
				</div>


			</div>
			<div class="sb_down_box">
				<div class="down_box_title">공격대 삭제를 원하시면 아래에 "공대삭제"를 정확하게
					입력해주세요</div>
				<div class="down_box_form">
					<form action="">
						<div class="form_text">
							<input type="textarea" name="deleteCheck">
						</div>
						<div class="form_submit">
							<input type="submit" value="공격대 삭제">
						</div>
					</form>
				</div>
			</div>
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