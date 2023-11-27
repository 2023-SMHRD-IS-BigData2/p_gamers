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
<title>컨텐츠 조회</title>
<link rel="stylesheet" href="MainAssets/css/main.css" />
<link rel="stylesheet" href="menu.css" />
<style type="text/css">
* {
	padding: 0;
	margin: 0;
	border: none;
	text-align: center;
}

.content-wrapper {
	display: inline-block;
	padding: 40px;
	box-sizing: border-box;
}

.content-wrapper>h2 {
	font-size: 24px;
	color: #6A24FE;
	margin-bottom: 20px;
}

table#allContent {
	align-content: center;
	text-align: center;
}

table#allContent th {
	text-align: center;
}

table#allContent td {
	text-align: center;
	font-size: 14px;
}
</style>
</head>
<body>
	<%
	List<ContentDTO> contents = new ContentDAO().contentList();
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
			<div class="content-wrapper">
				<h2>컨텐츠 정보</h2>
				<table id="allContent">
					<tr>
						<th style="text-align: center;">구분</th>
						<th style="text-align: center;">레이드명</th>
						<th style="text-align: center;">1번 컨텐츠</th>
						<th style="text-align: center;">2번 컨텐츠</th>
						<th style="text-align: center;">3번 컨텐츠</th>
						<th style="text-align: center;">4번 컨텐츠</th>
						<th style="text-align: center;">5번 컨텐츠</th>
						<th style="text-align: center;">비고</th>
					</tr>
					<%
					if (contents != null) {
					%>
					<%
					for (int i = 0; i < contents.size(); i++) {
						cnt++;
					%>
					<tr>
						<td style="text-align: center;"><%=cnt%></td>
						<td style="text-align: center;"><%=contents.get(i).getC_name()%></td>
						<td style="text-align: center;"><%=contents.get(i).getC_content1()%></td>
						<td style="text-align: center;"><%=contents.get(i).getC_content2()%></td>
						<td style="text-align: center;"><%=contents.get(i).getC_content3()%></td>
						<td style="text-align: center;"><%=contents.get(i).getC_content4()%></td>
						<td style="text-align: center;"><%=contents.get(i).getC_content5()%></td>
						<td style="text-align: center;"><a
							href="DelConService.do?c_name=<%=contents.get(i).getC_name()%>"><button>삭제</button></a></td>
					</tr>
					<%
					}
					%>
					<%
					} else if (contents == null) {
					%>
					<tr>
						<th colspan="3" width="150" style="text-align: center;">생성된
							컨텐츠가 없습니다.</th>
					</tr>
					<%
					}
					%>
					<tr>
						<td colspan="8" width="150" style="text-align: center;"><a
							href="IC.jsp"><button>생성</button></a> <a href="GamersMain.jsp"><button>
									홈</button></a></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>