<%@page import="java.util.List"%>
<%@page import="com.project.model.JobDAO"%>
<%@page import="com.project.model.JobDTO"%>
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
	padding: 40px;
	box-sizing: border-box;
	background-color: lightgray;
}

.login-wrapper>h2 {
	font-size: 24px;
	color: #6A24FE;
	margin-bottom: 20px;
	color: #6A24FE;
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
	color: gray;
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
	padding: 40px;
	box-sizing: border-box;
	background-color: lightgray;
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
	color: gray;
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
textarea{
	resize: none;
}
</style>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	List<JobDTO> jobs = new JobDAO().jobList();
	%>
	<div class="member_container">
		<div class="main_top">
			<div class="login-wrapper" style="width: 400px;">
				<h2>로그인</h2>
				<form method="post" action="SMService.do" id="login-form">
					<input type="text" name="m_id" placeholder="아이디"> <input
						type="password" name="m_pw" placeholder="비밀번호"> <input
						type="submit" value="로그인">
				</form>
			</div>
		</div>
		<div class="member_bottom">
			<div class="join-wrapper" style="width: 400px;">
				<h2>회원가입</h2>
				<form method="post" action="IMService.do" id="join-form">
					<input type="text" name="m_id" id="inputI" placeholder="아이디">
					<input type="button" value="중복체크" onclick="checkI()" style="width: 100px; height: 50px;">
						<span id="memberCheck"></span>
					<input type="password" name="m_pw" placeholder="비밀번호">
					<input type="text" name="m_nick" placeholder="닉네임"> 
					<input type="text" name="g_name" id="inputG" placeholder="파티명">
					<input type="button" value="중복체크" onclick="checkG()" 	style="width: 100px; height: 50px;">
						<span id="groupCheck"></span>
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
					<textarea name="m_coment" style="width: 320px; height: 48px;" placeholder="간단한 자기 소개"></textarea>
					<input type="submit" value="회원가입">
				</form>
			</div>
		</div>
	</div>
	<script>
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