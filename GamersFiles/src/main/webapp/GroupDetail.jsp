<%@page import="com.project.model.GroupDAO"%>
<%@page import="com.project.model.GroupDTO"%>
<%@page import="com.project.model.MemberDAO"%>
<%@page import="com.project.model.ContentDAO"%>
<%@page import="com.project.model.ContentDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.project.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="MainAssets/css/main.css" />
<style type="text/css">
</style>
</head>
<body class="is-preload">
	<%
	MemberDTO login = (MemberDTO)session.getAttribute("login");
	if (login != null) {
		session.setAttribute("g_name", login.getG_name());
		session.setAttribute("m_nick", login.getM_nick());
		session.setAttribute("m_id", login.getM_id());
	}
	%>
	<div class="wrapper">
		<header id="header" class="alt">
			<!-- Header -->
			<a href="GamersMain.jsp" class="logo"><strong>게이머즈</strong></a>
			<%
			if (login != null) {
				if (login.getM_id().equals("admin")) {
			%>
			<nav>
				<a href="adminMember.jsp"> 회원 조회 </a> <a href="adminGroup.jsp">
					파티 조회 </a> <a href="adminContent.jsp"> 레이드 조회 </a> <a
					href="LogoutService.do"> 로그아웃 </a>
			</nav>
			<%
			} else {
			%>
			<nav>
				<a href="#none"
					onclick="window.open('Message.jsp','new','scrollbars=yes,resizable=no width=500 height=600, left=1200,top=600');return false">쪽지함</a>
				<a href="UM.jsp"> 내 정보 수정 </a>
				<%
				if (login.getG_name() != null) {
				%>
				<a href="calendar.jsp"> 내 파티 </a>
				<%
				}
				%>
				<a href="LogoutService.do"> 로그아웃 </a>
			</nav>
			<%
			}
			} else {
			%>
			<nav>
				<a href="Member.jsp"> 로그인&회원가입 </a>
			</nav>
			<%
			}
			%>
		</header>
		<!-- Main -->
		<div id="main">
			<%
			String g_name = request.getParameter("g_name");
			List<MemberDTO> members = new MemberDAO().raidMemberList(g_name);
			GroupDTO group = new GroupDAO().selectGroup(g_name);
			if (members != null) {
				int cnt = 0;
				int[] dealers = new int[members.size()];
				int[] tankers = new int[members.size()];
				int[] healers = new int[members.size()];
			%>
			<section id="group">
				<div class="inner">
				<%
				for (int i = 0; i < members.size(); i++) {
					cnt++;
					if (members.get(i).getM_position().equals("딜러")) {
						dealers[i]++;
					} else if (members.get(i).getM_position().equals("탱커")) {
						tankers[i]++;
					} else if (members.get(i).getM_position().equals("힐러")) {
						healers[i]++;
					}
				%>
					<header class="major">
						<h2><%=group.getG_name()%></h2>
					</header>
					<p>파티장 ID : <%=group.getM_id()%> </p>
					<p>레이드 : <%=group.getC_name()%>, 컨텐츠 : <%=group.getG_content()%></p>
					<p>일정 : <%=group.getG_start() %> ~ <%=group.getG_end()%></p>
					<p>역할별 인원현황 <br>
					딜러 : <%=dealers[i]%> / <%=group.getM_deal()%> <br>
					탱커 : <%=tankers[i]%> / 	<%=group.getM_tank()%> <br>
					힐러 : <%=healers[i]%> / 	<%=group.getM_heal()%>
					</p>
				</div>
				<div class="inner">
					<ul class="actions">
						<li><a href="DelAllService.do?email="
							class="button next scrolly"> 가입신청 </a></li>
						<li style="align-content: flex-end;"><a
							href="contentDetail.jsp?c_name=<%=group.getC_name()%>" class="button next scrolly">
								뒤로가기 </a></li>
					</ul>
					<table style="text-align: center;">
						<tr>
							<th style="text-align: center;">비고</th>
							<th style="text-align: center;">닉네임</th>
							<th style="text-align: center;">포지션</th>
							<th style="text-align: center;">직업</th>
							<th style="text-align: center;">자기소개</th>
						</tr>
						<tr>
							<td style="text-align: center;"><%=cnt %></td>
							<td style="text-align: center;"><%=members.get(i).getM_nick()%></td>
							<td style="text-align: center;"><%=members.get(i).getM_position()%></td>
							<td style="text-align: center;"><%=members.get(i).getM_class()%></td>
							<td style="text-align: center;"><%=members.get(i).getM_coment()%></td>
						</tr>
					</table>
				</div>
				<%
				}
				%>
			</section>
			<%
			}
			%>
		</div>
	</div>
	<!-- Scripts -->
	<script src="MainAssets/js/jquery.min.js"></script>
	<script src="MainAssets/js/jquery.scrolly.min.js"></script>
	<script src="MainAssets/js/jquery.scrollex.min.js"></script>
	<script src="MainAssets/js/browser.min.js"></script>
	<script src="MainAssets/js/breakpoints.min.js"></script>
	<script src="MainAssets/js/util.js"></script>
	<script src="MainAssets/js/main.js"></script>
</body>
</html>