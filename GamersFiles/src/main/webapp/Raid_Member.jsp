<%@page import="com.project.model.GroupDAO"%>
<%@page import="com.project.model.GroupDTO"%>
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
<title>공격대원 정보</title>
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
	margin: 10px;
	margin-left: 100px;
}

.groupInner {
	
}

.firstBox {
	width: 350px;
	height: 730px;
	display: inline-block;
	padding: 50px;
	text-align: center;
	border: 5px solid #8C8C8C;
	border-radius: 10px;
	margin: 10px;
}

.member_list {
	width: 100%;
	height: 100%;
	display: inline-block;
}

.member_list_title {
	font-size: 30px;
	padding-top: 20px;
}

.member_list_list {
	font-size: 24px;
	padding-top: 20px;
}

.secondBox {
	width: 1400px;
	height: 840px;
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	justify-content: flex-start;
	align-items: flex-start;
	border: 5px solid #8C8C8C;
	border-radius: 10px;
}

.sb_up_box {
	width: 1400px;
	height: 50px;
	background-color: #5D5D5D;
	color: white;
	font-size: 24px;
	padding-left: 15px;
}

.sb_down_box {
	width: 1400px;
	height: 790px;
	flex-direction: row;
	flex-wrap: wrap;
	justify-content: flex-start;
	align-items: flex-start;
}

.inner_box {
	width: 611px;
	height: 155px;
	border: 5px solid;
	border-radius: 20px;
	margin-top: 10px;
	margin-left: 40px;
	display: inline-block;
	padding: 5px;
}

.inner_box_title {
	font-size: 35px;
}

.inner_box_job {
	font-size: 16px;
	margin-left: 10px;
}

.inner_box_1 {
	width: 611px;
	height: 75%;
	display: inline-block;
	display: flex;
}

.inner_box_1_1 {
	width: 200px;
	height: 100%;
	display: inline;
}

.inner_box_1_2 {
	width: 411px;
	height: 100%;
	display: inline;
}

.inner_box_2_1 {
	width: 450px;
	height: 25%;
	display: inline;
	margin-left: 10px;
}

.inner_box_2_2 {
	width: 150px;
	height: 25%;
	display: inline;
	margin-left: 10px;
}
</style>
</head>
<body class="is-preload">
	<%
	String g_name = (String) session.getAttribute("g_name");
	List<MemberDTO> m_list = new MemberDAO().raidMemberList(g_name);
	String m_id = (String) session.getAttribute("m_id");
	GroupDTO dto = new GroupDAO().selectGroupAdmin(g_name);
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
	<!-- Menu -->
	<nav id="menu">
		<h2>Menu</h2>
		<ul>
			<li><a href="GamersMain.jsp">홈</a></li>
			<li><a href="calendar.jsp">공격대 메인 페이지</a></li>
			<li><a href="Raid_Member.jsp">공격대 구성원 정보</a></li>
			<%
			if (m_id.equals(dto.getM_id())) {
			%>
			<li><a href="Raid_Admin.jsp">공격대 관리</a></li>
			<%
			}
			%>
			<li><a href="DropMain.jsp">레이드 공략 & 아이템DB</a></li>
		</ul>
	</nav>

	<!-- Main -->
	<div class="groupInner">
		<h1>공격대 정보</h1>
	</div>
	<div class="groupMain">
		<div class="firstBox">
			<div class="member_list">
				<div class="member_list_title">공격대원 목록</div>
				<hr>
				<div class="member_list_list">
					<%
					for (MemberDTO tmp : m_list) {
					%>
					<%=tmp.getM_nick()%>
					(<%=tmp.getM_id()%>)
					<%if (tmp.getM_id().equals(dto.getM_id())){ %>
					<b>☆</b>
					<%} %>
					<br>
					<%
					}
					%>
				</div>
				<hr>
				<%
				if (!m_id.equals(dto.getM_id())) {
				%>
				<div>
					<form action="Raid_Member_Withdrawal_Service">
						<input type="hidden" name="m_id" value="<%=m_id%>">  
						<input type="submit" value="공격대 탈퇴">
					</form>
				</div>
				<%
				}
				%>
			</div>
		</div>
		<div class="secondBox">
			<div class="sb_up_box">공격대원 상태 메세지</div>
			<div class="sb_down_box">
				<%
				String position_color = null;
				String back_color = null;
				for (MemberDTO tmp : m_list) {
					if (tmp.getM_position().equals("탱커")) {
						position_color = "#3894FF";
						back_color = "#D4F4FA";
					} else if (tmp.getM_position().equals("힐러")) {
						position_color = "#06CC80";
						back_color = "#E0FFDB";
					} else if (tmp.getM_position().equals("딜러")) {
						position_color = "#FF5C76";
						back_color = "#FFD8D8";
					}
				%>
				<div class="inner_box"
					style="border-color: <%=position_color%>; background-color: <%=back_color%>">
					<div class="inner_box_1">
						<div class="inner_box_1_1">
							<div class="inner_box_title">
								<b><%=tmp.getM_nick()%></b>
							</div>
							<div class="inner_box_job">
								<%=tmp.getM_class()%>
							</div>
						</div>
						<div class="inner_box_1_2">
							<div>
								상태 메세지 :
								<%
							if (tmp.getM_coment() != null) {
							%>
								<%=tmp.getM_coment()%>
								<%
								}
								%>
							</div>

						</div>
					</div>
					<div class="inner_box_2">
						<form action="Raid_Coment_Update_Service">
							<div class="inner_box_2_1">
								<input id="input_1" type="textarea" rows="1" cols="50"
									name="coment"> <input type="hidden" name="name"
									value="<%=tmp.getM_nick()%>">
							</div>
							<div class="inner_box_2_2">
								<input id="input_2" type="submit" value="상태메세지 갱신">
							</div>
						</form>
					</div>
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