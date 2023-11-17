
<%@page import="com.project.model.ContentDTO"%>
<%@page import="com.project.model.ContentDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.project.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>게이머즈</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
</head>
<body class="is-preload">
	<%
	MemberDTO login = (MemberDTO) session.getAttribute("login");
	%>
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Header -->
		<header id="header">
			<div class="inner">
				<!-- Logo -->
				<a href="Main.jsp" class="logo"> <span class="symbol"><img
						src="images/logo.svg" alt="" /></span><span class="title">게이머즈</span>
				</a>
				<!-- Nav -->
				<nav>
					<ul>
						<li><a href="#menu">메뉴</a></li>
					</ul>
				</nav>

			</div>
		</header>

		<%
		if (login == null) {
		%>
		<!-- Menu -->
		<nav id="menu">
			<h2>Menu</h2>
			<ul>
				<li><a href="Main.jsp"> 홈 </a></li>
				<li><a href="Member.jsp"> 로그인 </a></li>
				<li><a href="Member.jsp"> 회원가입 </a></li>
			</ul>
		</nav>
		<%
		} else if (login.getM_id().equals("admin")) {
		%>
		<nav id="menu">
			<h2>Menu</h2>
			<ul>
				<li><a href="Main.jsp"> 홈 </a></li>
				<li><a href="adminMember.jsp"> 회원 조회 </a></li>
				<li><a href="adminGroup.jsp"> 파티 조회 </a></li>
				<li><a href="adminContent.jsp"> 컨텐츠 조회 </a></li>
			</ul>
		</nav>
		<%
		} else {
		%>
		<nav id="menu">
			<h2>Menu</h2>
			<ul>
				<li><a href="Main.jsp"> 홈 </a></li>
				<li><a href="Update.jsp?m_id=<%=login.getM_id()%>"> 내 정보 수정
				</a></li>
				<li><a href="userParty.jsp"> 내 파티 </a></li>
			</ul>
		</nav>
		<%
		}
		%>
		<!-- Main -->
		<div id="main">
			<div class="inner">
				<%
				if (login == null) {
				%>
				<header>
					<h3>
						회원가입 후 이용할 수 있습니다. <a href="Member.jsp">
							<button>회원가입</button>
						</a>
					</h3>
				</header>
				<%
				} else {
				%>
				<header>
					<h1>레이드 컨텐츠를 선택 후 파티를 확인하세요.</h1>
					<p>(파이널 판타지 14) 프로젝트를 골라 그룹에 참여해보세요.</p>
				</header>

				<%
				}
				%>

				<%
				List<ContentDTO> contents = null;
				contents = new ContentDAO().contentList();
				if (contents != null) {
				%>
				<section class="tiles">
					<%
					for (int i = 0; i < contents.size(); i++) {
					%>
					<article class="style<%=i%>">
						<span class="image"> <img src="pocketmons/con<%=contents.get(i).getC_num()%>.jpg"
							alt="" />
						</span> <a href="contentDetail.jsp?c_num=<%=contents.get(i).getC_num()%>">
							<h2><%=contents.get(i).getC_num()%>번 레이드
							</h2>
							<div class="content">
								<p><%=contents.get(i).getC_name()%></p>
							</div>
						</a>
					</article>
					<%
					}
					%>
					<%
					} else {
					%>
					<article class="style1">
						<span class="image"> <img src="pocketmons/con1.jpg" alt="" />
						</span> <a href="contentDetail.jsp?c_num=">
							<h2>번 레이드</h2>
							<div class="content">
								<p>컨텐츠 명</p>
							</div>
						</a>
					</article>
					<%
					}
					%>
				</section>
			</div>
		</div>
		<!-- Footer -->
		<footer id="footer">
			<div class="inner">
				<section>
					<h2>메세지를 보내보세요.</h2>
					<form method="post" action="#">
						<div class="fields">
							<div class="field half">
								<input type="text" name="name" id="name" placeholder="Name" />
							</div>
							<div class="field half">
								<input type="email" name="email" id="email" placeholder="Email" />
							</div>
							<div class="field">
								<textarea name="message" id="message" placeholder="Message"></textarea>
							</div>
						</div>
						<ul class="actions">
							<li><input type="submit" value="Send" class="primary" /></li>
						</ul>
					</form>
				</section>
				<section>
					<h2>Follow</h2>
					<ul class="icons">
						<li><a href="#" class="icon brands style2 fa-twitter"><span
								class="label">Twitter</span></a></li>
						<li><a href="#" class="icon brands style2 fa-facebook-f"><span
								class="label">Facebook</span></a></li>
						<li><a href="#" class="icon brands style2 fa-instagram"><span
								class="label">Instagram</span></a></li>
						<li><a href="#" class="icon brands style2 fa-dribbble"><span
								class="label">Dribbble</span></a></li>
						<li><a href="#" class="icon brands style2 fa-github"><span
								class="label">GitHub</span></a></li>
						<li><a href="#" class="icon brands style2 fa-500px"><span
								class="label">500px</span></a></li>
						<li><a href="#" class="icon solid style2 fa-phone"><span
								class="label">Phone</span></a></li>
						<li><a href="#" class="icon solid style2 fa-envelope"><span
								class="label">Email</span></a></li>
					</ul>
				</section>
				<ul class="copyright">
					<li>&copy; Untitled. All rights reserved</li>
					<li>Design: <a href="#">게이머즈></li>
				</ul>
			</div>
		</footer>

	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>