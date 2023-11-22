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

.tiles {
	margin-left: auto;
	margin-right: auto;
	margin-bottom: auto;
}

.tiles>article {
	width: 200px;
	height: 200px;
	margin-left: auto;
	margin-bottom: auto;
}

.tiles>article>a {
	width: 200px;
	height: 200px;
	display: inline-block;
}
a#btn-modal{
	display: flex;
	width: 200px;
	height: 200px;
	padding: 12.5px;
	justify-content: center;
	align-items: center;
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
	String c_name = request.getParameter("c_name");
	List<GroupDTO> groups = new GroupDAO().groupList(c_name);
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
				<li><a href="Update.jsp?m_email=<%=logindto.getM_id()%>"> 내
						정보 수정 </a></li>
				<li><a href="Member.jsp"> 내 파티 </a></li>
			</ul>
		</nav>
		<%
		}
		%>
		<!-- Main -->
		<div id="main">
			<div class="inner">
				<header>
					<h1>레이드 페이지입니다.</h1>
					<p>
						파티를 확인하고 조건에 맞는 파티를 찾아 가입을 신청해보세요. <a href="IG.jsp?c_name=<%=c_name%>">
							<button>파티생성</button>
						</a>
					</p>
				</header>
				<section class="tiles">
					<%
					if(groups != null){
						int cnt = 0;
						for(int i = 0; i < groups.size(); i++){
							cnt++;
					%>
					<article class="style<%=cnt%>" style="width: 225px; height: 225px;">
						<span class="image"> <img src="./groupfiles/<%=groups.get(i).getG_file()%>" alt=""
							width="225px" height="225px" />
						</span> <a id="btn-modal">
							<h2><%=groups.get(i).getG_name() %></h2>
							<div class="content">
								<p><%=groups.get(i).getM_id() %></p>
								<p>딜러2/4 힐러1/2 탱커2/2 </p>
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