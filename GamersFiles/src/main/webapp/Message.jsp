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
<style type="text/css">

</style>
<title>Insert title here</title>
</head>
	<%
	MemberDTO login = (MemberDTO) session.getAttribute("login");
	if (login != null) {
		session.setAttribute("g_name", login.getG_name());
	}
	%>
	<section id="two">
		<div class="inner">
			<header class="major">
				<h2>받은 메세지함</h2>
			</header>
			<p></p>
			<ul class="actions">
				<li><%=login.getM_nick()%>님에게 온 메세지</li>
				<li><a href="DelAllService.do?email="
					class="button next scrolly">전체삭제하기</a></li>
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
	<!-- Contact -->
	<section id="contact">
		<div class="inner">
			<section>S
				<form method="post" action="MessageService.do">
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
</html>