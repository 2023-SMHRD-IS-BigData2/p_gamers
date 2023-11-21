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
	List<ContentDTO> contents = new ContentDAO().contentList();
	int cnt = 0;
	%>
	<div class="member_container">
		<div class="main_top">
			<div class="member-wrapper">
				<h2>컨텐츠 정보</h2>
				<table id="allMember">
					<tr>
						<th width="150" style="text-align: center;">구분</th>
						<th width="150" style="text-align: center;">컨텐츠명</th>
						<th width="150" style="text-align: center;">비고</th>
					</tr>
					<%
					if (contents != null) {
					%>
					<%
					for (int i = 0; i < contents.size(); i++) {
						cnt++;
					%>
					<tr>
						<td width="150" style="text-align: center;"><%=cnt%></td>
						<td width="150" style="text-align: center;"><%=contents.get(i).getC_name()%></td>
						<td width="150" style="text-align: center;"><a
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
						<td colspan="3" width="150" style="text-align: center;"><a
							href="IC.jsp"><button>생성</button></a> <a href="GamersMain.jsp"><button>
									홈</button></a></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>