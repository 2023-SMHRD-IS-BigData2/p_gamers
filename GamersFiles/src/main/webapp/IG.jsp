<%@page import="com.project.model.ContentDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.project.model.ContentDAO"%>
<%@page import="com.project.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파티 생성</title>
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

.login-wrapper {
	display: inline-block;
	width: 400px;
	height: 350px;
	padding: 40px;
	box-sizing: border-box;
	width: 400px;
}

.login-wrapper>h2 {
	font-size: 24px;
	color: #6A24FE;
	margin-bottom: 20px;
}

#login-form>input {
	width: 100%;
	height: 48px;
	padding: 0 10px;
	box-sizing: border-box;
	margin-bottom: 16px;
	border-radius: 6px;
	background-color: #F8F8F8;
}

#login-form>input::placeholder {
	color: #D2D2D2;
}

#login-form>input[type="submit"] {
	color: #fff;
	font-size: 16px;
	background-color: #6A24FE;
	margin-top: 20px;
}

#login-form>input[type="checkbox"] {
	display: none;
}

#login-form>label {
	color: #999999;
}

#login-form input[type="checkbox"]+label {
	cursor: pointer;
	padding-left: 26px;
	background-image: url("checkbox.png");
	background-repeat: no-repeat;
	background-size: contain;
}

#login-form input[type="checkbox"]:checked+label {
	background-image: url("checkbox-active.png");
	background-repeat: no-repeat;
	background-size: contain;
}

.join-wrapper {
	display: inline-block;
	width: 400px;
	height: 350px;
	padding: 40px;
	box-sizing: border-box;
	width: 400px;
}

.join-wrapper>h2 {
	font-size: 24px;
	color: #6A24FE;
	margin-bottom: 20px;
}

#join-form>input {
	width: 100%;
	height: 48px;
	padding: 0 10px;
	box-sizing: border-box;
	margin-bottom: 16px;
	border-radius: 6px;
	background-color: #F8F8F8;
}

#join-form>input::placeholder {
	color: #D2D2D2;
}

#join-form>input[type="submit"] {
	color: #fff;
	font-size: 16px;
	background-color: #6A24FE;
	margin-top: 20px;
}

#join-form>input[type="checkbox"] {
	display: none;
}

#join-form>label {
	color: #999999;
}

#join-form input[type="checkbox"]+label {
	cursor: pointer;
	padding-left: 26px;
	background-image: url("checkbox.png");
	background-repeat: no-repeat;
	background-size: contain;
}

#join-form input[type="checkbox"]:checked+label {
	background-image: url("checkbox-active.png");
	background-repeat: no-repeat;
	background-size: contain;
}
</style>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String c_name = request.getParameter("c_name");
	MemberDTO login = (MemberDTO)session.getAttribute("login");
	List<ContentDTO> content = new ContentDAO().contentList2(c_name);
	%>
	<div class="member_container">
		<div class="main_top">
			<div class="login-wrapper">
				<h2>파티 정보</h2>
				<form method="post" action="IGService.do?m_id=<%=login.getM_id()%>&m_nick=<%=login.getM_nick()%>" id="login-form" enctype="multipart/form-data">
					<input type="text" name="g_name" placeholder="파티명">
					<input type="text" name="m_id" value="<%=login.getM_id() %>" readonly>
					<input type="text" name="c_name" value="<%=c_name %>" readonly>
					<input type="text" name="g_content" list="g_contentList" placeholder="컨텐츠">
					<datalist id="g_contentList">
						<option><%=content.get(0).getC_content1() %></option>
						<option><%=content.get(0).getC_content2() %></option>
						<option><%=content.get(0).getC_content3() %></option>
					</datalist>
					<input type="date" name="g_start" placeholder="시작일정">
					<input type="date" name="g_end" placeholder="최종일정">
					<input type="text" name="g_member" placeholder="총 인원">
					<input type="text" name="m_deal" placeholder="딜러 인원">
					<input type="text" name="m_tank" placeholder="탱커 인원">
					<input type="text" name="m_heal" placeholder="힐러 인원">
					<input type="file" name="g_file" style="float: right;" placeholder="이미지 선택">
					<input type="submit" value="생성하기">
				</form>
			</div>
		</div>
	</div>
</body>
</html>