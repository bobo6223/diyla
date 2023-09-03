<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.cha102.diyla.commodityModel.CommodityService"%>
<%@page import="com.cha102.diyla.commodityModel.CommodityVO"%>
<%@ page import="com.cha102.diyla.shoppingcart.ShoppingCartVO"%>
<%@ page import="com.cha102.diyla.shoppingcart.*"%>
<%@ page import="java.util.List"%>

<!DOCTYPE HTML PUBLIC>
<HTML>
<HEAD>
<TITLE>查詢結果</TITLE>
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
<link rel="stylesheet" type="text/css"
	href="${ctxPath}/css/shoppingcart.css">
<style>
</style>
</HEAD>
<BODY>
	<div class="topPage">
		<jsp:include page="/front_header.jsp" />
	</div>


	<div class="mainContent">
		<h1 class="heading">我的購物車</h1>
		
		<c:choose>
			<c:when test="${not empty shoppingCartList}">

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
					<c:forEach var="cartItem" items="${shoppingCartList}">
						<tr class="itemrow${cartItem.comNo} itemrow">
							<td class="itemInfo compic"><a
								href="${ctxPath}/shop/CommodityController?action=findByID&comNO=${cartItem.comNo}"
								class="commodityPage"> <img src="${cartItem.showPic}"
									class="comPic"></a></td>
							<td class="itemInfo"><a
								href="${ctxPath}/shop/CommodityController?action=findByID&comNO=${cartItem.comNo}"
								class="commodityPage">${cartItem.comName}</a></td>
							<td class="itemInfo">${cartItem.comPri}</td>
							<td class="itemInfo"><input type="hidden" name="comNo"
								value="${cartItem.comNo}" class="ucomNo"> <input
								type="hidden" name="memId" value="${cartItem.memId}"
								class="umemId"> <input class="quantity-input"
								type="number" name="amount" min="0"
								value="${cartItem.comAmount}"
								data-original-amount="${cartItem.comAmount}" />
								<button type="button" class="updateButton">更新</button></td>
							<td class="itemInfo">${cartItem.comPri*cartItem.comAmount}</td>
							<td class="itemInfo"><input type="hidden" name="comNo"
								value="${cartItem.comNo}" class="dcomNo"> <input
								type="hidden" name="memId" value="${cartItem.memId}"
								class="dmemId">
								<button type="button" class="deleteButton">刪除</button></td>
						</tr>
					</c:forEach>
				</table>
				<div class="handle">
					<button type="button" class="clearButton" id="clearCart">清空購物車</button>
					<input type="hidden" name="action" value="clear"> <a
						href="${ctxPath}/shop/CommodityController?action=listAll"
						class="shopPage">繼續購物</a> <span class="total-price">總金額:${totalPrice}元</span>
						<a href="http://localhost:8081/diyla_front/shopR/checkout/${memId}" class="checkout-btn" type="button" id="checkout">結帳</a>
				</div>
			</c:when>

			<c:otherwise>
				<div class="goShopping">
					<p class="tip">🧐你的購物車空空的🧐</p>
					<a class="shopLink"
						href="${ctxPath}/shop/CommodityController?action=listAll"> <span
						style="font-size: 30px;">去商店選購</span> <br> <svg
							xmlns="http://www.w3.org/2000/svg"
							xmlns:xlink="http://www.w3.org/1999/xlink" fill="#000000"
							version="1.1" id="Capa_1" width="100px" height="100px"
							viewBox="0 0 902.86 902.86" xml:space="preserve">
					<g>
					<g>
					<path
								d="M671.504,577.829l110.485-432.609H902.86v-68H729.174L703.128,179.2L0,178.697l74.753,399.129h596.751V577.829z     M685.766,247.188l-67.077,262.64H131.199L81.928,246.756L685.766,247.188z" />
					<path
								d="M578.418,825.641c59.961,0,108.743-48.783,108.743-108.744s-48.782-108.742-108.743-108.742H168.717    c-59.961,0-108.744,48.781-108.744,108.742s48.782,108.744,108.744,108.744c59.962,0,108.743-48.783,108.743-108.744    c0-14.4-2.821-28.152-7.927-40.742h208.069c-5.107,12.59-7.928,26.342-7.928,40.742    C469.675,776.858,518.457,825.641,578.418,825.641z M209.46,716.897c0,22.467-18.277,40.744-40.743,40.744    c-22.466,0-40.744-18.277-40.744-40.744c0-22.465,18.277-40.742,40.744-40.742C191.183,676.155,209.46,694.432,209.46,716.897z     M619.162,716.897c0,22.467-18.277,40.744-40.743,40.744s-40.743-18.277-40.743-40.744c0-22.465,18.277-40.742,40.743-40.742    S619.162,694.432,619.162,716.897z" /></g></g>
		</svg></a>
				</div>
			</c:otherwise>
		</c:choose>
		<button class="goTopButton">▲</button>
	</div>

	<div id="footer">
		<jsp:include page="/front_footer.jsp" />
	</div>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="../js/jquery-3.4.1.min.js"></script>
	<script>
		$(document).ready(function() {
							//置頂按鈕
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
	<script>
	$(document).ready(function(){
		$(".deleteButton").click(function() {
			const button =$(this);
			const comNo = button.closest('tr').find(".dcomNo").val();
// 			const memId =button.closest('tr').find(".dmemId").val();
			const memId = <%=session.getAttribute("memId")%>;

			console.log(comNo);
			console.log(memId);
			 swal({
		            title: "確定要從購物車刪除嗎？",
		            icon: "warning",
		            buttons: true
			 }).then((removeItem) => {
	            if (removeItem) {
	            	console.log("del");
	                deleteCartItem(comNo,memId);
	            }
	        });
	    });
	
	//刪除
	 function deleteCartItem(comNo,memId){
		 $.ajax({
	            url: "http://localhost:8081/diyla_front/shopR/delete",
	            type: "POST",
	            data: {
	                comNo: comNo,
	                memId: memId
	            },
	            dataType: "json",
	            success: function(data) {
	                if (data.success) {
	                	 swal("成功刪除", "", "success");
	                     // 延遲 1 秒後刷新
	                     setTimeout(function() {
	                         window.location.reload("#mainContent");
	                     }, 1500);
	                } else {
	                    // 處理刪除失敗的情況
	                }
	            },
	            error: function() {
	                // 處理AJAX錯誤的情況
	            }
	        });
	    }
	 
	 //修改
	 $('.updateButton').click(function(){
		 	const button = $(this);
		    const inputField = button.closest('tr').find('.quantity-input'); 
	        const originalAmount = parseInt(inputField.data('original-amount'));
	        const amount =  inputField.val(); 
	        const comNo = button.closest('tr').find(".ucomNo").val();
// 			const memId =button.closest('tr').find(".umemId").val();
			const memId = <%=session.getAttribute("memId")%>;
			console.log(amount);
			console.log(inputField);
			console.log(comNo);
	        if (amount === "0") {
	            swal({
	                title: "數量為 0，確定要從購物車移除嗎？",
	                icon: "warning",
	            	buttons : true
	            }).then((removeItem) => {
	                if (removeItem) {
	                	deleteCartItem(comNo,memId);
	                } else {
	                	inputField.val(originalAmount); // 恢復到原始數量
	                }
	            });
	        }
	        else{
	        	updateCartItem(comNo,memId,amount);
	        }
	    });
	 function updateCartItem(comNo,memId,amount) {
		fetch("http://localhost:8081/diyla_front/shopR/update",{
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
               memId:memId,
               comNo:comNo,
               comAmount:amount
            })
        }).then(response => response.json())
          .then(data => {
            if (data.success) {
                swal("成功修改", "", "success");
                // 延遲 1 秒後刷新
                setTimeout(function () {
                	window.location.reload("#mainContent");
                }, 1500);
            } else {
                // 處理刪除失敗的情況
            }
        })
        .catch(error => {
            // 處理錯誤情況
        });
	}
	 

	    
	    //清空購物車用
		 $('#clearCart').on('click',function(e){
				const memId = <%=session.getAttribute("memId")%>;
			 swal({
				 title: "確認將購物車清空？",
	                icon: "warning",
	            	buttons : true
			 }).then((deleteItem)=>{
				 if(deleteItem){
					 clearCartItem(memId);
				 }
			 });
			  
			 });
		 
		    //清空購物車用
		 function clearCartItem(memId){
			 $.ajax({
		            url: "http://localhost:8081/diyla_front/shopR/clear/"+${memId},
		            type: "DELETE",
		            data: {
		                memId: memId
// 		                action: "clear"
		            },
		            dataType: "json",
		            success: function(data) {
		                if (data.success) {
		                	 swal("成功清空購物車", "", "success");
		                     // 延遲 1 秒後刷新
		                     setTimeout(function() {
		                         window.location.reload("#mainContent");
		                     }, 1500);
		                } else {
		                    // 處理刪除失敗的情況
		                }
		            },
		            error: function() {
		                // 處理AJAX錯誤的情況
		            }
		        });
		    }
		 

	 
	});
	</script>
</BODY>
</HTML>