<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 및 회원가입 페이지</title>
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
	<div class="member_container">
		<div class="main_top">
			<div class="login-wrapper">
				<h2>로그인</h2>
				<form method="post" action="LoginService.do" id="login-form">
					<input type="text" name="m_id" placeholder="아이디"> <input
						type="password" name="m_pw" placeholder="비밀번호"> <input
						type="submit" value="로그인">
				</form>
			</div>
		</div>
		<div class="member_bottom">
			<div class="join-wrapper">
				<h2>회원가입</h2>
				<form method="post" action="JoinService.do" id="join-form">
					<input type="text" name="m_id" placeholder="아이디"> <input
						type="password" name="m_pw" placeholder="비밀번호"> <input
						type="text" name="m_nick" placeholder="닉네임"> <input
						type="text" list="positions" name="m_position" placeholder="역할">
					<datalist id="positions">
						<option>딜러</option>
						<option>탱커</option>
						<option>힐러</option>
						<!-- 추가된 input 태그 -->
						<div id="dynamicInputContainer">
							<!-- JavaScript에서 동적으로 생성될 input 태그가 들어갈 자리 -->
							<input type="text" name="m_class">

						</div>
					</datalist>
					<input type="submit" value="회원가입">
				</form>
			</div>
		</div>
	</div>
	<script>
		// 역할에 따라 동적으로 input 태그 생성
		$('#m_position').on('input', function() {
			var position = $(this).val();
			updateDynamicInput(position);
		});

		// 초기에도 동적 input 태그 생성
		updateDynamicInput('class');

		// 역할에 따라 동적으로 input 태그 생성하는 함수
		function updateDynamicInput(position) {
			// 기존 동적 input 태그 초기화
			$('#dynamicInputContainer').empty();

			// 역할에 따라 동적으로 input 태그 생성
			switch (position) {
			case '딜러':
				addInputToContainer('dynamicInputContainer', 'A');
				addInputToContainer('dynamicInputContainer', 'B');
				addInputToContainer('dynamicInputContainer', 'C');
				break;
			case '탱커':
				addInputToContainer('dynamicInputContainer', 'D');
				addInputToContainer('dynamicInputContainer', 'E');
				addInputToContainer('dynamicInputContainer', 'F');
				break;
			case '힐러':
				addInputToContainer('dynamicInputContainer', 'G');
				addInputToContainer('dynamicInputContainer', 'H');
				addInputToContainer('dynamicInputContainer', 'I');
				break;
			// 다른 역할에 대한 처리 추가 가능
			default:
				break;
			}
		}
	</script>
</body>
</html>