<%@page import="com.project.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="assets/css/Message.css" />
<title>Insert title here</title>
</head>
<%
MemberDTO login = (MemberDTO) session.getAttribute("login");
if (login != null) {
	session.setAttribute("g_name", login.getG_name());
}
%>
<body>
<section id="two">
	<div class="inner">
		<header class="major">
			<h2 id="tit">쪽지 보내기</h2>
		</header>
	</div>
</section>
<!-- Contact -->
<section id="contact">
	<div class="inner">
		<section>
			<form method="post" action="MessageService.do">
				<div id="write_msg" class="fields">
					<div>
						<span class="col1">보내는 사람</span> <span class="col2"><%=login.getM_nick()%></span>
					</div>
					<div class="field half">
						<span class="col1">받는 사람</span> <span class="col2"><input
							type="text" name="recipient" id="recipient" /></span>
					</div>
					<div class="field half">
						<span class="col1">제목</span> <span class="col2"><input
							type="text" name="title" id="title" /></span>
					</div>
					<div id="textarea" class="field">
						<span class="col1">내용</span>
						<span class="col2"><textarea name="content" id="content" rows="6"></textarea></span>
					</div>
				</div>
				
					<span id=submit><input type="submit" value="메세지 보내기" class="primary" /><input type="reset" value="지우기" /></span>
			</form>
		</section>
	</div>
</section>
</body>
</html>