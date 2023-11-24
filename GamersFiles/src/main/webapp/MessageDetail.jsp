<%@page import="com.project.model.MessageDAO"%>
<%@page import="com.project.model.MessageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="assets/css/Message.css" />
		<title>Forty by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assetsBoard/css/main.css" />
		<link rel="stylesheet" href="assetsBoard/css/board.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>
<body>
			<!-- 메시지 확인 -->	
			<%
				// 메시지 식별할수 있는 번호
				int E_num = Integer.parseInt(request.getParameter("E_num"));
				MessageDTO message = new MessageDAO().detailMessage(E_num);
			%>
		
<section id="two">
	<div class="inner">
		<header class="major">
			<h2 id="tit">쪽지 상세내용</h2>
		</header>
	</div>
</section>
				<section id="message_detail">
					<div id="detail_titel">
						<span class="col1">제목</span>
						<span class="col2"><%=message.getE_title() %></span>
						<span class="col3"><%=message.getE_date().substring(5,16) %></span>
					</div>
					<div>
						<span class="col1">보낸이</span>
						<span class="col2"><%=message.getE_recipient() %></span>
					</div>
					<div id="detail_content">
						<span class="col1">내용</span>
						<span class="col2"><%=message.getE_content() %></span>
					</div>
					<div id="detail_re">
						<span class="col1"></span>
						<span class="col2"></span>
						<span class="col3"><a href="Message.jsp"><button>돌아가기</button></a></span>
						<span></span>
					</div>
			</div>
			</section>
			</setion>
			<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="assets/js/main.js"></script>
</body>
</html>