<%@page import="com.project.model.GroupDTO"%>
<%@page import="com.project.model.GroupDAO"%>
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
<title>파티 조회</title>
<link rel="stylesheet" href="MainAssets/css/main.css" />
<link rel="stylesheet" href="menu.css" />
<style type="text/css">
* {
	padding: 0;
	margin: 0;
	border: none;
	text-align: center;
}

.group-wrapper {
	display: inline-block;
	padding: 40px;
	box-sizing: border-box;
}

.group-wrapper>h2 {
	font-size: 24px;
	color: #6A24FE;
	margin-bottom: 20px;
}

table#allGroup {
	align-content: center;
	text-align: center;
}

table#allGroup th {
	text-align: center;
}

table#allGroup td {
	text-align: center;
	font-size: 14px;
}
</style>
</head>
<body>
	<%
	List<GroupDTO> groups = new GroupDAO().groupList();
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
			<div class="group-wrapper">
				<h2>회원 정보</h2>
				<table id="allGroup">
					<tr>
						<th>구분</th>
						<th>파티명</th>
						<th>파티장</th>
						<th>레이드</th>
						<th>현재인원</th>
						<th>비고</th>
					</tr>
					<%
					if (groups != null) {
						for (int i = 0; i < groups.size(); i++) {
							cnt++;
					%>
					<tr>
						<td><%=cnt%></td>
						<td><%=groups.get(i).getG_name()%></td>
						<td><%=groups.get(i).getM_id()%></td>
						<td><%=groups.get(i).getG_content()%></td>
						<%
						int length = new MemberDAO().countGroup(groups.get(i).getG_name());
						%>
						<td><%=length%></td>
						<td><a
							href="DGService.do?g_name=<%=groups.get(i).getG_name()%>&m_id=<%=groups.get(i).getM_id()%>"><button>삭제</button></a></td>
					</tr>
					<%
					}
					}
					%>
					<tr>
						<td colspan="6"><a
							href="GamersMain.jsp"><button>홈</button></a></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>