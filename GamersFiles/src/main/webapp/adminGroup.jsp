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
	List<GroupDTO> groups = new GroupDAO().groupList();
	int cnt = 0;
	%>
	<div class="member_container">
		<div class="main_top">
			<div class="member-wrapper">
				<h2>회원 정보</h2>
				<table id="allMember">
					<tr>
						<th width="150" style="text-align: center;">구분</th>
						<th width="150" style="text-align: center;">파티명</th>
						<th width="150" style="text-align: center;">파티장</th>
						<th width="150" style="text-align: center;">레이드</th>
						<th width="150" style="text-align: center;">현재인원</th>
						<th width="150" style="text-align: center;">비고</th>
					</tr>
					<%
					if (groups != null) {
						for (int i = 0; i < groups.size(); i++) {
							cnt++;
					%>
					<tr>
						<td width="150" style="text-align: center;"><%=cnt%></td>
						<td width="150" style="text-align: center;"><%=groups.get(i).getG_name()%></td>
						<td width="150" style="text-align: center;"><%=groups.get(i).getM_id()%></td>
						<td width="150" style="text-align: center;"><%=groups.get(i).getG_content()%></td>
						<%
						int length = new MemberDAO().countGroup(groups.get(i).getG_name());
						%>
						<td width="150" style="text-align: center;"><%=length%></td>
						<td width="150" style="text-align: center;"><a
							href="DGService.do?g_name=<%=groups.get(i).getG_name()%>&m_id=<%=groups.get(i).getM_id()%>"><button>삭제</button></a></td>
					</tr>
					<%
					}
					}
					%>
					<tr>
						<td colspan="6" width="150" style="text-align: center;"><a
							href="GamersMain.jsp"><button>홈</button></a></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>