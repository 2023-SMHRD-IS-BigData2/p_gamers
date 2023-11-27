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

.group-wrapper {
	margin: 20px; display : inline-block;
	padding: 40px;
	box-sizing: border-box;
	color: white;
	border: solid;
	border-color: lightgray;
	display: inline-block;
	font-size: 16px;
}

.group-wrapper>h2 {
	font-size: 24px;
	color: black;
	margin-bottom: 20px;
}

#group-form>input {
	width: 100%;
	height: 48px;
	padding: 0 10px;
	box-sizing: border-box;
	margin-bottom: 16px;
	border-radius: 6px;
	font-size: 14px !important;
}

#group-form>input[type="date"] {
	width: 100%;
	height: 48px;
	padding: 0 10px;
	box-sizing: border-box;
	margin-bottom: 16px;
	border-radius: 6px;
	font-size: 14px !important;
	color:gray;
}

#group-form>input::placeholder {
	color: gray !important;
	font-size: 14px !important;
}

#group-form>input[type="submit"] {
	color: black;
	font-size: 16px;
	background-color: gray;
	margin-top: 20px;
}

#group-form>input[type="checkbox"] {
	display: none;
}

#group-form>label {
	color: #999999;
}

#group-form input[type="checkbox"]+label {
	cursor: pointer;
	padding-left: 26px;
	background-image: url("checkbox.png");
	background-repeat: no-repeat;
	background-size: contain;
}

#group-form input[type="checkbox"]:checked+label {
	background-image: url("checkbox-active.png");
	background-repeat: no-repeat;
	background-size: contain;
}
</style>
</head>
<body class="is-preload">
	<%
	request.setCharacterEncoding("utf-8");
	String c_name = request.getParameter("c_name");
	MemberDTO login = (MemberDTO) session.getAttribute("login");
	List<ContentDTO> content = new ContentDAO().contentList2(c_name);
	%>
	<div id="wrapper">
		<!-- Header -->
		<header id="header" class="alt">
			<a href="GamersMain.jsp" class="logo"><strong>게이머즈</strong></a>
			<%
			if (login != null) {
				if (login.getM_id().equals("admin")) {
			%>
			<nav>
				<a href="adminMember.jsp"> 회원 조회 </a> <a href="adminGroup.jsp">
					파티 조회 </a> <a href="adminContent.jsp"> 레이드 조회 </a> <a
					href="LogoutService.do"> 로그아웃 </a>
			</nav>
			<%
			} else {
			%>
			<nav>
				<a href="#none"
					onclick="window.open('Message.jsp','new','scrollbars=yes,resizable=no width=700 height=600, left=1200,top=600');return false">쪽지함</a>
				<a href="UM.jsp"> 내 정보 수정 </a>
				<%
				if (login.getG_name() != null) {
				%>
				<a href="calendar.jsp"> 내 파티 </a>
				<%
				}
				%>
				<a href="LogoutService.do"> 로그아웃 </a>
			</nav>
			<%
			}
			} else {
			%>
			<nav>
				<a href="Member.jsp"> 로그인&회원가입 </a>
			</nav>
			<%
			}
			%>
		</header>
	</div>
	<div class="member_container">
		<div class="main_top">
			<div class="group-wrapper">
				<h2>파티 정보</h2>
				<form method="post" action="IGService.do?m_id=<%=login.getM_id()%>&m_nick=<%=login.getM_nick()%>"
					id="group-form" enctype="multipart/form-data">
				<input type="text" name="g_name" id="inputG" placeholder="파티명">
				<input type="button" value="중복체크" onclick="checkG()"
				 style="width: 100px; height: 50px;"> <span id="groupCheck"></span>
				<input type="text" name="m_id" value="<%=login.getM_id()%>" readonly>
				<input type="text" name="c_name" value="<%=c_name%>" readonly>
				<input type="text" name="g_content" list="g_contentList" placeholder="컨텐츠">
					<datalist id="g_contentList">
						<option><%=content.get(0).getC_content1()%></option>
						<option><%=content.get(0).getC_content2()%></option>
						<option><%=content.get(0).getC_content3()%></option>
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
	<script src="MainAssets/js/jquery.min.js"></script>
	<script src="MainAssets/js/jquery.scrolly.min.js"></script>
	<script src="MainAssets/js/jquery.scrollex.min.js"></script>
	<script src="MainAssets/js/browser.min.js"></script>
	<script src="MainAssets/js/breakpoints.min.js"></script>
	<script src="MainAssets/js/util.js"></script>
	<script src="MainAssets/js/main.js"></script>
	<script type="text/javascript">
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
						alert('파티명 사용 불가')
					} else if (data == 'false') {
						alert('파티명 사용 가능')
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