<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="shortcut icon" href="images/DIYLA_cakeLOGO.png"
	type="image/x-icon">
<title>會員登入</title>

    <!-- slider stylesheet -->
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"/>

    <!-- bootstrap core css -->
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"/>
    
    <!-- Custom styles for this template -->
    <link href="../css/style.css" rel="stylesheet"/>
    
    <!-- responsive style -->
    <link href="../css/responsive.css" rel="stylesheet"/>
    


</head>
<body>
	<jsp:include page="../front_header.jsp"/>
	<h4>會員登入</h4>
	<jsp:useBean id="memSvc" scope="session"
		class="com.cha102.diyla.member.MemberService" />
	<form method="post" action="">
		<label>請輸入帳號：</label> <input type="email" name="mem_emmail"
			placeholder="請輸入信箱"><br> <label>請輸入密碼：</label> <input
			type="password" name="mem_password" placeholder="請輸入6-12字(含英數字)"><br>
		<button type="submit" value="login">登入</button>
		<button type="button">註冊會員</button>

	</form>


	<jsp:include page="../front_footer.jsp"/>
</body>
</html>