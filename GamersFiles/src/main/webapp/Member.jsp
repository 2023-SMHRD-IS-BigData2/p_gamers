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

.login-wrapper {
	margin: 20px; display : inline-block;
	padding: 40px;
	box-sizing: border-box;
	color: white;
	border: solid;
	border-color: lightgray;
	display: inline-block;
	font-size: 16px;
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
	font-size: 14px !important;
}

#login-form>input::placeholder {
	color: gray !important;
	font-size: 14px !important;
}

#login-form>input[type="submit"] {
	color: black;
	font-size: 16px;
	background-color: gray;
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
	color: white;
	border: solid;
	border-color: lightgray;
	font-size: 16px;
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
	color : white;
	font-size: 14px !important;
}

#join-form>input::placeholder {
	color: gray !important;
	font-size: 14px !important;
}

#join-form>input[type="submit"] {
	color: black;
	font-size: 16px;
	background-color: gray;
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

textarea {
	resize: none;
}
</style>
</head>
<body class="is-preload">
	<%
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
	<div class="member">
		<div class="main_top">
			<div class="login-wrapper" style="width: 400px;">
				<fieldset>
					<h2>로그인</h2>
					<form method="post" action="SMService.do" id="login-form">
						<input type="text" name="m_id" placeholder="아이디"> <input
							type="password" name="m_pw" placeholder="비밀번호"> <input
							type="submit" value="로그인">
					</form>
				</fieldset>
			</div>
		</div>
		<div class="main_bottom">
			<div class="join-wrapper" style="width: 400px;">
				<fieldset>
					<h2>회원가입</h2>
					<form method="post" action="IMService.do" id="join-form">
						<input type="text" name="m_id" id="inputI" placeholder="아이디">
						<input type="button" value="중복체크" onclick="checkI()"
							style="width: 100px; height: 50px;"> <span
							id="memberCheck"></span> <input type="password" name="m_pw"
							placeholder="비밀번호"> <input type="text" name="m_nick"
							placeholder="닉네임"> <input type="text" name="m_class"
							list="classes" id="class" placeholder="직업">
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
							id="m_position" placeholder="역할">
						<textarea name="m_coment" style="width: 320px; height: 100px;"
							placeholder="간단한 자기 소개"></textarea>
						<input id="check" type="button" value="회원가입">
					</form>
				</fieldset>
			</div>
		</div>
	</div>
	<script src="MainAssets/js/jquery.min.js"></script>
	<script src="MainAssets/js/jquery.scrolly.min.js"></script>
	<script src="MainAssets/js/jquery.scrollex.min.js"></script>
	<script src="MainAssets/js/browser.min.js"></script>
	<script src="MainAssets/js/breakpoints.min.js"></script>
	<script src="MainAssets/js/util.js"></script>
	<script src="MainAssets/js/main.js"></script>
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
						alert('사용할 수 없는 ID입니다.')
						$("#check").click(function(){
							alert('ID 중복');
						});
					} else if (data == 'false') {
						alert('사용할 수 있는 ID입니다.')
						$("#check").prop("type", "submit");
						$("#check").prop("id", "");
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