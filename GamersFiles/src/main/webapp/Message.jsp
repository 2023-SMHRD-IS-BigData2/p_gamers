<%@page import="java.util.Collections"%>
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
<link rel="stylesheet" href="MainAssets/css/Message.css?after" />
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
<body>
<%
MemberDTO login = (MemberDTO) session.getAttribute("login");
if (login != null) {
	session.setAttribute("g_name", login.getG_name());
}
List<MessageDTO> messages = new MessageDAO().showMessage(login.getM_id()); 

/* 페이지당 10개의 쪽지 출력 */
int messagesPerPage = 10; 

/* 쪽지를 페이지별로 나눔 */
int totalMessages = messages.size();
int totalPages = (int) Math.ceil((double) totalMessages / messagesPerPage);

/* 현재 페이지 번호를 요청 매개변수 선언 */
int currentPage = 1;
String pageParam = request.getParameter("page");
if (pageParam != null) {
    currentPage = Integer.parseInt(pageParam);
}

 /* 현재 페이지의 시작 및 끝 인덱스 */
int startIndex = (currentPage - 1) * messagesPerPage;
int endIndex = Math.min(startIndex + messagesPerPage, totalMessages);

/* 현재 페이지의 쪽지 가져오기 */
List<MessageDTO> messagesOnPage = messages.subList(startIndex, endIndex);
%>

<div>
	<section id="two">
		<div class="inner">
			<header class="major">
				<h2>쪽지함</h2>
			</header>
			<p></p>
			<ul>
			<li class="actions">
			</li>
			</ul>
			<div id="message_box">
				<h3><%=login.getM_nick()%>님이 받은 쪽지				
				
				<span class="col1"><a href="sendMessage.jsp">쪽지보내기</a></span><span class="col2"><a href="DelMessageService.do?M_id=<%=login.getM_id()%>" class="button next scrolly">전체삭제하기</a></span>
				</h3>
					<!-- 쪽지 리스트가 출력되는 영역(게시판 모양) -->
					<div>
					<div id="message">
						<div class="tit">
							<span class="col1">번호</span>
							<span class="col2" id="message_title">제목</span>
							<span class="col3">보낸이</span>
							<span class="col4">발송시간</span>
							<span class="col5">비고</span>
						</div>
						 <% for (int i = 0; i < messagesOnPage.size(); i++) { %>
						<div class="cuntent">
							<span class="col1"><%= startIndex + i + 1%></span>
							<span class="col2"><a href="MessageDetail.jsp?E_num=<%=messagesOnPage.get(i).getE_num()%>"><%=messagesOnPage.get(i).getE_title() %></a></span>
							<span class="col3"><%=messagesOnPage.get(i).getE_sender() %></span>
							<span class="col4"><%=messagesOnPage.get(i).getE_date().substring(5, 16)%></span>
							<span id="del" class="col5"><a href="DelMessageService.do?e_num=<%=messagesOnPage.get(i).getE_num()%>">🗑</a> </span>
						</div>
						<%} %>
					</div>
					    <%-- 페이지네이션 링크 --%>
					    <div id="pagination">
					        <% if (currentPage > 1) { %>
					            <a href="?page=<%= currentPage - 1 %>">이전</a>
					        <% } %>

					        <% for (int i = 1; i <= totalPages; i++) { %>
					            <a href="?page=<%= i %>" <%= i == currentPage ? "class='active'" : "" %>>[<%= i %>]</a>
					        <% } %>

					        <% if (currentPage < totalPages) { %>
					            <a href="?page=<%= currentPage + 1 %>">다음</a>
					        <% } %>
					    </div>
					</div>
				</div>
					
		</div>

	</section>
</div>

</body>
</html>