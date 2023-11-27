<%@page import="com.project.model.ContentDAO"%>
<%@page import="com.project.model.ContentDTO"%>
<%@page import="com.project.model.MemberDAO"%>
<%@page import="com.project.model.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="MainAssets/css/main.css" />
<link rel="stylesheet" href="menu.css" />
<title>회원 조회</title>
<style type="text/css">
* {
	padding: 0;
	margin: 0;
	border: none;
	text-align: center;
}

.member-wrapper {
	display: inline-block;
	padding: 40px;
	box-sizing: border-box;
}

.member-wrapper>h2 {
	font-size: 24px;
	color: #6A24FE;
	margin-bottom: 20px;
}

table#allMember {
	align-content: center;
	text-align: center;
}

table#allMember th {
	text-align: center;
}

table#allMember td {
	text-align: center;
	font-size: 14px;
}
</style>
</head>
<body>
	<%
	List<MemberDTO> members = new MemberDAO().memberList();
	int cnt = 0;
	MemberDTO login = (MemberDTO) session.getAttribute("login");
	if (login != null) {
		session.setAttribute("g_name", login.getG_name());
		session.setAttribute("m_nick", login.getM_nick());
		session.setAttribute("m_id", login.getM_id());
	}
	%>
	<div id="wrapper">
		<!-- Header -->
		<header id="header" class="alt">
			<a href="GamersMain.jsp" class="logo"><strong>게이머즈</strong></a>
			<%
			if (login != null) {
				if (login.getM_id().equals("admin")) {
			%>
			<nav>
				<a href="adminMember.jsp"> 회원 조회 </a> <a href="adminGroup.jsp">
					파티 조회 </a> <a href="adminContent.jsp"> 레이드 조회 </a> <a
					href="LogoutService.do"> 로그아웃 </a>
			</nav>
			<%
			} else {
			%>
			<nav>
				<a href="#none"
					onclick="window.open('Message.jsp','new','scrollbars=yes,resizable=no width=700 height=600, left=1200,top=600');return false">쪽지함</a>
				<a href="UM.jsp"> 내 정보 수정 </a>
				<%
				if (login.getG_name() != null) {
				%>
				<a href="calendar.jsp"> 내 파티 </a>
				<%
				}
				%>
				<a href="LogoutService.do"> 로그아웃 </a>
			</nav>
			<%
			}
			} else {
			%>
			<nav>
				<a href="Member.jsp"> 로그인&회원가입 </a>
			</nav>
			<%
			}
			%>
		</header>
	</div>
	<div class="member_container">
		<div class="main_top">
			<div class="member-wrapper">
				<h2>회원 정보</h2>
				<table id="allMember">
					<tr>
						<th>구분</th>
						<th>아이디</th>
						<th>패스워드</th>
						<th>닉네임</th>
						<th>파티명</th>
						<th>역할</th>
						<th>직업</th>
						<th>비고</th>
					</tr>
					<%
					if (members != null) {
						for (int i = 0; i < members.size(); i++) {
							cnt++;
					%>
					<tr>
						<td><%=cnt%></td>
						<td><%=members.get(i).getM_id()%></td>
						<td><%=members.get(i).getM_pw()%></td>
						<td><%=members.get(i).getM_nick()%></td>
						<td><%=members.get(i).getG_name() %></td>
						<td><%=members.get(i).getM_position()%></td>
						<td><%=members.get(i).getM_class()%></td>
						<td><a href="DMService.do?m_id=<%=members.get(i).getM_id()%>"><button>삭제</button></a></td>
					</tr>
					<%
						}
					}
					%>
					<tr>
						<td colspan="8"> <a href="GamersMain.jsp"><button> 홈 </button></a></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>