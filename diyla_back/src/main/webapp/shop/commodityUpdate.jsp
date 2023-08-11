<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>修改商品</title>
    <link rel="stylesheet" type="text/css" href="../css/commodityPage.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
</head>

<body>
<h1>修改商品</h1>
<div id="CONTENT">
    <!--商品欄開始-->
    <div class="prod">
        <form action="CommodityController" method="post" enctype="multipart/form-data">
            <div class="img">
                <img src="${commodity.showPic}" class="commodityPhoto" style="width: 100%">
            </div>
            <span style="display: block; color: red;">${errMsg["commodityPic"]}</span>
            <label for="product_image">商品圖片:</label>
            <input type="file" id="product_image" name="commodityPic" accept="image/*">

            <div class="commodityPage">
				<span class="commodityDescription">
					<span style="display: block; color: red;">${errMsg["commodityName"]}</span>
                    <label for="product_name">商品名稱:</label>
                    <input type="text" id="product_name" name="commodityName">
					<br>

					<label>商品類別：</label>
					<span>${classNameMap[commodity.comClassNo]}</span>
					<br>
					<label>商品描述：</label>
					<span>${commodity.comDes}</span> <br>
					<br>
					<label>價格：</label><span id="price">${commodity.comPri}</span>
					<br>
					<label>商品狀態：</label><span>${commodityState[commodity.comState]}</span>
					<br>
					<label>更新時間：</label>
				<fmt:formatDate value="${commodity.updateTime}"
                                pattern="yyyy-MM-dd HH:mm:ss"/> <br>
					<button type="submit" class="button">修改資料</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>
