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
<title>신생 에오르제아 아이템 리스트</title>
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

.table-tltle {
	display: inline-block;
	padding: 40px;
	box-sizing: border-box;
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
	List<ItemDTO> I_List = new ItemDAO().ItemName13(i_name);
	%>
	<%
	session.setAttribute("i_level", "i_level");
	%>
	<%
	String i_level = (String) session.getAttribute("i_level");
	%>
	<%
	List<ItemDTO> I_lev_List = new ItemDAO().ItemLevel13(i_level);
	%>
	<%
	session.setAttribute("e_level", "e_level");
	%>
	<%
	String e_level = (String) session.getAttribute("e_level");
	%>
	<%
	List<ItemDTO> e_List = new ItemDAO().EquipLevel13(e_level);
	%>
	<%
	session.setAttribute("d_location", "d_location");
	%>
	<%
	String d_location = (String) session.getAttribute("d_location");
	%>
	<%
	List<ItemDTO> D_List = new ItemDAO().DropLocation13(d_location);
	%>

	<%
	session.setAttribute("i_name", "i_name");
	%>
	<%
	String i_name2 = (String) session.getAttribute("i_name");
	%>
	<%
	List<ItemDTO> I_List2 = new ItemDAO().ItemName14(i_name);
	%>
	<%
	session.setAttribute("i_level", "i_level");
	%>
	<%
	String i_level2 = (String) session.getAttribute("i_level");
	%>
	<%
	List<ItemDTO> I_lev_List2 = new ItemDAO().ItemLevel14(i_level);
	%>
	<%
	session.setAttribute("e_level", "e_level");
	%>
	<%
	String e_level2 = (String) session.getAttribute("e_level");
	%>
	<%
	List<ItemDTO> e_List2 = new ItemDAO().EquipLevel14(e_level);
	%>
	<%
	session.setAttribute("d_location", "d_location");
	%>
	<%
	String d_location2 = (String) session.getAttribute("d_location");
	%>
	<%
	List<ItemDTO> D_List2 = new ItemDAO().DropLocation14(d_location);
	%>

	<%
	session.setAttribute("i_name", "i_name");
	%>
	<%
	String i_name3 = (String) session.getAttribute("i_name");
	%>
	<%
	List<ItemDTO> I_List3 = new ItemDAO().ItemName15(i_name);
	%>
	<%
	session.setAttribute("i_level", "i_level");
	%>
	<%
	String i_level3 = (String) session.getAttribute("i_level");
	%>
	<%
	List<ItemDTO> I_lev_List3 = new ItemDAO().ItemLevel15(i_level);
	%>
	<%
	session.setAttribute("e_level", "e_level");
	%>
	<%
	String e_level3 = (String) session.getAttribute("e_level");
	%>
	<%
	List<ItemDTO> e_List3 = new ItemDAO().EquipLevel15(e_level);
	%>
	<%
	session.setAttribute("d_location", "d_location");
	%>
	<%
	String d_location3 = (String) session.getAttribute("d_location");
	%>
	<%
	List<ItemDTO> D_List3 = new ItemDAO().DropLocation15(d_location);
	%>

	<div class="table-tltle">
		<h1>신생 에오르제아 아이템 리스트</h1>
		<button onclick="showtable1()">해후 드롭 아이템</button>
		<button onclick="showtable2()">침공 드롭 아이템</button>
		<button onclick="showtable3()">진성 드롭 아이템</button>
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