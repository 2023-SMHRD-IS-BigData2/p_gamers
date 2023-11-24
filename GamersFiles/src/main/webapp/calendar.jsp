<%@page import="com.project.model.GroupDAO"%>
<%@page import="com.project.model.GroupDTO"%>
<%@page import="com.project.model.MemberDTO"%>
<%@page import="com.project.model.MiniBoardDAO"%>
<%@page import="com.project.model.MiniBoardDTO"%>
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
<link rel="stylesheet" href="menu.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
<style type="text/css">
#groupWrapper {
	background: #242943 !important;
	color: white !important;
}

body {
	background: white !important;
	color: gray !important;
}

.main_body {
	height: 700px;
	margin: 25px;
	display: flex;
	justify-content: flex-start;
	display: flex;
	margin: 25px;
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
	border: 5px solid #8C8C8C;
	border-radius: 10px;
	padding: 10px;
	width: 750px;
	display: inline-block;
}

.main_title {
	margin-left: 100px;
}

.sub_title {
	display: inline;
}

.main_header {
	margin-left: 50px;
	width: 65%;
	display: inline-block;
	font-size: 30px;
}

.sub_header {
	width: 30%;
	display: inline-block;
	font-size: 30px;
}

.cal_table {
	font-size: 18px;
	width: 100%;
	height: 320px;
	border: 5px solid #8C8C8C;
	border-radius: 10px;
	margin-top: 10px;
}

.cal_result_table {
	overflow: auto;
	font-size: 18px;
	width: 100%;
	height: 50%;
	border: 5px solid #8C8C8C;
	border-radius: 10px;
	margin-top: 10px;
	font-size: 18px;
}

.blank {
	width: 20px;
	height: 100%;
	display: inline-block;
}

.mini_board {
	overflow: auto;
}

.mb_insert {
	border: 5px solid #8C8C8C;
	border-radius: 10px;
	margin-top: 10px;
	margin-left: 20px;
	margin-right: 10px;
}

.mb_content {
	border: 5px solid #8C8C8C;
	border-radius: 10px;
	margin-top: 10px;
}

input {
	font-size: 18px;
}
</style>
</head>
<body class="is-preload">
	<%
	request.setCharacterEncoding("utf-8");
	String g_name = (String) session.getAttribute("g_name");
	String m_nick = (String) session.getAttribute("m_nick");
	String m_id = (String) session.getAttribute("m_id");
	GroupDTO dto = new GroupDAO().selectGroupAdmin(g_name);

	List<CalendarDTO> c_list = new CalendarDAO().calendarList(g_name);
	List<MiniBoardDTO> mb_list = new MiniBoardDAO().MBoardList(g_name);
	%>
	<!-- Wrapper -->
	<div id="groupWrapper" style="width: 100; height: 100px;">
		<!-- Header -->
		<header id="header" class="alt">
			<a href="GamersMain.jsp" class="logo"><strong>게이머즈</strong></a>
			<nav>
				<a href="calendar.jsp">공격대 메인 페이지</a> <a href="Raid_Member.jsp">공격대
					구성원 정보</a>
				<%
				if (m_id.equals(dto.getM_id())) {
				%>
				<a href="Raid_Admin.jsp">공격대 관리</a>
				<%
				}
				%>
				<a href="DropMain.jsp">레이드 공략 & 아이템DB</a>
			</nav>
		</header>
	</div>
	<!-- Main -->
	<div id="groupMain">
		<div class="groupInner">
			<div class="main_title">
				<h1><%=g_name%>
					공격대 홈페이지
				</h1>
			</div>
		</div>
		<div class="subtitle">
			<div class="main_header">일정</div>
			<div class="sub_header">미니 게시판</div>
		</div>
		<div class="main_body">
			<div class="calendar_iframe">
				<iframe src="calendar_iframe.jsp" width="700px" height="640px"></iframe>
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
							<td></td>
						</tr>
						<%
						for (CalendarDTO tmp : c_list) {
							String start = tmp.getC_start();
							if (start != null) {
								start = tmp.getC_start().substring(5, 10);
							}
							String end = tmp.getC_end();
							if (end != null) {
								end = tmp.getC_end().substring(5, 10);
							}
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
			<div class="mb_insert">
				<form action="MiniBoard_Insert_Service" align="center">
					<table width="300px">
						<tr>
							<td>내용 입력</td>
						</tr>
						<tr>
							<td><textarea name="p_content" rows="20" cols="30"></textarea>
							</td>
						</tr>
						<tr>
							<td><input type="submit" value="게시"></td>
						</tr>
					</table>
				</form>
			</div>
			<div class="mini_board">
				<%
				for (MiniBoardDTO tmp : mb_list) {
				%>
				<div class="mb_content">
					<b><%=tmp.getM_id()%></b><br>
					<%=tmp.getP_content()%>
				</div>
				<%
				}
				%>
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