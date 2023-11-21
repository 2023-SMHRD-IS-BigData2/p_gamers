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
	MemberDTO login = (MemberDTO)session.getAttribute("login");
	%>
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Header -->
		<header id="header" class="alt">
			<a href="GamersMain.jsp" class="logo"><strong>게이머즈</strong></a>
			<%
			if (login == null) {
			%>
			<nav>
				<a href="Member.jsp"> 로그인&회원가입 </a>
			</nav>
			<%
			} else {
			%>
			<nav>
				<a href="Member.jsp"> 내 정보 수정 </a>
				<a href="calendar.jsp"> 내 파티 </a>
			</nav>
			<%
			}
			%>
		</header>
		<!-- Banner -->
		<section id="banner" class="major">
			<%
			if(login==null){
			%>
			<div id="inner" class="inner">
				<header class="major">
					<h1>안녕하세요. 게이머즈입니다.</h1>
				</header>
				<div class="content">
					<p>
						레이드를 선택해 파티를 찾아보세요. <br /> 회원가입 시 더 많은 기능을 사용하실 수 있습니다.
					</p>
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
					<h1><%=login.getM_nick() %>님 환영합니다.</h1>
				</header>
				<div class="content">
					<p>
						레이드를 선택해 파티를 찾아보세요. <br /> 회원가입 시 더 많은 기능을 사용하실 수 있습니다.
					</p>
					<ul class="actions">
						<li><a href="#one" class="button next scrolly">컨텐츠 보기</a></li>
					</ul>
				</div>
			</div>
			<%} %>
		</section>
		<!-- Main -->
		<div id="main">
			<!-- One -->
			<section id="one" class="tiles">
				<article>
					<span class="image" style="display: inline-block;"> <img
						src="images/신생에오르제아_타이틀.png" alt="" width="auto" height="auto" />
					</span>
					<header class="major">
						<h3>
							<a href="contentDetail.jsp" class="link">신생 에오르제아</a>
						</h3>
						<p>대미궁 바하무트</p>
					</header>
				</article>
				<article>
					<span class="image" style="display: inline-block;"> <img
						src="images/창천의이슈가르드_타이틀.png" alt="" width="auto" height="auto" />
					</span>
					<header class="major">
						<h3>
							<a href="landing.html" class="link">창천의 이슈가르드</a>
						</h3>
						<p>기공성 알렉산더</p>
					</header>
				</article>
				<article>
					<span class="image" style="display: inline-block;"> <img
						src="images/홍련의해방자_타이틀.png" alt="" width="auto" height="auto" />
					</span>
					<header class="major">
						<h3>
							<a href="landing.html" class="link">홍련의 해방자</a>
						</h3>
						<p>차원의 틈 오메가</p>
					</header>
				</article>
				<article>
					<span class="image" style="display: inline-block;"> <img
						src="images/칠흑의반역자_타이틀.png" alt="" width="auto" height="auto" />
					</span>
					<header class="major">
						<h3>
							<a href="landing.html" class="link">칠흑의 반역자</a>
						</h3>
						<p>희망의 낙원 에덴</p>
					</header>
				</article>
				<article>
					<span class="image" style="display: inline-block;"> <img
						src="images/효월의종언_타이틀.png" alt="" width="auto" height="auto" />
					</span>
					<header class="major">
						<h3>
							<a href="landing.html" class="link">효월의 종언</a>
						</h3>
						<p>마의 전당 판데모니움</p>
					</header>
				</article>
				<article>
					<span class="image"> <img src="images/pic06.jpg" alt="" />
					</span>
					<header class="major">
						<h3>
							<a href="landing.html" class="link">절 난이도</a>
						</h3>
						<p>토벌전 및 검증전</p>
					</header>
				</article>
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
	<script type="text/javascript">
		function parentsUrl(url) {
			location.href = url;
		}
	</script>
</body>
</html>