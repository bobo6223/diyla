<%@page
	import="com.cha102.diyla.commodityOrderDetail.CommodityOrderDetailVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="java.util.List"%>
<%@ page import="com.cha102.diyla.shoppongcart.*"%>
<%@page import="com.cha102.diyla.commodityModel.CommodityService"%>
<%@page import="com.cha102.diyla.commodityModel.CommodityVO"%>



<%
List<ShoppingCartVO> scvList = (List) session.getAttribute("shoppingCartList");
List<CommodityOrderDetailVO> detailVOs = null;
ShoppingCartService shoppingCartService = new ShoppingCartService();
CommodityService commodityService = new CommodityService();
CommodityVO comVo = null;
%>

<!DOCTYPE html>
<html>
<head>
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
<style>
.main-content {
	height: 800px;
}

.goTopButton {
	z-index: 999;
	position: fixed;
	bottom: 20px;
	padding: 10px;
	border: none;
	outline: none;
	background-color: #333;
	color: white;
	cursor: pointer;
	border-radius: 4px;
	right: 20px;
}

.goTopButton:hover {
	background-color: #555;
}
</style>
<title>訂單確認</title>
</head>
<body>
	<div class="header">
		<jsp:include page="../front_header.jsp" />
	</div>
	<div class="main-content">

		<h1 class="heading">訂單明細</h1>
		<table width="85%" class="cartTable" cellspacing="0"
			cellpadding="10px">
			<tr class="title">
				<td class="subtitle compic">商品圖片</td>
				<td class="subtitle">商品名稱</td>
				<td class="subtitle">單價</td>
				<td class="subtitle">數量</td>
				<td class="subtitle">小計</td>
				<td class="subtitle">刪除商品</td>
			</tr>

			<%
			for (ShoppingCartVO cartItem : scvList) {
				int comNo = cartItem.getComNo();
				comVo = commodityService.findByID(comNo);
			%>
			<tr class="itemrow">
				<td class="itemInfo compic"><a
					href="${ctxPath}/shop/CommodityController?action=findByID&comNO=<%=comVo.getComNO() %>"
					class="commodityPage"><img src="<%=comVo.getShowPic()%>"
						class="comPic"></a></td>
				<td class="itemInfo"><a
					href="${ctxPath}/shop/CommodityController?action=findByID&comNO=<%=comVo.getComNO() %>"
					class="commodityPage"><%=comVo.getComName()%></a></td>
				<td class="itemInfo"><%=comVo.getComPri()%></td>
				<td class="itemInfo">
					<form action="ShoppingCartServlet" method="post">
						<input type="hidden" name="comNo" value="<%=cartItem.getComNo()%>">
						<input type="hidden" name="memId" value="<%=cartItem.getMemId()%>">
						<input class="quantity-input" type="number" name="amount" min=0
							value="<%=cartItem.getComAmount()%>"
							data-original-amount="<%=cartItem.getComAmount()%>" /> <input
							type="hidden" name="action" value="changeAmount" />
						<button type="submit" class="updateButton">更新</button>
					</form>
				<td class="itemInfo"><%=(comVo.getComPri() * cartItem.getComAmount())%></td>
				<td class="itemInfo">
					<form action="ShoppingCartServlet" method="post" id="deleteForm">
						<input type="hidden" name="comNo" value="<%=cartItem.getComNo()%>">
						<input type="hidden" name="memId" value="<%=cartItem.getMemId()%>">
						<input type="hidden" name="action" value="delete" id="delaction">
						<button type="submit" class="deleteButton">刪除</button>
					</form>
				</td>
				<%
				}
				%>
			</tr>
		</table>

		<div class="handle">
			<span class="total-price">總金額: ${totalPrice}元</span>
			<form action="#" method="post">
				<%-- 				<input type="hidden" name="shoppcartlist" value="<%= %>"> --%>
				<button class="checkout-btn" type="submit">確認前往付款</button>
			</form>
		</div>
	</div>










	<div>
		<button class="goTopButton">▲</button>
	</div>
	<div class="footer">
		<jsp:include page="../front_footer.jsp" />
	</div>
	<script>
		$(document).ready(function() {
			$(window).scroll(function() {
				if ($(this).scrollTop() > 20) {
					$(".goTopButton").fadeIn();
				} else {
					$(".goTopButton").fadeOut();
				}
			});

			$(".goTopButton").click(function() {
				$("html, body").animate({
					scrollTop : 0
				}, "slow");
				return false;
			});
		});
	</script>
</body>
</html>