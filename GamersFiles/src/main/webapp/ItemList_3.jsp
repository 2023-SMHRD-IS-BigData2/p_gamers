<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.project.model.ItemDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.project.model.ItemDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홍련의 해방자 아이템 리스트</title>
<style type="text/css">
       .table-container {
  display: flex; 
}


table {
  border-collapse: separate; 
  
  margin-left: 100px;
}
.firsttable{
	width:600px;
	height:500px;
}
.secondtable{
	width:600px;
	height:500px;
}
.thirdtable{
	width:600px;
	height:500px;	
}
.title{
	background-color: #474747;
}
.contents{
	background-color: #A6A6A6;
}        
</style>
</head>
<body>

<% request.setCharacterEncoding("UTF-8"); %>
<% session.setAttribute("i_name", "i_name"); %>
<% String i_name = (String)session.getAttribute("i_name"); %>
<% List<ItemDTO> I_List = new ItemDAO().ItemName7(i_name); %>
<% session.setAttribute("i_level", "i_level"); %>
<% String i_level = (String)session.getAttribute("i_level"); %>
<% List<ItemDTO> I_lev_List = new ItemDAO().ItemLevel7(i_level); %>
<% session.setAttribute("e_level", "e_level"); %>
<% String e_level = (String)session.getAttribute("e_level"); %>
<% List<ItemDTO> e_List = new ItemDAO().EquipLevel7(e_level); %>
<% session.setAttribute("d_location", "d_location"); %>
<% String d_location = (String)session.getAttribute("d_location"); %>
<% List<ItemDTO> D_List = new ItemDAO().DropLocation7(d_location); %>

<% session.setAttribute("i_name", "i_name"); %>
<% String i_name2 = (String)session.getAttribute("i_name"); %>
<% List<ItemDTO> I_List2 = new ItemDAO().ItemName8(i_name); %>
<% session.setAttribute("i_level", "i_level"); %>
<% String i_level2 = (String)session.getAttribute("i_level"); %>
<% List<ItemDTO> I_lev_List2 = new ItemDAO().ItemLevel8(i_level); %>
<% session.setAttribute("e_level", "e_level"); %>
<% String e_level2 = (String)session.getAttribute("e_level"); %>
<% List<ItemDTO> e_List2 = new ItemDAO().EquipLevel8(e_level); %>
<% session.setAttribute("d_location", "d_location"); %>
<% String d_location2 = (String)session.getAttribute("d_location"); %>
<% List<ItemDTO> D_List2 = new ItemDAO().DropLocation8(d_location); %>

<% session.setAttribute("i_name", "i_name"); %>
<% String i_name3 = (String)session.getAttribute("i_name"); %>
<% List<ItemDTO> I_List3 = new ItemDAO().ItemName9(i_name); %>
<% session.setAttribute("i_level", "i_level"); %>
<% String i_level3 = (String)session.getAttribute("i_level"); %>
<% List<ItemDTO> I_lev_List3 = new ItemDAO().ItemLevel9(i_level); %>
<% session.setAttribute("e_level", "e_level"); %>
<% String e_level3 = (String)session.getAttribute("e_level"); %>
<% List<ItemDTO> e_List3 = new ItemDAO().EquipLevel9(e_level); %>
<% session.setAttribute("d_location", "d_location"); %>
<% String d_location3 = (String)session.getAttribute("d_location"); %>
<% List<ItemDTO> D_List3 = new ItemDAO().DropLocation9(d_location); %>



<h1>홍련의 해방자 아이템 리스트</h1>
<div class="table-container">
<div class="firsttable">
<table border="1">
	<tr class="title">
		<th>아이템 이름</th>
		<th>아이템 레벨</th>
		<th>착용 레벨</th>
		<th>드랍 장소</th>
	</tr>
	<tr class="contents">
		<td><%for(ItemDTO names : I_List3){%>
			<%= names.getItem_name() %><hr><%} %></td>
		<td><%for(ItemDTO levels : I_lev_List3){%>
			<%= levels.getItem_level() %><hr><%} %></td>
		<td><%for(ItemDTO equips : e_List3){%>
			<%= equips.getEquip_level() %><hr><%} %></td>
		<td><%for(ItemDTO drops : D_List3){%>
			<%= drops.getDrop_location() %><hr><%} %></td>
	
	</tr>
</table>
</div>

<div class="secondtable">
<table border="1">
	<tr class="title">
		<th>아이템 이름</th>
		<th>아이템 레벨</th>
		<th>착용 레벨</th>
		<th>드랍 장소</th>
	</tr>
	<tr class="contents">
		<td><%for(ItemDTO names : I_List2){%>
			<%= names.getItem_name() %><hr><%} %></td>
		<td><%for(ItemDTO levels : I_lev_List2){%>
			<%= levels.getItem_level() %><hr><%} %></td>
		<td><%for(ItemDTO equips : e_List2){%>
			<%= equips.getEquip_level() %><hr><%} %></td>
		<td><%for(ItemDTO drops : D_List2){%>
			<%= drops.getDrop_location() %><hr><%} %></td>
	
	</tr>
</table>
</div>

<div class="thirdtable">
<table border="1" id="items3">
	<tr class="title">
		<th>아이템 이름</th>
		<th>아이템 레벨</th>
		<th>착용 레벨</th>
		<th>드랍 장소</th>
	</tr>
	
	<tr class="contents">
		<td><%for(ItemDTO names : I_List){%>
			<%= names.getItem_name() %><hr><%} %></td>
		<td><%for(ItemDTO levels : I_lev_List){%>
			<%= levels.getItem_level() %><hr><%} %></td>
		<td><%for(ItemDTO equips : e_List){%>
			<%= equips.getEquip_level() %><hr><%} %></td>
		<td><%for(ItemDTO drops : D_List){%>
			<%= drops.getDrop_location() %><hr><%} %></td>
		</tr>
</table>
</div>
</div>

</body>
</html>