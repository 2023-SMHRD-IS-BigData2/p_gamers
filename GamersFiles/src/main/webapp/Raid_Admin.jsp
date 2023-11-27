<%@page import="com.project.model.ApplyDAO"%>
<%@page import="com.project.model.ApplyDTO"%>
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

#input_1 {
	font-size: 12px;
	padding: 0 1em 0 1em;
	height: 2.5em;
	margin: 0px;
	text-align: center;
	margin-top: 15px;
}

#input_2 {
	font-size: 12px;
	padding: 0 1em 5px 1em;
	height: 3em;
	margin: 0px;
	text-align: center;
	margin-top: 15px;
}

form {
	margin: 0px;
}

table, tr, td {
	border: 1px solid #8C8C8C;
}
td{
height: 10px;	
}

.groupMain {
	width: 1900px;
	height: 800px;
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
	height: 800px;
	display: inline-block;
	text-align: center;
	border: 5px solid #8C8C8C;
	border-radius: 10px;
	margin-left: 10px;
	margin-right: 10px;
	margin-bottom: 10px;
	display: flex;
	flex-direction: column;
}

.fb_title {
	text-align: left;
	width: 100%;
	height: 50px;
	background-color: #5D5D5D;
	color: white;
	font-size: 24px;
	padding-left: 15px;
}

.fb_table {
	width: 75%;
	height: 650px;
	margin-left: 75px;
}

.secondBox {
	width: 1250px;
	height: 800px;
	display: inline-block;
	border: 5px solid #8C8C8C;
	display: flex;
	flex-direction: column;
	border-radius: 10px;
}

.sb_up_box {
	width: 1250px;
	height: 5000px;
	display: flex;
	flex-direction: column;
}

.up_upper_box {
	width: 1250px;
	height: 50px;
	background-color: #5D5D5D;
	color: white;
	font-size: 24px;
	padding-left: 15px;
}

.up_down_box {
	width: 1250px;
	height: 450px;
	display: flex;
	flex-direction: column;
	overflow: scroll;
	flex-wrap: wrap;
	justify-content: flex-start;
	align-items: flex-start;
}

.ud_inner_box {
	width: 400px;
	height: 110px;
	background-color: #CDCDCD;
	margin: 10px;
	padding-left: 15px;
	display: flex;
	flex-direction: row;
	border: 5px solid #939393;
	border-radius: 5px;
	display: flex;
}

.ib_left {
	width: 250px;
	height: 110px;
	display: inline-block;
}

.ib_right {
	
}

.sb_down_box {
	width: 1250px;
	height: 250px;
	display: block;
	text-align: center;
	padding-top: 50px;
	flex-wrap: wrap;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	justify-content: center;
}

.db_title {
	text-align: left;
	width: 1250px;
	height: 50px;
	background-color: #5D5D5D;
	color: white;
	font-size: 24px;
	padding-left: 15px;
}

.db_case {
	width: 750px;
	height: 150px;
	border: 3px solid #8C8C8C;
	border-radius: 5px;
}

.down_box_form {
	margin-top: 10px;
}

.form_submit {
	
}
</style>
</head>
<body class="is-preload">
	<%
	String g_name = (String) session.getAttribute("g_name");
	String m_nick = (String) session.getAttribute("m_nick");
	String m_id = (String) session.getAttribute("m_id");
	GroupDTO dto = new GroupDAO().selectGroupAdmin(g_name);
	List<ApplyDTO> a_list = new ApplyDAO().applyList(m_id);
	%>
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
	<div class="groupInner">
		<h1>공격대 관리</h1>
	</div>
	<div class="groupMain">
		<div class="firstBox">
			<div class="fb_title">공격대 정보</div>
			<div class="fb_table">
				<table>
					<tr>
						<td><b>공격대 이름</b></td>
						<td><%=dto.getG_name()%></td>
					</tr>
					<tr>
						<td><b>공격대장</b></td>
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
						<td><b>공격대 시작 날짜</b></td>
						<td><%=dto.getG_start()%></td>
					</tr>
					<tr>
						<td><b>공격대 종료 날짜</b></td>
						<td><%=dto.getG_end()%></td>
					</tr>
					<tr>
						<td><b>목표 총 인원</b></td>
						<td><%=dto.getG_member()%></td>
					</tr>
					<tr>
						<td><b>목표 탱커 수</b></td>
						<td><%=dto.getM_tank()%></td>
					</tr>
					<tr>
						<td><b>목표 힐러 수</b></td>
						<td><%=dto.getM_heal()%></td>
					</tr>
					<tr>
						<td><b>목표 딜러 수</b></td>
						<td><%=dto.getM_deal()%></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="secondBox">
			<div class="sb_up_box">
				<div class="up_upper_box">공격대 지원자 목록</div>
				<div class="up_down_box">
					<%
					for (ApplyDTO tmp : a_list) {
					%>
					<div class="ud_inner_box">
						<div class="ib_left">
							<%=tmp.getSend_nick()%>
							<br><%=tmp.getSend_pos()%>
							<br><%=tmp.getSend_class()%>
						</div>
						<div class="ib_right">
							<form action="Raid_Member_Insert_Service">
								<input type="hidden" name="send_nick"
									value="<%=tmp.getSend_nick()%>"> <input type="hidden"
									name="send_pos" value="<%=tmp.getSend_pos()%>"> <input
									type="hidden" name="rcv_id" value="<%=tmp.getRcv_id()%>">
								<input type="hidden" name="g_name" value="<%=dto.getG_name()%>">
								<input id="input_1" type="submit" value="가입승인">
							</form>
							<form action="Raid_Apply_Delete_Service">
								<input type="hidden" name="send_nick"
									value="<%=tmp.getSend_nick()%>"> <input type="hidden"
									name="send_pos" value="<%=tmp.getSend_pos()%>"> <input
									type="hidden" name="rcv_id" value="<%=tmp.getRcv_id()%>">
								<input type="hidden" name="g_name" value="<%=dto.getG_name()%>">
								<input id="input_1" type="submit" value="가입거절">
							</form>

						</div>
					</div>
					<%
					}
					%>
				</div>


			</div>
			<div class="sb_down_box">
				<div class="db_title">공격대 삭제</div>
				<div class="db_case">
					<div class="down_box_title">공격대 삭제를 원하시면 아래에 "공격대삭제"를 정확하게
						입력해주세요</div>
					<div class="down_box_form">
						<form action="Raid_Final_Delete_Service">
							<div class="form_text">
								<input type="textarea" name="deleteCheck"> <input
									type="hidden" name="g_name" value="<%=g_name%>">

							</div>
							<div class="form_submit">
								<input id="input_2" type="submit" value="공격대 삭제">
							</div>
						</form>
					</div>
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