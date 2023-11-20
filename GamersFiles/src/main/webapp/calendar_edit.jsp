<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 일정 생성과 제거를 한페이지에서 끝내기 
생성 submit를 하면 일정 생성 서블릿이 작동되고 제거 submit를 하면 일정 제거 서블릿이 작동됨
서블릿 처리 이후에는 이 페이지로 돌아오기
-->
<%session.setAttribute("g_name", "g_name"); %>
	<div>
		<form action="Cd_Insert_Service" align="center">
			<table >
				<tr>
					<td>일정 시작</td>
					<td><input type="datetime-local" name="c_start"></td>
				</tr>
				<tr>
					<td>일정 종료</td>
					<td><input type="datetime-local" name="c_end"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><input type="text" name="c_content"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="일정생성"></td>
				</tr>
				
				
				
				
				
				
				
				
			</table>
		</form>
	</div>
	<div>
		<form action="">
			<!-- 이곳에 일정이 쫘악 나오고 삭제 누르면 삭제 할 수 있게 -->



		</form>
	</div>

</body>
</html>