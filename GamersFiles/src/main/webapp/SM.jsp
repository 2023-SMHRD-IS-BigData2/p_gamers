<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
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
	text-align: center;
	padding: 20px;
	box-sizing: border-box;
	background-color: lightgray;
}

.login-wrapper>h2 {
	font-size: 24px;
	color: black;
	margin-bottom: 20px;
}

#login-form>input {
	width: 100%;
	height: 48px;
	padding: 0 10px;
	box-sizing: border-box;
	margin-bottom: 16px;
	border-radius: 6px;
}

#login-form>input::placeholder {
	color: black;
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
</style>
</head>
<body>
	<div class="member_container" style="align-content: center;">
		<div class="main_top" style="align-content: center;">
			<div class="login-wrapper">
				<h2>로그인</h2>
				<form method="post" action="SMService.do" id="login-form">
					<input type="text" name="m_id" placeholder="아이디"> <input
						type="password" name="m_pw" placeholder="비밀번호"> <input
						type="submit" value="로그인">
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$('a').click(function() {
			parent.parentsUrl($(this).attr('href'));
		});
	</script>
</body>
</html>