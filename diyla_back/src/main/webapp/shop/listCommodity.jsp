<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>商品列表</title>
    <link rel="stylesheet" type="text/css" href="../css/listCommodity.css">
</head>
<body>
<div class="container">
    <div class="header">商品列表</div>
    <button class="add-button">新增商品</button>
    <div class="search-bar">
    </div>
    <table>
        <tr>
            <th>商品類別</th>
            <th>商品名稱</th>
            <th>價格</th>
            <th>數量</th>
            <th>狀態</th>
        </tr>
        <c:forEach items="commodity" var="${commodityList}"  >
            <tr>
                <td>${commodity.comNAME}</td>
                <td>價格</td>
                <td>數量</td>
                <td>狀態</td>
            </tr>
        </c:forEach>

    </table>
</div>

</body>
</html>
