<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*, java.text.DateFormat,java.text.SimpleDateFormat"%>
<%@ page import="com.order_table.model.*"%>

<%--<%  此頁練習採用 EL 的寫法取值 --%> 
<%
   	Order_TableService order_tableSvc = new Order_TableService();
    List<Order_TableVO> list = order_tableSvc.getAll();
    pageContext.setAttribute("list",list);
    DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>所有消費者訂單資訊 (全部查詢)</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/back-use/order_table_use/style.css">
<style>


table#table-1 {
	background-color: #f5bc07;
	border: 2px solid black;
	text-align: center;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h3 {
	text-align: center;
}

h4 {
	color: blue;
	display: inline;
}
</style>


<style>
table {
	width: 2000px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
}

table, th, td {
	border: 1px solid #CCCCFF;
}

th, td {
	padding: 5px;
	text-align: center;
}

h3 {
	text-align: center;
}

table {
	width: 700px;

	/*    border-collapse: collapse;  */
	/*  格子各有一條線變成一條 */
}

td {
	border-bottom: 1px solid white;
	padding: 20px;
}

tr:nth-child(1) {
	background-color: orange;
	color: black;
}

tr:nth-child(3) {
	background-color: wheat;
	color: black;
}

tr:nth-child(5) {
	background-color: wheat;
	color: black;
}

tr:nth-child(even) {
	background-color: burlywood;
}

tr:nth-child(6) {
	background-color: orange;
	color: black;
}

.keyword {
	color: brown
}

/* 確認 */
.btn {
	display: inline-block;
	border-radius: 4px;
	background-color: #f4511e;
	border: none;
	color: #FFFFFF;
	text-align: center;
	font-size: 15px;
	padding: 20px;
	width: 100px;
	transition: all 0.5s;
	cursor: pointer;
	margin: 1px;
}

.btn span {
	cursor: pointer;
	display: inline-block;
	position: relative;
	transition: 0.5s;
}

.btn span:after {
	content: '»';
	position: absolute;
	opacity: 0;
	top: 0;
	right: -20px;
	transition: 0.5s;
}

.btn:hover span {
	padding-right: 25px;
}

.btn:hover span:after {
	opacity: 1;
	right: 0;
}
/* 取消 */
.btn1 {
	display: inline-block;
	border-radius: 4px;
	background-color: gray;
	border: none;
	color: #FFFFFF;
	text-align: center;
	font-size: 15px;
	padding: 20px;
	width: 100px;
	transition: all 0.5s;
	cursor: pointer;
	margin: 1px;
}

.btn1 span {
	cursor: pointer;
	display: inline-block;
	position: relative;
	transition: 0.5s;
}

.btn1 span:after {
	content: '«';
	position: absolute;
	opacity: 0;
	top: 0;
	right: -20px;
	transition: 0.5s;
}

.btn1:hover span {
	padding-right: 25px;
}

.btn1:hover span:after {
	opacity: 1;
	right: 0;
}

.content {
	width: 1500px;
	margin-left: auto;
	margin-right: auto;
}

.box {
	text-align: center;
}
</style>


</head>
<body>
<div class="header">
<jsp:include page="/css/headfoot/header.jsp"></jsp:include>
</div>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
<br>
	<br><br>
	<br>
	<br>
	<br>
	<br>
<table class="content"
	style="weight: 200px; height: 300px; border: 3px tomato dashed; margin-top: 60px; margin-bottom: 50px;">
	<tr style="text-align: center;">
	<tr>
		<th>訂單流水號</th>
		<th>餐廳編號</th>
		<th>消費者信箱</th>
		<th>訂單狀態</th>
		<th>訂單成立時間</th>
<!-- 		<th>訂單取消時間</th> -->
		<th>訂單備註</th>
		<th>用餐人數</th>
		<th>消費者用餐時段</th>
		<th>使用訂金</th>
<!-- 		<th>訂單QR條碼</th> -->
		<th>餐廳座位狀態</th>
		<th></th>
		<th></th>
	<div style="text-align: center;">
<%@ include file="pages/page1.file"%></div>
	<c:forEach var="order_tableVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
	<%
	Order_TableVO order_tableVO = (Order_TableVO)pageContext.getAttribute("order_tableVO");
	%>
		<tr>
			<td>${order_tableVO.order_id}</td>
			<td>${order_tableVO.rs_id}</td>
			<td>${order_tableVO.gs_email}</td>
			<td>${order_tableVO.order_status}</td>
			<td><%= sdf.format(order_tableVO.getOrder_time()) %></td>
<%-- 			<td><%= sdf.format(order_tableVO.getOrder_cancel_time()) %></td>  --%>
			<td>${order_tableVO.gs_order_remark}</td>
			<td>${order_tableVO.gs_people}</td>
			<td>${order_tableVO.gs_select_time}</td>
			<td>${order_tableVO.order_deposit}</td>
<%-- 			<td><img src= "<%=request.getContextPath()%>/back-end/order_table/order_table.do?action1=display_pic&order_id=${order_tableVO.order_id}" --%>
<!-- 			height="100" width="100" ></td> -->
			<td>${order_tableVO.rs_table_status}</td>
			
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/order_table/order_table.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="order_id"  value="${order_tableVO.order_id}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/order_table/order_table.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="order_id"  value="${order_tableVO.order_id}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
	<div style="text-align: center;">
<%@ include file="pages/page2.file"%></div>
 
 
</body>
</html>