<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>購物車搜尋</title>
</head>
<body>
<h1>搜尋購物車</h1>

輸入會員編號:
<form action="ShoppingCartServlet" method="post">
           	<input type="text" name="memId" value="">
            <input type="hidden" name="action" value="getAll">
            <input type="submit" value="�e�X">

</form>

</body>
</html>