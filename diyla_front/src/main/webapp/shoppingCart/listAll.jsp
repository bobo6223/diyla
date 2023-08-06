<%@page import="com.cha102.diyla.commodityModel.CommodityService"%>
<%@page import="com.cha102.diyla.commodityModel.CommodityVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cha102.diyla.shoppongcart.*"%>
<%@ page import="java.util.List"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>




<%
List<ShoppingCartVO> scvList = (List) request.getAttribute("shoppingCartList"); //EmpServlet.java(Concroller), 存入req的empVO物件
ShoppingCartService shoppingCartService = new ShoppingCartService();
CommodityService commodityService = new CommodityService();
CommodityVO comVo = null;
%>
<!DOCTYPE HTML PUBLIC>
<HTML>
<HEAD>
<TITLE>查詢結果</TITLE>
 <link rel="shortcut icon" href="${ctxPath}/images/DIYLA_cakeLOGO.png" type="image/x-icon">
 <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"/>

</head>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 20px;
}

.title {
	background-color: pink;
	font-weight: bold;
}

.cartTable {
	border-collapse: collapse;
	width: 100%;
}

.cartTable th, .cartTable td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: center;
}

.cartTable th {
	background-color: #f2f2f2;
}

.quantity-input {
	width: 50px;
	text-align: center;
}

.update-btn {
	margin-top: 5px;
	display: inline-block;
	width: 60px;
	margin: 0 auto;
}

.total-price {
	text-align: right;
	font-weight: bold;
}

.checkout-btn {
	display: block;
	width: 100px;
	margin: 20px auto;
	text-align: center;
	padding: 10px;
	background-color: #4CAF50;
	color: white;
	text-decoration: none;
	border-radius: 5px;
}

.checkout-btn:hover {
	background-color: #45a049;
}


</style>
</HEAD>
<BODY>
<jsp:include page="../front_header.jsp"/>
<div>
	會員編號: ${memId} 的購物車列表

	<table width="80%" class="cartTable" cellspacing="0" cellpadding="10px">
		<tr class="title">
			<td>商品名稱</td>
			<td>商品圖片</td>
			<td>單價</td>
			<td>數量</td>
			<td>金額</td>
			<td>操作</td>
		</tr>

		<%
		if (scvList != null && !scvList.isEmpty()) {
		%>
		<%
		for (ShoppingCartVO cartItem : scvList) {
			int comNo = cartItem.getComNo();
			comVo = commodityService.findByID(comNo);
		%>
		<%
		//     CommodityService comService = new CommodityService();
		%>
		<tr class="row">
			<td class="itemInfo"><%=comVo.getComName()%></td>
			<td class="itemInfo">圖片</td>
			<td class="itemInfo"><%=comVo.getComPri()%></td>
			<td class="itemInfo">
				<form action="ShoppingCartServlet" method="post">
					<input type="hidden" name="action" value="update" /> 
					<input class="quantity-input" type="number" name="amount" value="<%=cartItem.getComAmount()%>" /> 
					<input class="update-btn" type="submit" value="更新" />
				</form>
			<td class="itemInfo"><%=(comVo.getComPri() * cartItem.getComAmount())%></td>
			<td>
			    <form action="ShoppingCartServlet" method="post">
					<input type="hidden" name="action" value="delete"> 
					<input type="submit" value="刪 除" class="button">
				</form>
			</td>
		</tr>
		<%
		}
		%>
		<%
		} else {
		%>
		<p>購物車為空</p>
		<%
		}
		%>
		<tr>

		</tr>
	</table>
	</table>
	<form action="ShoppingCartServlet" method="post">
		<input type="submit" value="清空"> <input type="hidden"
			name="action" value="clear">
	</form>
	<p class="total-price">總金額: ${totalPrice}</p>
	<a class="checkout-btn" href="checkout">結帳</a>
</div>
<jsp:include page="../front_footer.jsp"/>
</BODY>
</HTML>