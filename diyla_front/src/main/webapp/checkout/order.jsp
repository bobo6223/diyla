<%@page
	import="com.cha102.diyla.commodityOrderDetail.CommodityOrderDetailService"%>
<%@page import="com.cha102.diyla.commodityModel.CommodityService"%>
<%@page import="com.cha102.diyla.commodityModel.CommodityVO"%>
<%@page import="com.cha102.diyla.commodityOrder.*"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>填寫付款資訊</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 引入其他所需的 CSS 和 JavaScript 檔案 -->
<link rel="shortcut icon" href="${ctxPath}/images/DIYLA_cakeLOGO.png"
	type="image/x-icon">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />

<!-- bootstrap core css -->
<link rel="stylesheet" type="text/css"
	href="${ctxPath}/css/bootstrap.css" />

<!-- Custom styles for this template -->
<link href="${ctxPath}/css/style.css" rel="stylesheet" />
<!-- responsive style -->
<link href="${ctxPath}/css/responsive.css" rel="stylesheet" />

</head>
<body>
	<div class="topPage">
		<jsp:include page="../front_header.jsp" />
	</div>
	<div class="mainContent">
		<h1>填寫付款資訊</h1>

		<form action="${ctxPath}/memberOrder/OrderController" method="post">
			<div class="orderDetail">
				<table>
					<tr class="title">
						<td class="subtitle">商品名稱</td>
						<td class="subtitle">單價</td>
						<td class="subtitle">數量</td>
						<td class="subtitle">小計</td>
					</tr>
					<c:forEach var="cartItem" items="${shoppingCartList}">
						<c:forEach var="comVO" items="${commodityList}">
							<c:if test="${cartItem.comNo == comVO.comNO}">
								<tr class="itemrow">
									<td class="itemInfo">${comVO.comName}</td>
									<td class="itemInfo">${comVO.comPri}</td>
									<td class="itemInfo">${cartItem.comAmount}</td>
									<td class="itemInfo">${comVO.comPri*cartItem.comAmount}</td>
								</tr>
							</c:if>
						</c:forEach>
					</c:forEach>
				</table>
				<span>總金額${totalPrice}</span>
			</div>

			<div>
				<label for="useTokens">使用代幣：</label> <select id="useTokens">
					<option value="true">是</option>
					<option value="false">否</option>
				</select>
			</div>
			<h2>填寫付款資訊</h2>
			<div class="form-row">
				<span style="display: block; color: red;">${errMsg["recipient"]}</span>
				<label for="recipient">收件人姓名：</label> <input type="text"
					id="recipientName" name="recipient">
			</div>
			<div class="form-row">
				<span style="display: block; color: red;">${errMsg["phone"]}</span>
				<label for="phone">收件人電話：</label> <input type="tel"
					id="recipientPhone" name="phone">
			</div>
			<div class="form-row">
				<span style="display: block; color: red;">${errMsg["recipientAddress"]}</span>
				<label for="recipientAddress">收件人地址：</label> <input type="text"
					id="recipientAddress" name="recipientAddress">
			</div>
			<div class="form-row">
				<label for="paymentMethod">付款方式：</label> <select id="paymentMethod"
					name="paymentMethod" required>
					<option value="creditCard">信用卡</option>
					<option value="cashOnDelivery">貨到付款</option>
				</select>
			</div>
			<input type="hidden" name="action" value="orderConfirm"> <input
				type="submit" class="confirmButton" value="確認">
		</form>
	</div>

	<jsp:include page="../front_footer.jsp" />

	<script>
		
	</script>
</body>
</html>
