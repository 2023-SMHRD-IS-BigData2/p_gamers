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
<link rel="stylesheet" href="assets/css/Message.css" />
<script>
	function Message() {
		window
				.open(
						"Message.jsp",
						"Message",
						"width=700,height=600,history=no,resizable=no,status=no,scrollbars=yes,menubar=no")
	}
</script>



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
				<li><a href="DelMessageService.do?M_id=<%=login.getM_nick()%>" class="button next scrolly">전체삭제하기</a></li>
				<li><a href="sendMessage.jsp">쪽지보내기</a></li>
			</ul>
			<div id="message_box">
				<h3><%=login.getM_nick()%>님에게 온 메세지</h3>
					<!-- 쪽지 리스트가 출력되는 영역(게시판 모양) -->
					<div>
					<ul id="message">
						<li>
							<span class="col1">번호</span>
							<span class="col2" id="message_title">제목</span>
							<span class="col3">보낸이</span>
							<span class="col4">등록일</span>
							<span class="col5">삭제</span>
						</li>
						<%for(int i = 0; i<messages.size(); i++) {%>
						<li>
							<span class="col1"><%=i+1%></span>
							<span class="col2"><a href="MessageDetail.jsp?E_num=<%=messages.get(i).getE_num()%>"><%=messages.get(i).getE_title() %></a></span>
							<span class="col3"><%=messages.get(i).getE_recipient() %></span>
							<span class="col4"><%=messages.get(i).getE_date()%></span>
							<span class="col5"><a href="DelMessageService.do?e_num=<%=messages.get(i).getE_num()%>">삭제</a> </span>
						</li>
						<%} %>
					</ul>
					</div>
			</div>
		</div>
	</section>
</div>
<style>

</style>
</html>