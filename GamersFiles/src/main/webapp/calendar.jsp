<%@page import="com.project.model.CalendarDAO"%>
<%@page import="com.project.model.CalendarDTO"%>
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
<title>일정</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
<style type="text/css">
.main_body {
	margin: 25px;
	display: flex;
	justify-content: flex-start;
	display: flex;
}

.cal_btn {
	width: 50px;
	height: 50px;
	display: inline-block;
	margin-left: 0px;
	margin-right: 180px;
	margin-left: 10px;
	padding: 10px;
	padding: 10px;
}

.calendar_iframe {
	margin: 10px;
	border: 5px solid skyblue;
	border-radius: 10px;
	padding: 10px;
	width: 750px;
	display: inline-block;
}

.main_title {
	margin-left: 100px;
}

.main_header {
	margin-left: 100px;
}

.cal_table {
	font-size: 18px;
	width: 100%;
	height: 40%;
}

.cal_result_table {
	font-size: 18px;
	width: 100%;
	height: 60%;
}

input {
	font-size: 18px;
}
</style>
</head>
<body class="is-preload">
	<%
	session.setAttribute("g_name", "g_name");
	String g_name = (String) session.getAttribute("g_name");

	List<CalendarDTO> list = new CalendarDAO().calendarList(g_name);
	%>
	<!-- Wrapper -->
	<div id="groupWrapper" style="width: 600; height: 600px;">
		<!-- Header -->
		<header id="header">
			<div class="groupInner" style="width: 200; height: 200;">
				<!-- Logo -->
				<a href="index.html" class="logo"> <span class="symbol"><img
						src="images/logo.svg" alt="" /></span><span class="title">Gamers</span>
				</a>
				<!-- Nav -->
				<
				<nav>
					<ul>
						<li><a href="#menu">Menu</a></li>
					</ul>
				</nav>
			</div>
		</header>

		<!-- Menu -->
		<nav id="menu">
			<h2>Menu</h2>
			<ul>
				<li><a href="index.html">Home</a></li>
				<li><a href="generic.html">Ipsum veroeros</a></li>
				<li><a href="generic.html">Tempus etiam</a></li>
				<li><a href="generic.html">Consequat dolor</a></li>
				<li><a href="elements.html">Elements</a></li>
			</ul>
		</nav>


		<!-- Main -->
		<div id="groupMain">
			<div class="groupInner">
				<div class="main_title">
					<h1><%=g_name%>공격대 홈페이지
					</h1>
				</div>
			</div>
			<div class="main_header">일정</div>
			<div class="main_body">
				<div class="calendar_iframe">
					<iframe src="calendar_iframe.jsp" width="700px" , height="640px"></iframe>
				</div>

				<div>
					<div class="cal_table">
						<form action="Cd_Insert_Service" align="center">
							<table>
								<tr>
									<td>일정 시작</td>
									<td><input type="datetime-local" name="c_start"></td>
								</tr>
								<tr>
									<td>일정 종료</td>
									<td><input type="datetime-local" name="c_end"></td>
								</tr>
								<tr>
									<td>내용</td>
									<td><input type="text" name="c_content"></td>
								</tr>
								<tr>
									<td colspan="2"><input type="submit" value="일정생성"></td>
								</tr>


							</table>
						</form>
					</div>
					<div class="cal_result_table">
						<table>
							<tr>
								<td>제목</td>
								<td>시작일</td>
								<td>종료일</td>
								<td>삭제</td>
							</tr>
							<%
							for (CalendarDTO tmp : list) {

								String start = tmp.getC_start().substring(5, 10);
								String end = tmp.getC_end().substring(5, 10);
							%>
							<tr>
								<td><%=tmp.getC_content()%></td>
								<td><%=start%></td>
								<td><%=end%></td>
								<td><a href="Cd_delete_Service?num=<%=tmp.getA_num()%>"><button>삭제</button></a></td>
							</tr>
							<%
							}
							%>
						</table>
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