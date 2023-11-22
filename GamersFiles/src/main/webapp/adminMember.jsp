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
<title>회원 조회</title>
<style type="text/css">
* {
	padding: 0;
	margin: 0;
	border: none;
	text-align: center;
}

body {
	font-size: 14px;
	font-family: 'Roboto', sans-serif;
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
	width: 150;
}
</style>
</head>
<body>
	<%
	List<MemberDTO> members = new MemberDAO().memberList();
	int cnt = 0;
	%>
	<div class="member_container">
		<div class="main_top">
			<div class="member-wrapper">
				<h2>회원 정보</h2>
				<table id="allMember">
					<tr>
						<th width="150" style="text-align: center;">구분</th>
						<th width="150" style="text-align: center;">아이디</th>
						<th width="150" style="text-align: center;">패스워드</th>
						<th width="150" style="text-align: center;">닉네임</th>
						<th width="150" style="text-align: center;">파티명</th>
						<th width="150" style="text-align: center;">역할</th>
						<th width="150" style="text-align: center;">비고</th>
					</tr>
					<%
					if (members != null) {
						for (int i = 0; i < members.size(); i++) {
							cnt++;
					%>
					<tr>
						<td width="150" style="text-align: center;"><%=cnt%></td>
						<td width="150" style="text-align: center;"><%=members.get(i).getM_id()%></td>
						<td width="150" style="text-align: center;"><%=members.get(i).getM_pw()%></td>
						<td width="150" style="text-align: center;"><%=members.get(i).getM_nick()%></td>
						<td width="150" style="text-align: center;"><%=members.get(i).getG_name() %></td>
						<td width="150" style="text-align: center;"><%=members.get(i).getM_position()%></td>
						<td width="150" style="text-align: center;"><a
							href="DMService.do?m_id=<%=members.get(i).getM_id()%>"><button>삭제</button></a></td>
					</tr>
					<%
						}
					}
					%>
					<tr>
						<td colspan="7" width="150" style="text-align: center;">
						<a href="GamersMain.jsp"><button> 홈 </button></a></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>