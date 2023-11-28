<%@page import="com.project.model.JobDTO"%>
<%@page import="com.project.model.JobDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.project.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 수정 페이지</title>
<link rel="stylesheet" href="MainAssets/css/main.css" />
<link rel="stylesheet" href="menu.css" />
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style type="text/css">
* {
	padding: 0;
	margin: 0;
	border: none;
	text-align: center;
}

.update-wrapper {
	margin: 20px; display : inline-block;
	padding: 40px;
	box-sizing: border-box;
	color: white;
	border: solid;
	border-color: lightgray;
	display: inline-block;
	font-size: 16px;
}

.update-wrapper>h2 {
	font-size: 24px;
	color: black;
	margin-bottom: 20px;
}

#update-form>input {
	width: 100%;
	height: 48px;
	padding: 0 10px;
	box-sizing: border-box;
	margin-bottom: 16px;
	border-radius: 6px;
	font-size: 14px !important;
}

#update-form>input::placeholder {
	color: gray !important;
	font-size: 14px !important;
}

#update-form>input[type="submit"] {
	color: black;
	font-size: 16px;
	background-color: gray;
	margin-top: 20px;
}

#update-form>input[type="checkbox"] {
	display: none;
}

#update-form>label {
	color: #999999;
}

#update-form input[type="checkbox"]+label {
	cursor: pointer;
	padding-left: 26px;
	background-image: url("checkbox.png");
	background-repeat: no-repeat;
	background-size: contain;
}

#update-form input[type="checkbox"]:checked+label {
	background-image: url("checkbox-active.png");
	background-repeat: no-repeat;
	background-size: contain;
}

textarea {
	resize: none;
}
.delete-wrapper {
	margin: 20px; display : inline-block;
	padding: 40px;
	box-sizing: border-box;
	color: white;
	border: solid;
	border-color: lightgray;
	display: inline-block;
	font-size: 16px;
}

.delete-wrapper>h2 {
	font-size: 24px;
	color: black;
	margin-bottom: 20px;
}

#delete-form>input {
	width: 100%;
	height: 48px;
	padding: 0 10px;
	box-sizing: border-box;
	margin-bottom: 16px;
	border-radius: 6px;
	font-size: 14px !important;
}

#delete-form>input::placeholder {
	color: gray !important;
	font-size: 14px !important;
}

#delete-form>input[type="submit"] {
	color: black;
	font-size: 16px;
	background-color: gray;
	margin-top: 20px;
}

#delete-form>input[type="checkbox"] {
	display: none;
}

#delete-form>label {
	color: #999999;
}

#delete-form input[type="checkbox"]+label {
	cursor: pointer;
	padding-left: 26px;
	background-image: url("checkbox.png");
	background-repeat: no-repeat;
	background-size: contain;
}

#delete-form input[type="checkbox"]:checked+label {
	background-image: url("checkbox-active.png");
	background-repeat: no-repeat;
	background-size: contain;
}
</style>
</head>
<body class="is-preload">
	<%
	MemberDTO login = (MemberDTO) session.getAttribute("login");
	request.setCharacterEncoding("UTF-8");
	List<JobDTO> jobs = new JobDAO().jobList();
	%>
	<div id="wrapper">
		<header id="header" class="alt">
			<a href="GamersMain.jsp" class="logo"><strong>게이머즈</strong></a>
			<nav>
			</nav>
		</header>
	</div>
	<div class="member_container">
		<div class="main_top">
			<div class="update-wrapper">
				<h2>내 정보 수정</h2>
				<form method="post" action="UMService.do" id="update-form">
					<input type="text" name="m_id" value="<%=login.getM_id()%>"
						readonly> <input type="password" name="m_pw"
						placeholder="비밀번호"> <input type="text" name="m_nick"
						placeholder="닉네임"> <input type="text" 
						<%
						if (login.getG_name()!=null){
						%>
						value="<%=login.getG_name() %>"
						<%
						} else {
						%>
						value="가입된 파티가 없습니다."
						<%
						}
						%>
						readonly="readonly">
					<input type="text" name="m_class" list="classes" id="class"
						placeholder="직업">
					<datalist id="classes">
						<%
						if (jobs != null) {
							for (int i = 0; i < jobs.size(); i++) {
						%>
						<option value="<%=jobs.get(i).getM_class()%>"><%=jobs.get(i).getM_class()%></option>
						<%
						}
						}
						%>
					</datalist>
					<input type="text" name="m_position" readonly value=""
						id="m_position">
					<textarea name="m_coment" style="width: 320px; height: 100px;"
						placeholder="간단한 자기 소개"></textarea>
					<input type="submit" value="정보 수정 완료">
				</form>
			</div>
		</div>
	</div>
	
		
			<div class="delete-wrapper" style="width: 400px;">
				<fieldset>
					<h2>회원탈퇴</h2>
					<form method="post" action="UDMService.do" id="delete-form">
					<% String m_id = (String)session.getAttribute("m_id"); %>
						<input type="hidden" name="m_id" value=<%=m_id %>>
						 <input type="submit" value="회원탈퇴">
					</form>
				</fieldset>
			</div>
		
	<script src="MainAssets/js/jquery.min.js"></script>
	<script src="MainAssets/js/jquery.scrolly.min.js"></script>
	<script src="MainAssets/js/jquery.scrollex.min.js"></script>
	<script src="MainAssets/js/browser.min.js"></script>
	<script src="MainAssets/js/breakpoints.min.js"></script>
	<script src="MainAssets/js/util.js"></script>
	<script src="MainAssets/js/main.js"></script>
	<script type="text/javascript">
		$(document).on('change', '#class', function() {
			var val = $(this).val();
			console.log(val)
			$.ajax({
				url : 'PCService.do',
				data : {
					'm_class' : val
				},
				type : 'get',
				success : function(data) {
					document.getElementById("m_position").value = data;
				},
				error : function() {
					alert("잘못된 직업입니다.")
				}
			})
		});
	</script>
</body>
</html>