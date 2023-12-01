<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.project.model.ItemDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.project.model.ItemDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>창천의 이슈가르드 아이템 리스트</title>
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
	background-image: url('images/배경던전.jpg');
  	background-size: cover; 
 	background-position: center; 
  	background-repeat: no-repeat; 
  	background-color: #BDBDBD;
}

.table-tltle {
	display: inline-block;
	padding: 40px;
	box-sizing: border-box;
	color: #D5D5D5;
}

.table-tltle>h2 {
	font-size: 24px;
	color: #6A24FE;
	margin-bottom: 20px;
}
#table1{
	display: none;
}
#table2{
	display: none;
}
#table3{
	display: none;
}
.table-title button{
	padding: 10px 20px;
    font-size: 16px;
    background-color: #6A24FE;
    color: #fff;
    border: none;
    cursor: pointer;
}
.table-container {
            margin: 0 auto; 
            width: 60%;
        }
table {
            border-collapse: collapse;
            width: 100%;
            border: 1px solid #353535; 
        }

        th {
            border: 1px solid #4C4C4C; 
            text-align: center;
            padding: 8px;
            background-color: gray;
        }
        td {
        	border: 1px solid #8C8C8C; 
            text-align: center;
            padding: 8px;
            color: #A6A6A6        	        	
        }
</style>
</head>
<body>

	<%
	request.setCharacterEncoding("UTF-8");
	%>
	<%
	session.setAttribute("i_name", "i_name");
	%>
	<%
	String i_name = (String) session.getAttribute("i_name");
	%>
	<%
	List<ItemDTO> I_List = new ItemDAO().ItemName10(i_name);
	%>
	

	<%
	session.setAttribute("i_name", "i_name");
	%>
	<%
	String i_name2 = (String) session.getAttribute("i_name");
	%>
	<%
	List<ItemDTO> I_List2 = new ItemDAO().ItemName11(i_name);
	%>
	

	<%
	session.setAttribute("i_name", "i_name");
	%>
	<%
	String i_name3 = (String) session.getAttribute("i_name");
	%>
	<%
	List<ItemDTO> I_List3 = new ItemDAO().ItemName12(i_name);
	%>
	

	<div class="table-tltle">
		<h1>창천의 이슈가르드 아이템 리스트</h1>
		<button onclick="showtable1()">기동 드롭 아이템</button>
		<button onclick="showtable2()">율동 드롭 아이템</button>
		<button onclick="showtable3()">천동 드롭 아이템</button>
	</div>
	<div class="table-container">
		<table border="1" id="table1">
			<tr class="title">
				<th>아이템 이름</th>
				<th>아이템 레벨</th>
				<th>착용 레벨</th>
				<th>드랍 장소</th>
			</tr>
			<% for(ItemDTO items : I_List3){ %>
			<tr class="contents">
                   <td><%= items.getItem_name() %></td>
                   <td><%= items.getItem_level() %></td>
                   <td><%= items.getEquip_level() %></td>
                   <td><%= items.getDrop_location() %></td>
             </tr>
             <%} %>
		</table>
	</div>
	<div class="table-container">
		<table border="1" id="table2">
			<tr class="title">
				<th>아이템 이름</th>
				<th>아이템 레벨</th>
				<th>착용 레벨</th>
				<th>드랍 장소</th>
			</tr>
			<% for(ItemDTO items : I_List2){ %>
			<tr class="contents">
                   <td><%= items.getItem_name() %></td>
                   <td><%= items.getItem_level() %></td>
                   <td><%= items.getEquip_level() %></td>
                   <td><%= items.getDrop_location() %></td>
             </tr>
             <%} %>
		</table>
	</div>
	<div class="table-container">
		<table border="1" id="table3">
			<tr class="title">
				<th>아이템 이름</th>
				<th>아이템 레벨</th>
				<th>착용 레벨</th>
				<th>드랍 장소</th>
			</tr>
			<% for(ItemDTO items : I_List){ %>
			<tr class="contents">
                   <td><%= items.getItem_name() %></td>
                   <td><%= items.getItem_level() %></td>
                   <td><%= items.getEquip_level() %></td>
                   <td><%= items.getDrop_location() %></td>
             </tr>
             <%} %>
		</table>
	</div>
	
<script>

function showtable1() {
    
    var table1 = document.getElementById('table1');
    var currentDisplay = window.getComputedStyle(table1).display;

    
    table1.style.display = (currentDisplay === 'none') ? 'table' : 'none';
  }
  
function showtable2() {
    
    var table2 = document.getElementById('table2');
    var currentDisplay = window.getComputedStyle(table2).display;

    
    table2.style.display = (currentDisplay === 'none') ? 'table' : 'none';
  }
function showtable3() {
    
    var table3 = document.getElementById('table3');
    var currentDisplay = window.getComputedStyle(table3).display;

    
    table3.style.display = (currentDisplay === 'none') ? 'table' : 'none';
  }
  </script>

</body>
</html>