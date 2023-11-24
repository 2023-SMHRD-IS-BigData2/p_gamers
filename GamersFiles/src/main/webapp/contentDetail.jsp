<%@page import="com.project.model.MemberDAO"%>
<%@page import="com.project.model.GroupDAO"%>
<%@page import="com.project.model.GroupDTO"%>
<%@page import="com.project.model.ContentDAO"%>
<%@page import="com.project.model.MemberDTO"%>
<%@page import="com.project.model.ContentDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>게이머즈</title>
<style type="text/css">
div.content {
	justify-content: center;
	align-items: center;
	display: flex;
}
</style>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="menu.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
</head>
<body class="is-preload">
	<%
	MemberDTO login = (MemberDTO) session.getAttribute("login");
	String c_name = request.getParameter("c_name");
	List<GroupDTO> groups = new GroupDAO().groupList2(c_name);
	List<ContentDTO> contents = new ContentDAO().contentList2(c_name);
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
		<!-- Main -->
		<div id="main">
			<div class="inner">
				<div class="title">
					<h1><%=contents.get(0).getC_name()%></h1>
					<h3>
						컨텐츠 :
						<%=contents.get(0).getC_content1()%>
						/
						<%=contents.get(0).getC_content2()%>
						/
						<%=contents.get(0).getC_content3()%>
					</h3>
					<%
					if (login == null) {
					%>
					<h3>
						파티 생성 및 가입 기능은 <a href="Member.jsp"><button
								style="width: 120px; height: 50px; justify-content: center;">로그인</button></a>
						후 이용하실 수 있습니다.
						<%
					} else if (login != null) {
					if (login.getG_name() == null) {
					%>
						<a href="IG.jsp?c_name=<%=c_name%>"><button>파티생성</button> </a>
						<%
						}
						}
						%>
					</h3>
				</div>
				<div class="content">
					<section class="tiles">
						<%
						if (groups != null) {
							int cnt = 0;
							int[] dealers = new int[groups.size()];
							int[] tankers = new int[groups.size()];
							int[] healers = new int[groups.size()];
							for (int i = 0; i < groups.size(); i++) {
								cnt++;
								List<MemberDTO> raids = new MemberDAO().raidMemberList(groups.get(i).getG_name());
								for (int j = 0; j < raids.size(); j++) {
							if (raids.get(j).getM_position().equals("딜러")) {
								dealers[i]++;
							} else if (raids.get(j).getM_position().equals("탱커")) {
								tankers[i]++;
							} else if (raids.get(j).getM_position().equals("힐러")) {
								healers[i]++;
							}
								}
						%>
						<article class="style<%=cnt%>"
							style="width: 225px; height: 225px;">
							<span class="image"> <img
								src="./groupfiles/<%=groups.get(i).getG_file()%>" width="225px"
								height="225px" />
							</span> <a href="GroupDetail.jsp?g_name=<%=groups.get(i).getG_name()%>">
								<h2 style="color: lightgray;">
									<%=groups.get(i).getG_name()%>
									<br>
									<%=groups.get(i).getG_content()%>
								</h2>
								<div class="content">
									<p>
										파티장 :
										<%=groups.get(i).getM_id()%>
										<br> 인원 <br> 딜러 :
										<%=dealers[i]%>
										/
										<%=groups.get(i).getM_deal()%>
										<br> 탱커 :
										<%=tankers[i]%>
										/
										<%=groups.get(i).getM_tank()%>
										<br> 힐러 :
										<%=healers[i]%>
										/
										<%=groups.get(i).getM_heal()%>
									</p>
								</div>
							</a>
						</article>
						<%
						}
						}
						%>
					</section>
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
	<script src="MainAssets/js/jquery.min.js"></script>
	<script src="MainAssets/js/jquery.scrolly.min.js"></script>
	<script src="MainAssets/js/jquery.scrollex.min.js"></script>
	<script src="MainAssets/js/browser.min.js"></script>
	<script src="MainAssets/js/breakpoints.min.js"></script>
	<script src="MainAssets/js/util.js"></script>
	<script src="MainAssets/js/main.js"></script>
</body>
</html>