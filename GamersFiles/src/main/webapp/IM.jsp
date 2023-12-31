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
	width:500px;
	text-align: center;
	padding: 20px;
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
		<div class="main_top">
			<div class="join-wrapper" style="width:400px;">
				<h2>회원가입</h2>
				<form method="post" action="IMService.do" id="join-form"  style=" text-align: center; align-content: center; justify-content: center; width: 360px;">
					<input type="text" name="m_id" id="inputI" placeholder="아이디"> <input
						type="button" value="중복체크" onclick="checkI()" style="width: 100px; height: 50px;"> <span
						id="memberCheck"></span> <input type="password" name="m_pw"
						placeholder="비밀번호"> <input type="text" name="m_nick"
						placeholder="닉네임"> <input type="text" name="g_name" id="inputG"
						placeholder="파티명"> <input
						type="button" value="중복체크" onclick="checkG()" style="width: 100px; height: 50px;"> <span
						id="groupCheck"></span> <input type="text" list="positions"
						name="m_position" placeholder="역할">
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
	<script type="text/javascript">
		function checkI() {
			var inputI = $('#inputI').val();
			$.ajax({ /* {} 표현식 : json */
				// 요청
				url : 'MCService.do',
				// 데이터(json, {key:value})
				data : {
					'inputI' : inputI
				},
				// 방식
				type : 'get',
				// 성공
				success : function(data) {
					if (data == 'true') {
						$('#memberCheck').text('사용할 수 없는 ID입니다.')
					} else if (data == 'false') {
						alert('사용할 수 있는 ID입니다.')
					}
				},
				// 실패
				error : function() {
					alert("통신실패")
				}
			})
		}
		function checkG() {
			var inputG = $('#inputG').val();
			$.ajax({ /* {} 표현식 : json */
				// 요청
				url : 'GCService.do',
				// 데이터(json, {key:value})
				data : {
					'inputG' : inputG
				},
				// 방식
				type : 'get',
				// 성공
				success : function(data) {
					if (data == 'true') {
						$('#groupCheck').text('파티 확인 실패')
					} else if (data == 'false') {
						alert('파티 확인 성공')
					}
				},
				// 실패
				error : function() {
					alert("통신실패")
				}
			})
		}
	</script>
</body>
</html>