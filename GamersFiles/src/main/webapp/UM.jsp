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
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
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
	MemberDTO login = (MemberDTO) session.getAttribute("login");
	request.setCharacterEncoding("UTF-8");
	List<JobDTO> jobs = new JobDAO().jobList();
	%>
	<div class="member_container">
		<div class="main_top">
			<div class="login-wrapper">
				<h2>내 정보 수정</h2>
				<form method="post" action="UMService.do" id="login-form">
					<input type="text" name="m_id" value="<%=login.getM_id()%>"
						readonly> <input type="password" name="m_pw"
						placeholder="비밀번호"> <input type="text" name="m_nick"
						placeholder="닉네임"> <input type="text" name="g_name" value="<%=login.getG_name() %>"
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
					<textarea name="m_coment" style="width: 320px; height: 48px;"
						placeholder="간단한 자기 소개"></textarea>
					<input type="submit" value="회원가입">
				</form>
			</div>
		</div>
	</div>
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