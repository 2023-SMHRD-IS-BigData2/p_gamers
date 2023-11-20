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
#modal.modal-overlay {
	display: none;
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	background: rgba(255, 255, 255, 0.25);
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(10px);
	-webkit-backdrop-filter: blur(10px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
}

#modal .modal-window {
	background: gray;
	box-shadow: 0 8px 32px 0 rgba(100, 100, 100);
	backdrop-filter: blur(13.5px);
	-webkit-backdrop-filter: blur(13.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	width: 600px;
	height: 600px;
	position: relative;
	top: -100px;
	padding: 10px;
}

#modal .title {
	padding-left: 10px;
	display: inline;
	text-shadow: 1px 1px 2px gray;
	color: white;
}

#modal .title h2 {
	display: inline;
}

#modal .close-area {
	display: inline;
	float: right;
	padding-right: 10px;
	cursor: pointer;
	text-shadow: 1px 1px 2px gray;
	color: white;
}

#modal .group-content {
	margin-top: 20px;
	padding: 0px 10px;
	text-shadow: 1px 1px 2px gray;
	color: white;
}
</style>
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
	MemberDTO logindto = (MemberDTO) session.getAttribute("login");
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
		if (logindto == null) {
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
		} else if (logindto.getM_id().equals("admin")) {
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
				<li><a href="index.html"> 홈 </a></li>
				<li><a href="Update.jsp?m_email=<%=logindto.getM_id()%>">
						내 정보 수정 </a></li>
				<li><a href="Member.jsp"> 내 파티 </a></li>
			</ul>
		</nav>
		<%
		}
		%>
		<!-- Main -->

		<%
		request.setCharacterEncoding("utf-8");
		int c_num = Integer.parseInt(request.getParameter("c_num"));
		String c_name = new ContentDAO().selectContent(c_num);
		%>
		<div id="main">
			<div class="inner">
				<header>
					<h1><%=c_num
					%>번
						<%=c_name%>
						레이드 페이지입니다.
						</h1>
					<p>파티를 확인하고 조건에 맞는 파티를 찾아 가입을 신청해보세요. <a href="IG.jsp?c_num=<%=c_num%>&c_name=<%=c_name%>"> <button> 파티생성 </button></a></p>
				</header>
				<section class="tiles">
				
				
					<article class="style1">
						<span class="image"> <img src="images/con01.jpg" alt="" />
						</span><a id="btn-modal">
							<h2>그룹명</h2>
							<div class="content">
								<p>그룹장명</p>
							</div>
						</a>
					</article>
					
					
					<article class="style2">
						<span class="image"> <img src="images/con02.jpg" alt="" />
						</span> <a href="generic.html">
							<h2>그룹명</h2>
							<div class="content">
								<p>그룹장명</p>
							</div>
						</a>
					</article>
					<article class="style3">
						<span class="image"> <img src="images/con03.jpg" alt="" />
						</span> <a href="generic.html">
							<h2>그룹명</h2>
							<div class="content">
								<p>그룹장명</p>
							</div>
						</a>
					</article>
					<article class="style4">
						<span class="image"> <img src="images/con04.jpg" alt="" />
						</span> <a href="generic.html">
							<h2>그룹명</h2>
							<div class="content">
								<p>그룹장명</p>
							</div>
						</a>
					</article>
					<article class="style5">
						<span class="image"> <img src="images/con05.jpg" alt="" />
						</span> <a href="generic.html">
							<h2>그룹명</h2>
							<div class="content">
								<p>그룹장명</p>
							</div>
						</a>
					</article>
					<article class="style6">
						<span class="image"> <img src="images/pic06.jpg" alt="" />
						</span> <a href="generic.html">
							<h2>Veroeros</h2>
							<div class="content">
								<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor
									veroeros et feugiat.</p>
							</div>
						</a>
					</article>
					<article class="style2">
						<span class="image"> <img src="images/pic07.jpg" alt="" />
						</span> <a href="generic.html">
							<h2>Ipsum</h2>
							<div class="content">
								<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor
									veroeros et feugiat.</p>
							</div>
						</a>
					</article>
					<article class="style3">
						<span class="image"> <img src="images/pic08.jpg" alt="" />
						</span> <a href="generic.html">
							<h2>Dolor</h2>
							<div class="content">
								<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor
									veroeros et feugiat.</p>
							</div>
						</a>
					</article>
					<article class="style1">
						<span class="image"> <img src="images/pic09.jpg" alt="" />
						</span> <a href="generic.html">
							<h2>Nullam</h2>
							<div class="content">
								<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor
									veroeros et feugiat.</p>
							</div>
						</a>
					</article>
					<article class="style5">
						<span class="image"> <img src="images/pic10.jpg" alt="" />
						</span> <a href="generic.html">
							<h2>Ultricies</h2>
							<div class="content">
								<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor
									veroeros et feugiat.</p>
							</div>
						</a>
					</article>
					<article class="style6">
						<span class="image"> <img src="images/pic11.jpg" alt="" />
						</span> <a href="generic.html">
							<h2>Dictum</h2>
							<div class="content">
								<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor
									veroeros et feugiat.</p>
							</div>
						</a>
					</article>
					<article class="style4">
						<span class="image"> <img src="images/pic12.jpg" alt="" />
						</span> <a href="generic.html">
							<h2>Pretium</h2>
							<div class="content">
								<p>Sed nisl arcu euismod sit amet nisi lorem etiam dolor
									veroeros et feugiat.</p>
							</div>
						</a>
					</article>
				</section>
			</div>
		</div>
		<div id="modal" class="modal-overlay">
			<div class="modal-window">
				<div class="title">
					<h2>게이머즈</h2>
				</div>
				<div class="close-area">X</div>
				<div class="group-content">
					<iframe src="groupDetail.jsp?g_num="
						style="width: 555px; height: 500px; content: center;"></iframe>
				</div>
			</div>
		</div>
		<!-- Footer -->
		<footer id="footer">
			<div class="inner">
				<section>
					<h2>Get in touch</h2>
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
					<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
				</ul>
			</div>
		</footer>

	</div>

	<!-- Scripts -->
	<script type="text/javascript">
const modal = document.getElementById("modal")
const btnModal = document.getElementById("btn-modal")
btnModal.addEventListener("click", e => {
	modal.style.display = "flex"
	const text = document.getElementById("h2")
	text.style.cssText = "font-size = 0px"
})
const closeBtn = modal.querySelector(".close-area")
closeBtn.addEventListener("click", e => {
    modal.style.display = "none"
})
modal.addEventListener("click", e => {
    const evTarget = e.target
    if(evTarget.classList.contains("modal-overlay")) {
        modal.style.display = "none"
    }
})
	</script>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>