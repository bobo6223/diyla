<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="${ctxPath}/images/DIYLA_cakeLOGO.png"
	type="image/x-icon">
<link rel="stylesheet" href="../css/style.css">
<title>編輯訂單</title>
<style>
div.info {
	display: block;
}

.info input[type="text"], .info input[type="datetime"], .info select {
	display: block;
	margin-bottom: 10px; /* 調整 input 之間的間距 */
	width: 70%; /* 使 input 佔滿一行寬度 */
	padding: 5px;
}

.fixed:focus {
	outline: none; /* 移除默認的外框 */
}

.info {
	width: 400px;
	margin: 0 auto;
	padding: 20px;
	background-color: #f5f5f5;
	border: 1px solid #ccc;
	border-radius: 5px;
}

/* 標籤和輸入框的間距 */
.info input, .info select {
	margin-bottom: 10px;
}

/* 固定標籤寬度 */
.fixed {
	width: 100px;
}

/* 訂單狀態下拉框寬度 */
.status {
	width: 150px;
}

/* 按鈕樣式 */
.submit-button {
	background-color: #4caf50;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	text-align: center;
}

.orderTime {
	 border: 1px solid #ccc; /* 添加1px寬度的灰色外框線 */
        padding: 10px; /* 添加一些內部填充 */
        	width: 270px;
        	margin: 10px 0px;
        
}
</style>
</head>
<body>
	<div class="topPage">
		<jsp:include page="../index.jsp" />
	</div>
	<div class="editform">
		<h1 style="text-align: center;">編輯訂單</h1>
		<form action="${ctxPath}/orderManage/OrderManageController"
			method="post">
			<!-- commodityOrderVOList -->
			<div class="info">
				<span>訂單編號:</span> <input name="orderNO" value="${order.orderNO}"
					type="text" readonly="readonly" class="fixed"> <span>會員編號:</span>
				<input name="memId" value="${order.memId}" type="text"
					readonly="readonly" class="fixed"> <span>訂單日期:</span>
				<p class="orderTime">
					<fmt:formatDate value="${order.orderTime}" pattern="yyyy-MM-dd" />
				</p>
				<span>訂單狀態:</span> <select class="status" name="orderStatus">
					<option value="0" ${order.orderStatus == 0 ? 'selected' : ''}>未付款</option>
					<option value="1" ${order.orderStatus == 1 ? 'selected' : ''}>已付款</option>
					<option value="2" ${order.orderStatus == 2 ? 'selected' : ''}>處理中</option>
					<option value="3" ${order.orderStatus == 3 ? 'selected' : ''}>已完成</option>
					<option value="4" ${order.orderStatus == 4 ? 'selected' : ''}>已取消</option>
				</select> <span>金額:</span> <input name="orderPrice"
					value="${order.actualPrice }" type="text"> <span>收件人:</span>
				<input name="recipients " value="" type="text"> <span>收件地址:</span>
				<input name="address " value="" type="text"> <span>連絡電話:</span>
				<input name="phone" value="" type="text"> <input
					name="action" value="editcomplete" type="hidden">
				<button type="submit" class="submit-button">更新訂單</button>
			</div>
		</form>
	</div>

</body>
</html>