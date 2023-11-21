<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>게이머즈</title>
<style type="text/css">
#login {
	width: 100%;
	height: 100%;
}

#login.login-overlay {
	display: none;
	position: relative;
	left: 0;
	top: 0;
	flex-direction: column;
	align-items: flex-end;
	justify-content: center;
	border-radius: 10px;
	margin-right: 50px;
}

#login .login-window {
	background: white;
	border-radius: 10px;
	width: 600px;
	height: 450px;
	position: relative;
	top: 10px;
	padding: 10px;
	text-align: center;
}

#login .title {
	padding-left: 10px;
	display: inline;
	color: black;
}

#login .title h2 {
	display: inline;
	color: black;
}

#login .close-login {
	display: inline;
	float: right;
	padding-right: 10px;
	cursor: pointer;
	color: black;
}

#login .group-content {
	padding: 0px 10px;
	color: white;
}

#join {
	width: 100%;
	height: 100%;
}

#join.join-overlay {
	display: none;
	position: relative;
	left: 0;
	top: 0;
	flex-direction: column;
	align-items: flex-end;
	justify-content: center;
	border-radius: 10px;
	margin-right: 50px;
}

#join .join-window {
	background: white;
	border-radius: 10px;
	width: 600px;
	height: 550px;
	position: relative;
	top: 10px;
	padding: 10px;
	text-align: center;
}

#join .title {
	padding-left: 10px;
	display: inline;
	color: black;
}

#join .title h2 {
	display: inline;
	color: black;
}

#join .close-join {
	display: inline;
	float: right;
	padding-right: 10px;
	cursor: pointer;
	color: black;
}

#join .group-content {
	padding: 0px 10px;
	color: white;
}
</style>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="MainAssets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="MainAssets/css/noscript.css" />
</noscript>
</head>
<body class="is-preload">
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Header -->
		<header id="header" class="alt">
			<a href="GamersMain.jsp" class="logo"><strong>게이머즈</strong></a>
			<nav>
				<a id="btn-login"> 로그인 </a>
				<a id="btn-join"> 회원가입 </a>
				<a> Menu </a>
			</nav>
		</header>
		<!-- Banner -->
		<section id="banner" class="major">
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
			<div id="login" class="login-overlay">
				<div class="login-window" style="align-content: center;">
					<div class="close-login">X</div>
					<iframe src="SM.jsp" style="width: 100%; height: 100%;"></iframe>
				</div>
			</div>
			<div id="join" class="join-overlay">
				<div class="join-window" style="align-content: center;">
					<div class="close-join">X</div>
					<iframe src="IM.jsp" style="width: 100%; height: 100%;"></iframe>
				</div>
			</div>
		</section>
		<!-- Main -->
		<div id="main">
			<!-- One -->
			<section id="one" class="tiles">
				<article>
					<span class="image"> <img src="images/pic01.jpg" alt="" />
					</span>
					<header class="major">
						<h3>
							<a href="landing.html" class="link">신생 에오르제아</a>
						</h3>
						<p>대미궁 바하무트</p>
					</header>
				</article>
				<article>
					<span class="image"> <img src="images/pic02.jpg" alt="" />
					</span>
					<header class="major">
						<h3>
							<a href="landing.html" class="link">창천의 이슈가르드</a>
						</h3>
						<p>기공성 알렉산더</p>
					</header>
				</article>
				<article>
					<span class="image"> <img src="images/pic03.jpg" alt="" />
					</span>
					<header class="major">
						<h3>
							<a href="landing.html" class="link">홍련의 해방자</a>
						</h3>
						<p>차원의 틈 오메가</p>
					</header>
				</article>
				<article>
					<span class="image"> <img src="images/pic04.jpg" alt="" />
					</span>
					<header class="major">
						<h3>
							<a href="landing.html" class="link">칠흑의 반역자</a>
						</h3>
						<p>희망의 낙원 에덴</p>
					</header>
				</article>
				<article>
					<span class="image"> <img src="images/pic05.jpg" alt="" />
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
				<section class="split">
					<section>
						<div class="contact-method">
							<span class="icon solid alt fa-envelope"></span>
							<h3>ID</h3>
							<a href="#">information@untitled.tld</a>
						</div>
					</section>
					<section>
						<div class="contact-method">
							<span class="icon solid alt fa-phone"></span>
							<h3>닉네임</h3>
							<span>(000) 000-0000 x12387</span>
						</div>
					</section>
					<section>
						<div class="contact-method">
							<span class="icon solid alt fa-home"></span>
							<h3>파티명</h3>
							<span>1234 Somewhere Road #5432<br /> Nashville, TN 00000<br />
								United States of America
							</span>
						</div>
					</section>
				</section>
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
	<script src="login.js"></script>
	<script src="join.js"></script>

</body>
</html>