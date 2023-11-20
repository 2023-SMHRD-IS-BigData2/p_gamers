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

.join-wrapper {
	display: inline-block;
	text-align: center;
	padding : 20px;
	box-sizing: border-box;
	background-color: lightgray;
}

.join-wrapper>h2 {
	font-size: 24px;
	color: black;
	margin-bottom: 20px;
}

#join-form>input {
	width: 100%;
	height: 48px;
	padding: 0 10px;
	box-sizing: border-box;
	margin-bottom: 16px;
	border-radius: 6px;
}

#join-form>input::placeholder {
	color: black;
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
	<div class="member_container" style="align-content: center;">
		<div class="main_top" style="align-content: center;">
			<div class="join-wrapper">
				<h2>회원가입</h2>
				<form method="post" action="IMService.do" id="join-form">
					<input type="text" name="m_id" placeholder="아이디"> <input
						type="password" name="m_pw" placeholder="비밀번호"> <input
						type="text" name="m_nick" placeholder="닉네임"> <input
						type="text" list="positions" name="m_position" placeholder="역할">
					<datalist id="positions">
						<option>딜러</option>
						<option>탱커</option>
						<option>힐러</option>
					</datalist>
					<input type="submit" value="회원가입">
				</form>
			</div>
		</div>
	</div>
</body>
</html>