<%@page import="com.project.model.MessageDTO"%>
<%@page import="com.project.model.MessageDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.project.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	function Message() {
		window
				.open(
						"Message.jsp",
						"Message",
						"width=400,height=500,history=no,resizable=no,status=no,scrollbars=yes,menubar=no")
	}
</script>

<link rel="stylesheet" href="assets/css/Message.css" />


<title>Insert title here</title>
</head>
<%
MemberDTO login = (MemberDTO) session.getAttribute("login");
if (login != null) {
	session.setAttribute("g_name", login.getG_name());
}
List<MessageDTO> messages = new MessageDAO().showMessage(login.getM_nick()); 
%>
<div>
	<section id="two">
		<div class="inner">
			<header class="major">
				<h2>쪽지함</h2>
			</header>
			<p></p>
			<ul class="actions">
				<li><%=login.getM_nick()%>님에게 온 메세지</li>
				<li><a href="DelAllService.do?email=<%=login.getM_nick()%>" class="button next scrolly">전체삭제하기</a></li>
				<li><a href="sendMessage.jsp">쪽지보내기</a></li>
			</ul>
			<div>
				<ul>
				<!-- 나에게 온 메시지 출력 -->
					<li>
						<span class="col1">번호</span>
						<span class="col2">제목</span>
						<span class="col3">보낸사람</span>
						<span class="col4">보낸시간</span>
					</li>
					
					<li>
						<span class="col1"></span>
						<span class="col2">제목</span>
						<span class="col3">보낸사람</span>
						<span class="col4">보낸시간</span>
					</li>
				</ul>
			</div>
		</div>
	</section>
</div>

</html>