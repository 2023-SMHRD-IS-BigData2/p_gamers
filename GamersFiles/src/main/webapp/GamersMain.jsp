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
					파티 조회 </a> <a href="adminContent.jsp"> 레이드 조회 </a>
			</nav>
			<%
			} else {
			%>
			<nav>
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
			<!-- Two -->
			<section id="two">
				<div class="inner">
					<header class="major">
						<h2>받은 메세지함</h2>
					</header>
					<p></p>
					<ul class="actions">
						<li>님에게 온 메세지</li>
						<li><a href="DelAllService.do?email="
							class="button next scrolly">전체삭제하기</a></li>
					</ul>
					<table style="text-align: center;">
						<tr>
							<td>번호</td>
							<td>보낸사람</td>
							<td>내용</td>
							<td>시간</td>
						</tr>
					</table>
				</div>
			</section>
		</div>
		<!-- Contact -->
		<section id="contact">
			<div class="inner">
				<section>
					<form method="post" action="#">
						<div class="fields">
							<div class="field half">
								<label for="title">제목</label> <input type="text" name="title"
									id="title" />
							</div>
							<div class="field half">
								<label for="recipient">받는 사람</label> <input type="text"
									name="recipient" id="recipient" />
							</div>
							<div class="field">
								<label for="content">내용</label>
								<textarea name="content" id="content" rows="6"></textarea>
							</div>
						</div>
						<ul class="actions">
							<li><input type="submit" value="메세지 보내기" class="primary" /></li>
							<li><input type="reset" value="초기화" /></li>
						</ul>
					</form>
				</section>
				<%
				if (login == null) {
				%>
				<section class="split">
					<section>
						<div class="contact-method">
							<span class="icon solid alt fa-envelope"></span>
							<h3>내 ID</h3>
							<span>로그인이 필요합니다.</span>
						</div>
					</section>
					<section>
						<div class="contact-method">
							<span class="icon solid alt fa-phone"></span>
							<h3>내 닉네임</h3>
							<span>로그인이 필요합니다.</span>
						</div>
					</section>
					<section>
						<div class="contact-method">
							<span class="icon solid alt fa-home"></span>
							<h3>내 파티명</h3>
							<span>로그인이 필요합니다.</span>
						</div>
					</section>
				</section>
				<%
				} else {
				%>
				<section class="split">
					<section>
						<div class="contact-method">
							<span class="icon solid alt fa-envelope"></span>
							<h3>내 ID</h3>
							<a href="#"><%=login.getM_id()%></a>
						</div>
					</section>
					<section>
						<div class="contact-method">
							<span class="icon solid alt fa-phone"></span>
							<h3>내 닉네임</h3>
							<span><%=login.getM_nick()%></span>
						</div>
					</section>
					<section>
						<div class="contact-method">
							<span class="icon solid alt fa-home"></span>
							<h3>내 파티명</h3>
							<a href="calendar.jsp"><%=login.getG_name()%> </a>
						</div>
					</section>
				</section>
				<%
				}
				%>
			</div>
		</section>

		<!-- Footer -->
		<footer id="footer">
			<div class="inner">
				<ul class="icons">
					<li><a href="#" class="icon brands alt fa-twitter"><span
							class="label">Twitter</span></a></li>
					<li><a href="#" class="icon brands alt fa-facebook-f"><span
							class="label">Facebook</span></a></li>
					<li><a href="#" class="icon brands alt fa-instagram"><span
							class="label">Instagram</span></a></li>
					<li><a href="#" class="icon brands alt fa-github"><span
							class="label">GitHub</span></a></li>
					<li><a href="#" class="icon brands alt fa-linkedin-in"><span
							class="label">LinkedIn</span></a></li>
				</ul>
				<ul class="copyright">
					<li>&copy; Untitled</li>
					<li>Design: <a href="https://html5up.net">HTML5 UP</a></li>
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