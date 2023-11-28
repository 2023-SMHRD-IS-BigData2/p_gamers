<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.io.Console"%>
<%@page import="java.util.List"%>
<%@page import="com.project.model.ContentDTO"%>
<%@page import="com.project.model.ContentDAO"%>
<%@page import="org.apache.catalina.startup.SetAllPropertiesRule"%>
<%@page import="org.apache.tomcat.util.descriptor.web.LoginConfig"%>
<%@page import="com.project.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>게이머즈</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="MainAssets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="MainAssets/css/noscript.css" />
</noscript>
</head>
<body class="is-preload">
	<%
	MemberDTO login = (MemberDTO) session.getAttribute("login");
	if (login != null) {
		session.setAttribute("g_name", login.getG_name());
		session.setAttribute("m_nick", login.getM_nick());
		session.setAttribute("m_id", login.getM_id());
	}
	%>
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Header -->
		<header id="header" class="alt">
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
					onclick="window.open('Message.jsp','new','scrollbars=yes,resizable=no width=700 height=600, left=1200,top=600');return false">쪽지함</a>
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
		<!-- Banner -->
		<section id="banner" class="major">
			<%
			if (login == null) {
			%>
			<div id="inner" class="inner">
				<header class="major">
					<h1>안녕하세요. 게이머즈입니다.</h1>
				</header>
				<div class="content">
					<p>회원가입 시 더 많은 기능을 사용하실 수 있습니다.</p>
					<ul class="actions">
						<li><a href="#one" class="button next scrolly">컨텐츠 보기</a></li>
					</ul>
				</div>
			</div>
			<%
			} else {
			%>
			<div id="inner" class="inner">
				<header class="major">
					<h1><%=login.getM_nick()%>님 환영합니다.
					</h1>
				</header>
				<div class="content">
					<p>레이드를 선택해 파티를 찾아보세요.</p>
					<ul class="actions">
						<li><a href="#one" class="button next scrolly">컨텐츠 보기</a></li>
					</ul>
				</div>
			</div>
			<%
			}
			%>
		</section>
		<!-- Main -->
		<div id="main">
			<!-- One -->
			<section id="one" class="tiles">
				<%
				List<ContentDTO> contents = new ContentDAO().contentList();
				int cnt = 0;
				if (contents != null) {
					for (int i = 0; i < contents.size(); i++) {
						cnt++;
				%>
				<article>
					<span class="image" style="display: inline-block;"> <img
						src="images/con_logo<%=cnt%>.png" alt="" width="auto"
						height="auto" />
					</span>
					<header class="major">
						<h3>
							<a
								href="contentDetail.jsp?c_name=<%=contents.get(i).getC_name()%>"
								class="link"><%=contents.get(i).getC_name()%></a>
						</h3>
						<p><%=contents.get(i).getC_title()%></p>
					</header>
				</article>
				<%
				}
				}
				%>
			</section>
		</div>
		<!-- Footer -->
		<footer id="footer">
			<div class="inner">
				<ul class="icons">
					<li><a href="#" class="icon brands alt fa-twitter"><span
							class="label">Twitter</span></a></li>
					<li><a href="https://www.instagram.com/cksghwjd" class="icon brands alt fa-instagram"><span
							class="label">Instagram</span></a></li>
					<li><a href="https://github.com/2023-SMHRD-IS-BigData2/p_gamers" class="icon brands alt fa-github"><span
							class="label">GitHub</span></a></li>
				</ul>
				<ul class="copyright">
					<li>&copy; 프로젝트</li>
					<li>팀명 : <a href="#">게이머즈</a></li>
				</ul>
			</div>
		</footer>

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