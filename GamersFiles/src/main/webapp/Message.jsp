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
			<li><a href="DelAllService.do?email="
				class="button next scrolly">전체삭제하기</a>
			</li>
			<li><a href="sendMessage.jsp">쪽지보내기</a></li>
		</ul>
		<table style="text-align: center;" class="tables">
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

</html>