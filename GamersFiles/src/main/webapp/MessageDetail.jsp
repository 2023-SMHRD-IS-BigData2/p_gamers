<%@page import="com.project.model.MessageDAO"%>
<%@page import="com.project.model.MessageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
			
			<div id = "board">
				<table id="list">
					<tr>
						<td>제목</td>
						<td><%=message.getE_title() %></td>
					</tr>
					<tr>
						<td>보낸사람</td>
						<td><%=message.getE_recipient() %></td>
					</tr>
					<tr>
						<td colspan="2">내용</td>
					</tr>
					<tr>
						<td colspan="2">
							<h3><%=message.getE_content() %></h3>
						</td>
					</tr>
					<tr>
						<td colspan="2"><a href="Message.jsp"><button>뒤로가기</button></a></td>
					</tr>
				</table>
			</div>
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